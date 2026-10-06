// Copyright 2026 bitHeads, Inc. All Rights Reserved.

#import <XCTest/XCTest.h>
#import "BrainCloudClient.hh"
#import "BrainCloudAuthentication.hh"
#include "braincloud/BrainCloudClient.h"
#include "braincloud/internal/DefaultBrainCloudComms.h"

namespace
{
// Capture the real authenticate request without a network connection or test account.
class AppCheckCaptureComms : public BrainCloud::DefaultBrainCloudComms
{
public:
    explicit AppCheckCaptureComms(BrainCloud::BrainCloudClient *client)
        : DefaultBrainCloudComms(client) { _appId = "test-app"; }

    void addToQueue(BrainCloud::ServerCall *call) override
    {
        payload = *call->getPayload();
        delete call->getCallback();
        delete call;
    }

    Json::Value payload;
};

class AppCheckCaptureClient : public BrainCloud::BrainCloudClient
{
public:
    AppCheckCaptureClient()
    {
        delete _brainCloudComms;
        _brainCloudComms = new AppCheckCaptureComms(this);
        _releasePlatform = "IOS";
        _appVersion = "1.2.3";
        _countryCode = "CA";
        _languageCode = "en";
        _timezoneOffset = 0.0;
        getAuthenticationService()->setClientLib("objc");
        getAuthenticationService()->initialize("profile", "anonymous");
    }

    Json::Value payload() const
    {
        return static_cast<AppCheckCaptureComms *>(_brainCloudComms)->payload;
    }
};

NSString *serialize(const Json::Value &payload)
{
    return [NSString stringWithUTF8String:Json::FastWriter().write(payload).c_str()];
}
}

// The production Objective-C service obtains its C++ client through this seam.
@interface AppCheckTestClient : BrainCloudClient
@property(nonatomic, assign) AppCheckCaptureClient *captureClient;
@end

@implementation AppCheckTestClient
- (void *)getInternalClient { return self.captureClient; }
@end

@interface TestAppCheck : XCTestCase
@end

@implementation TestAppCheck
{
    AppCheckCaptureClient *_capture;
    AppCheckTestClient *_client;
    BrainCloudAuthentication *_auth;
}

- (void)setUp
{
    [super setUp];
    _capture = new AppCheckCaptureClient();
    _client = [[AppCheckTestClient alloc] init];
    _client.captureClient = _capture;
    _auth = [_client authenticationService];
}

- (void)tearDown
{
    _auth = nil;
    _client = nil;
    delete _capture;
    _capture = nullptr;
    [super tearDown];
}

- (void)authenticate
{
    [_auth authenticateUniversal:@"user" password:@"password" forceCreate:YES
                 completionBlock:nil errorCompletionBlock:nil cbObject:nil];
}

- (NSString *)legacyPayload
{
    return [NSString stringWithFormat:
        @"{\"data\":{\"anonymousId\":\"anonymous\",\"authenticationToken\":\"password\","
         "\"authenticationType\":\"Universal\",\"clientLib\":\"objc\",\"clientLibVersion\":\"%s\","
         "\"compressResponses\":true,\"countryCode\":\"CA\",\"externalId\":\"user\","
         "\"forceCreate\":true,\"gameId\":\"test-app\",\"gameVersion\":\"1.2.3\","
         "\"languageCode\":\"en\",\"profileId\":\"profile\",\"releasePlatform\":\"IOS\","
         "\"timeZoneOffset\":0.0},\"operation\":\"AUTHENTICATE\",\"service\":\"authenticationV2\"}\n",
         _capture->getBrainCloudClientVersion().c_str()];
}

- (void)testOmittedTokenPreservesLegacyRequestBytes
{
    [self authenticate];
    XCTAssertEqualObjects(serialize(_capture->payload()), [self legacyPayload]);
}

