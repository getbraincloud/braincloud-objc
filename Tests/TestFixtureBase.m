//
//  TestFixtureBase.m
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-05.
//  Copyright (c) 2015 bitHeads. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestFixtureBase.h"
#import "TestUser.h"
#import "AuthenticationTypeObjc.hh"
#include <stdlib.h>


#define ID_FILE_NAME = "ids.txt"

@implementation FileUploadCompletedDetails
@end

@implementation FileUploadFailedDetails
@end

// a mechanism for multifile upload
@implementation FileUploadProgress
- (id)init
{
    self = [super init];

    _fileUploadCompletedReceived = [[NSMutableArray alloc] init];
    _fileUploadFailedReceived = [[NSMutableArray alloc] init];

    return self;
}
-(void) clearProgress
{
    [_fileUploadCompletedReceived removeAllObjects];
    [_fileUploadFailedReceived removeAllObjects];
}
-(void) updateCompleted:(FileUploadCompletedDetails*)details
{
    [_fileUploadCompletedReceived addObject:details];
}
-(void) updateFailed:(FileUploadFailedDetails*)details
{
    [_fileUploadFailedReceived addObject:details];
}
-(NSUInteger) countCompleted
{
    return [_fileUploadCompletedReceived count];
}
-(NSUInteger) countFailed
{
    return [_fileUploadFailedReceived count];
}
-(FileUploadFailedDetails*) failedDetailsAtIndex:(NSUInteger)index
{
    return [_fileUploadFailedReceived objectAtIndex:index];
}
-(FileUploadCompletedDetails*) completedDetailsAtIndex:(NSUInteger)index
{
    return [_fileUploadFailedReceived objectAtIndex:index];
}
@end

NSMutableDictionary *m_users;

@implementation TestFixtureBase

// braincloud connection data for STATIC methods
// instance methods can access corresponding m_ members
static NSString *parentLevel;
static NSString *childAppId;
static NSString *childSecret;
static NSString *serverUrl;
static NSString *appId;
static NSString *secret;
static NSString *bcversion;
static NSString *peerName;

+(NSString *) appId{ return appId;}
+(NSString *) parentLevel{ return parentLevel; }
+(NSString *) childAppId{ return childAppId; }
+(NSString *) childSecret{ return childSecret; }
+(NSString *) serverUrl{ return serverUrl; }
+(NSString *) secret{ return secret; }
+(NSString *) bcversion{ return bcversion; }
+(NSString *) peerName{ return peerName; }

long createFile(const char * in_path, int64_t in_size)
{
    FILE* fp = NULL;
    fp = fopen(in_path, "w");
    if (fp == NULL)
    {
        return -1;
    }
    for (int i = 0; i < in_size; ++i)
    {
        fputc('!', fp);
    }
    fseek(fp, 0, SEEK_END);
    long fileLen = ftell(fp);
    fclose(fp);
    fp = NULL;
    return fileLen;
}