- (void)testSuppliedTokenIsCopiedAndOnlyAddsAppCheckField
{
    NSMutableString *token = [@"opaque.é.token-\"quotes\"\\newline\n" mutableCopy];
    NSString *original = [token copy];
    [_auth setAppCheckToken:token];
    [token setString:@"changed-by-caller"];
    [self authenticate];
    Json::Value payload = _capture->payload();
    XCTAssertEqualObjects([NSString stringWithUTF8String:payload["data"]["appCheckToken"].asCString()], original);
    payload["data"].removeMember("appCheckToken");
    XCTAssertEqualObjects(serialize(payload), [self legacyPayload]);
}

- (void)testNilAndEmptyTokensRestoreLegacyRequest
{
    for (id clearedToken in @[@"", [NSNull null]])
    {
        [_auth setAppCheckToken:@"token"];
        [self authenticate];
        [_auth setAppCheckToken:clearedToken == [NSNull null] ? nil : clearedToken];
        [self authenticate];
        XCTAssertEqualObjects(serialize(_capture->payload()), [self legacyPayload]);
    }
}

- (void)testRefreshAppliesToNextRequestAndRetry
{
    [_auth setAppCheckToken:@"first"];
    [self authenticate];
    NSString *queued = serialize(_capture->payload());
    [_auth setAppCheckToken:@"refreshed"];
    XCTAssertEqualObjects(serialize(_capture->payload()), queued);
    _capture->getAuthenticationService()->retryPreviousAuthenticate(nullptr);
    XCTAssertEqualObjects([NSString stringWithUTF8String:_capture->payload()["data"]["appCheckToken"].asCString()], @"refreshed");
    [_auth setAppCheckToken:nil];
    _capture->getAuthenticationService()->retryPreviousAuthenticate(nullptr);
    XCTAssertEqualObjects(serialize(_capture->payload()), [self legacyPayload]);
}

- (void)testTokenPersistsAcrossMethodsButNotOtherOperationsOrClients
{
    [_auth setAppCheckToken:@"token"];
    [_auth authenticateAnonymous:YES completionBlock:nil errorCompletionBlock:nil cbObject:nil];
    XCTAssertEqualObjects([NSString stringWithUTF8String:_capture->payload()["data"]["appCheckToken"].asCString()], @"token");
    [self authenticate];
    XCTAssertEqualObjects([NSString stringWithUTF8String:_capture->payload()["data"]["appCheckToken"].asCString()], @"token");
    [_auth getServerVersion:nil errorCompletionBlock:nil cbObject:nil];
    XCTAssertFalse(_capture->payload()["data"].isMember("appCheckToken"));
    AppCheckCaptureClient other;
    AppCheckTestClient *otherClient = [[AppCheckTestClient alloc] init];
    otherClient.captureClient = &other;
    [[otherClient authenticationService] authenticateAnonymous:YES completionBlock:nil errorCompletionBlock:nil cbObject:nil];
    XCTAssertFalse(other.payload()["data"].isMember("appCheckToken"));
}
- (void)testProviderRotationAndRemoval
{
    [_auth setAppCheckToken:@"manual"];
    __block int calls = 0;
    [_auth setAppCheckTokenProvider:^(BCAppCheckTokenCompletion completion) {
        completion(++calls == 1 ? @"first" : @"fresh", nil);
    }];
    [self authenticate];
    XCTAssertTrue(_capture->payload().isNull());
    _capture->getAuthenticationService()->runAppCheckCallbacks();
    XCTAssertEqualObjects(@"first", [NSString stringWithUTF8String:_capture->payload()["data"]["appCheckToken"].asCString()]);
    [self authenticate];
    _capture->getAuthenticationService()->runAppCheckCallbacks();
    XCTAssertEqualObjects(@"fresh", [NSString stringWithUTF8String:_capture->payload()["data"]["appCheckToken"].asCString()]);
    [_auth setAppCheckTokenProvider:nil];
    [self authenticate];
    XCTAssertEqualObjects(@"manual", [NSString stringWithUTF8String:_capture->payload()["data"]["appCheckToken"].asCString()]);
}

@end