- (id)initWithInvocation:(NSInvocation *)invocation
{
    self = [super initWithInvocation:invocation];

    if (self)
    {
        __unsafe_unretained typeof(self) safeSelf = self;
        __weak TestFixtureBase *weakSelf = self;
        successBlock = ^(NSString *serviceName, NSString *serviceOperation, NSString *jsonData,
                         BCCallbackObject cbObject)
        {
			if(self->_expectFail >= 1)
            {
                _XCTPrimitiveFail(weakSelf, @"%@", jsonData);
            }
            
			self->_apiCountExpected -= 1;
			if (self->_apiCountExpected <= 0)
            {
				self->_result = true;
            }
			self->_jsonResponse = jsonData;
        };

        failureBlock = ^(NSString *serviceName, NSString *serviceOperation, NSInteger statusCode,
                         NSInteger returnCode, NSString *statusMessage, BCCallbackObject cbObject)
        {
			if(self->_expectFail == 0)
            {
                _XCTPrimitiveFail(weakSelf, @"%@", statusMessage);
            }
            
            self->_apiCountExpected -= 1;
			if (self->_apiCountExpected <= 0)
            {
                self->_result = true;
            }
            self->_statusCode = statusCode;
            self->_reasonCode = returnCode;
            self->_statusMessage = statusMessage;
        };
        
        globalErrorBlock = ^(NSString *serviceName, NSString *serviceOperation, NSInteger statusCode,
                              NSInteger returnCode, NSString *statusMessage, BCCallbackObject cbObject)
        {
            if(self->_expectFail == 0)
            {
                _XCTPrimitiveFail(weakSelf, @"%@", statusMessage);
            }
            
            self->_apiCountExpected -= 1;
            if (self->_apiCountExpected <= 0)
            {
                self->_result = true;
            }
            self->_statusCode = statusCode;
            self->_reasonCode = returnCode;
            self->_statusMessage = statusMessage;
            self->_globalErrorCount += 1;
        };
        
        networkErrorBlock = ^()
        {
            if(self->_expectFail == 0)
            {
                _XCTPrimitiveFail(weakSelf, @"Network error block unexpected");
            }
            
            self->_apiCountExpected -= 1;
            if (self->_apiCountExpected <= 0)
            {
                self->_result = true;
            }
           // self->_statusCode = statusCode;
           // _reasonCode = returnCode;
           // _statusMessage = statusMessage;
            self->_networkErrorCount += 1;
        };

        eventBlock = ^(NSString *eventsJson) {
            self->_eventCallbackReceived = true;
            self->_eventCallbackJson = eventsJson;
        };
        
        _fileUploadProgress = [[FileUploadProgress alloc] init];
        
        fileUploadCompletedBlock = ^(NSString *fileUploadId, NSString *jsonResponse) {
            FileUploadCompletedDetails * details = [[FileUploadCompletedDetails alloc] init];
            [details setFileUploadId:fileUploadId];
            [details setJsonResponse:jsonResponse];
            [safeSelf->_fileUploadProgress updateCompleted:details];
        };
        fileUploadFailedBlock = ^(NSString *fileUploadId, NSInteger status, NSInteger reasonCode, NSString *jsonResponse) {
            FileUploadFailedDetails * details = [[FileUploadFailedDetails alloc] init];
            [details setFileUploadId:fileUploadId];
            [details setStatus:status];
            [details setReasonCode:reasonCode];
            [details setJsonResponse:jsonResponse];
            [_fileUploadProgress updateFailed:details];
        };
        
        rewardBlock = ^(NSString *eventsJson) {
            
            NSData *data = [eventsJson dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
            int apiRewardsSize = 0;
            apiRewardsSize = (int) [(NSArray *)[jsonObj objectForKey:@"apiRewards"] count];
            self->_rewardCallbacksReceived += 1;
            self->_apiRewardsReceived += apiRewardsSize;
            self->_rewardCallbackJson = eventsJson;
        };
        
        rttConnectSuccessBlock = ^(BCCallbackObject cbObject)
        {
            if(self->_expectFail >= 1)
            {
                _XCTPrimitiveFail(weakSelf, @"");
            }
            
            self->_apiCountExpected -= 1;
            if (self->_apiCountExpected <= 0)
            {
               self->_result = true;
            }
        };

        rttConnectFailureBlock = ^(NSString *errorMessage, BCCallbackObject cbObject)
        {
            if(self->_expectFail == 0)
            {
                _XCTPrimitiveFail(weakSelf, @"%@", errorMessage);
            }
            
            self->_apiCountExpected -= 1;
            if (self->_apiCountExpected <= 0)
            {
                self->_result = true;
            }
            self->_statusMessage = errorMessage;
        };

        rttEventBlock = ^(NSString *jsonData, BCCallbackObject cbObject)
        {
            if(self->_expectFail >= 1)
            {
                _XCTPrimitiveFail(weakSelf, @"");
            }
            
            self->_apiCountExpected -= 1;
            if (self->_apiCountExpected <= 0)
            {
               self->_result = true;
            }
            self->_jsonResponse = jsonData;
        };
    }
    return self;
}

- (void)setUp
{
    m_bcWrapper = [[BrainCloudWrapper alloc] init];
        
    [super setUp];
    [TestFixtureBase loadIds];
    m_appId = appId;
    m_parentLevel = parentLevel;
    m_childAppId = childAppId;
    m_childSecret = childSecret;
    m_serverUrl = serverUrl;
    m_secret = secret;
    m_version = bcversion;
    m_peerName = peerName;
    m_client = [m_bcWrapper getBCClient];
    NSDictionary* secretMap = @{
        m_appId      : m_secret, 
        m_childAppId : m_childSecret,
    };
    [m_client initializeWithApps:m_serverUrl
                    defaultAppId:m_appId
                       secretMap:secretMap
                      appVersion:m_version];
    [m_client enableLogging:TRUE];
    [self createUsers];

    if ([self authenticateOnSetup])
    {
        [[m_client authenticationService]
            authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                         password:[TestFixtureBase getUser:@"UserA"].m_password
                      forceCreate:true
                  completionBlock:successBlock
             errorCompletionBlock:failureBlock
                         cbObject:nil];
        [self waitForResult];
    }
}

- (void)tearDown
{
    [m_client resetCommunication];
    [[m_client authenticationService] clearSavedProfile];
    [super tearDown];
}

// static function to loads ids.txt
// sets members accessible for static methods through getters
+ (void)loadIds
{
    // syntax if loading file from bundle of a running app
    // NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ids" ofType:@"txt"];

    // syntax if loading file from XTC
    NSString *filePath =
        [[NSBundle bundleForClass:[self class]] pathForResource:@"ids" ofType:@"txt"];

    NSString *fileContents =
        [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];

    for (NSString *line in
         [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]])
    {
        if ([line hasPrefix:@"appId"])
        {
            NSRange range = [line rangeOfString:@"="];
            appId = [line substringFromIndex:range.location + 1];
        }
        else if ([line hasPrefix:@"serverUrl"])
        {
            NSRange range = [line rangeOfString:@"="];
            serverUrl = [line substringFromIndex:range.location + 1];
        }
        else if ([line hasPrefix:@"secret"])
        {
            NSRange range = [line rangeOfString:@"="];
            secret = [line substringFromIndex:range.location + 1];
        }
        else if ([line hasPrefix:@"version"])
        {
            NSRange range = [line rangeOfString:@"="];
            bcversion = [line substringFromIndex:range.location + 1];
        }
        else if ([line hasPrefix:@"childAppId"])
        {
            NSRange range = [line rangeOfString:@"="];
            childAppId = [line substringFromIndex:range.location + 1];
        }
        else if ([line hasPrefix:@"childSecret"])
        {
            NSRange range = [line rangeOfString:@"="];
            childSecret = [line substringFromIndex:range.location + 1];
        }
        else if ([line hasPrefix:@"parentLevelName"])
        {
            NSRange range = [line rangeOfString:@"="];
            parentLevel = [line substringFromIndex:range.location + 1];
        }
        else if ([line hasPrefix:@"peerName"])
        {
            NSRange range = [line rangeOfString:@"="];
            peerName = [line substringFromIndex:range.location + 1];
        }
    }
}

+ (void)waitForResponse:(BrainCloudClient*)bc
          watchResult:(bool*)watchResult
{
    long maxWait = MAX_WAIT_SECS * 1000;

    while (!*watchResult && maxWait > 0)
    {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
        maxWait -= 10;
        [bc runCallBacks];
    }
}

- (void)waitForResult
{
    [self waitForResultExpectedCount:1 expectFail:false];
}

- (void)waitForFailedResult
{
    [self waitForResultExpectedCount:1 expectFail:true];
}

- (void)waitForResultExpectedCount:(int)numApiCalls
{
    [self waitForResultExpectedCount:numApiCalls expectFail:false];
}

- (void)waitForResultExpectedCount:(int)numApiCalls
                        expectFail:(bool)expectFail
{
    [self reset];
    _apiCountExpected = numApiCalls;
    _expectFail = expectFail ? 1 : 0;
    
    [TestFixtureBase waitForResponse:m_client watchResult: &_result];
    
    if (!_result)
    {
        _XCTPrimitiveFail(self, @"Timed out");
    }
}

- (void)reset
{
    _result = false;
    _apiCountExpected = 0;
    _jsonResponse = @"";
    _statusCode = 0;
    _reasonCode = 0;
    _statusMessage = @"";
    _eventCallbackReceived = false;
    _eventCallbackJson = @"";
    _rewardCallbacksReceived = 0;
    _rewardCallbackJson = @"";
    _apiRewardsReceived = 0;
    _expectFail = 0;
    
    //  We dont reset braincloud here, but only the test results
}

- (void)createUsers
{
    if (m_users != nil) return;
    m_users = [[NSMutableDictionary alloc] init];
    [self createUser:@"UserA" suffix:arc4random()];
    [self createUser:@"UserB" suffix:arc4random()];
    [self createUser:@"UserC" suffix:arc4random()];

    [[m_client playerStateService] logout:successBlock
                     errorCompletionBlock:failureBlock
                                 cbObject:nil];
    [self waitForResult];
}

- (void)createUser:(NSString *)prefix suffix:(int)suffix
{
    TestUser *user = [[TestUser alloc] initWithIds:prefix suffix:suffix];
    user.m_profileId = [self authenticateUser:user.m_id password:user.m_password];
    
    [[m_client playerStateService] updateContactEmail:@"braincloudunittest@gmail.com"
                                          completionBlock:successBlock
                                     errorCompletionBlock:failureBlock
                                                 cbObject:nil];
    [self waitForResult];
    
    [m_users setObject:user forKey:prefix];
}

- (NSString *)authenticateUser:(NSString *)userId password:(NSString *)password
{
    [[m_client authenticationService] authenticateUniversal:userId
                                                   password:password
                                                forceCreate:true
                                            completionBlock:successBlock
                                       errorCompletionBlock:failureBlock
                                                   cbObject:nil];
    [self waitForResult];
    NSString *playerId = [m_client authenticationService].profileID;
    [[m_client authenticationService] clearSavedProfile];
    return playerId;
}

+ (NSDictionary *)getDataFromResponse:(NSString *)jsonResponse
{
    NSData *data = [jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    return (NSDictionary *)[jsonObj objectForKey:@"data"];
}

+ (TestUser *)getUser:(NSString *)userId
{
    return [m_users objectForKey:userId];
}

- (bool)authenticateOnSetup { return true; }

- (bool)goToChildProfile
{
    [[m_client identityService] switchToSingletonChildProfile:m_childAppId
                                         forceCreate:true
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
    return self->_result;
}

- (bool)goToParentProfile
{
    [[m_client identityService] switchToParentProfile:m_parentLevel
                                              completionBlock:successBlock
                                         errorCompletionBlock:failureBlock
                                                     cbObject:nil];
    [self waitForResult];
    return self->_result;
}

- (bool)attachPeer:(NSString*)user
{
    TestUser* tUser = [TestFixtureBase getUser:user];
    [[m_client identityService] attachPeerProfile:m_peerName
                                       externalId:tUser.m_id
                              authenticationToken:tUser.m_password
                               authenticationType:[AuthenticationTypeObjc Universal]
                                 externalAuthName:nil
                                      forceCreate:true
                                      completionBlock:successBlock
                                 errorCompletionBlock:failureBlock
                                             cbObject:nil];
    [self waitForResult];
    return self->_result;
}

- (bool)detachPeer
{
    [[m_client identityService] detachPeer:m_peerName
                                      completionBlock:successBlock
                                 errorCompletionBlock:failureBlock
                                             cbObject:nil];
    [self waitForResult];
    return self->_result;
}

+ (NSString *)getJsonString:(id)object
{
    NSError *writeError = nil;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:&writeError];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return jsonString;
}

+ (void)setUp {
}

@end
