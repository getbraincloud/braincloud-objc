//
//  TestAuthentication.m
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-07.
//  Copyright (c) 2015 bitHeads. All rights reserved.
//

#import "TestFixtureBase.h"
#import "BCServiceOperation.hh"
#import "BCServiceName.hh"
#import "BCOperationParam.hh"
#import "ReasonCodes.hh"
#import "StatusCodes.hh"
#import "BrainCloudWrapper.hh"

@interface TestWrapper : TestFixtureBase

@end

@implementation TestWrapper

- (bool)authenticateOnSetup { return false; }

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testAuthenticateAnonymous
{
    [m_bcWrapper initialize:m_serverUrl secretKey:m_secret appId:m_appId appVersion:m_version companyName:@"wrapper" appName:@"unittest"];
    
    [m_bcWrapper authenticateAnonymous:successBlock
                  errorCompletionBlock:failureBlock
                              cbObject:nil];
    [self waitForResult];
    [self reset];
    
	// read IDs fromd device
    NSString *anonId = [m_bcWrapper storedAnonymousId];
    NSString *profileId = [m_bcWrapper storedProfileId];
    
    [m_bcWrapper authenticateAnonymous:successBlock
                  errorCompletionBlock:failureBlock
                              cbObject:nil];
    [self waitForResult];
    
    if (![anonId isEqualToString:[m_bcWrapper storedAnonymousId] ])
    {
        _XCTPrimitiveFail(self, @"Anonymous ids not equal");
    }
    
    if (![profileId isEqualToString:[m_bcWrapper storedProfileId] ])
    {
        _XCTPrimitiveFail(self, @"Profile ids not equal");
    }
}

- (void)testAuthenticateUniversal
{
    [m_bcWrapper initialize:m_serverUrl secretKey:m_secret appId:m_appId appVersion:m_version companyName:@"wrapper" appName:@"unittest"];
    
    [m_bcWrapper authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                                                  password:[TestFixtureBase getUser:@"UserA"].m_password
                                               forceCreate:YES
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForResult];
    [self reset];
    
    m_bcWrapper.alwaysAllowProfileSwitch = YES;

    [m_bcWrapper
      authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                   password:[TestFixtureBase getUser:@"UserA"].m_password
                forceCreate:true
            completionBlock:successBlock
       errorCompletionBlock:failureBlock
                   cbObject:nil];
    [self waitForResult];
}

- (void)testSwitchAnonToUniversal
{
    [m_bcWrapper initialize:m_serverUrl secretKey:m_secret appId:m_appId appVersion:m_version companyName:@"wrapper" appName:@"unittest"];
    
    [m_bcWrapper authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                                                  password:[TestFixtureBase getUser:@"UserA"].m_password
                                               forceCreate:YES
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForResult];
    
    //so we check for something else. expected 40307 - token not matching user
    [m_bcWrapper smartSwitchAuthenticateUniversal:@"invalidProfileID"
                                         password:@"invalidPassword"
                                      forceCreate:YES
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
    
    [self reset];
    
}

- (void)testSwitchUniversalToEmail
{
    [m_bcWrapper initialize:m_serverUrl secretKey:m_secret appId:m_appId appVersion:m_version companyName:@"wrapper" appName:@"unittest"];
    
    [m_bcWrapper authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id password:[TestFixtureBase getUser:@"UserA"].m_password forceCreate:true completionBlock:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    
    [self waitForResult];
    [self reset];
    
    [m_bcWrapper smartSwitchAuthenticateEmailPassword:[TestFixtureBase getUser:@"UserA"].m_email
                                         password:[TestFixtureBase getUser:@"UserA"].m_password
                                      forceCreate:YES
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForResult];
    [self reset];
}


- (void)testSwitchNoAuth
{
    [m_bcWrapper initialize:m_serverUrl secretKey:m_secret appId:m_appId appVersion:m_version companyName:@"wrapper" appName:@"unittest"];
    
    
    [m_bcWrapper smartSwitchAuthenticateEmailPassword:[TestFixtureBase getUser:@"UserA"].m_email
                                             password:[TestFixtureBase getUser:@"UserA"].m_password
                                          forceCreate:YES
                                      completionBlock:successBlock
                                 errorCompletionBlock:failureBlock
                                             cbObject:nil];
    [self waitForResult];
    [self reset];
}

- (void)testResetEmailPassword
{
    NSString* email = @"braincloudunittest@gmail.com";
    
    [m_bcWrapper resetEmailPassword:email
                 withCompletionBlock:successBlock
                errorCompletionBlock:failureBlock
                            cbObject:nil];
    [self waitForResult];
}

- (void)testResetEmailPasswordAdvanced
{
    NSString* email = @"braincloudunittest@gmail.com";
    NSString* content = @"{\"fromAddress\": \"fromAddress\",\"fromName\": \"fromName\",\"replyToAddress\": \"replyToAddress\",\"replyToName\": \"replyToName\", \"templateId\": \"8f14c77d-61f4-4966-ab6d-0bee8b13d090\",\"subject\": \"subject\",\"body\": \"Body goes here\", \"substitutions\": { \":name\": \"John Doe\",\":resetLink\": \"www.dummuyLink.io\"}, \"categories\": [\"category1\",\"category2\" ]}";
    
    [m_bcWrapper resetEmailPasswordAdvanced:email
                               serviceParams:content
                         withCompletionBlock:successBlock
                        errorCompletionBlock:failureBlock
                                    cbObject:nil];
    //expect improper from address
    [self waitForFailedResult];
}

- (void)testResetEmailPasswordWithExpiry
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    
    NSString* email = @"braincloudunittest@gmail.com";
    
    [m_bcWrapper resetEmailPasswordWithExpiry:email
                                       tokenTtlInMinutes:5
                                     withCompletionBlock:successBlock
                                    errorCompletionBlock:failureBlock
                                                cbObject:nil];
    [self waitForResult];
}

- (void)testResetEmailPasswordAdvancedWithExpiry
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    
    NSString* email = @"braincloudunittest@gmail.com";
    NSString* content = @"{\"fromAddress\": \"braincloudunittest@gmail.com\",\"fromName\": \"braincloudunittest\",\"replyToAddress\": \"braincloudunittest@gmail.com\",\"replyToName\": \"replyToName\", \"templateId\": \"8f14c77d-61f4-4966-ab6d-0bee8b13d090\", \"substitutions\": { \":name\": \"John Doe\",\":resetLink\": \"www.dummuyLink.io\"}, \"categories\": [\"category1\",\"category2\" ]}";
    
    [m_bcWrapper resetEmailPasswordAdvancedWithExpiry:email
                                                   serviceParams:content
                                               tokenTtlInMinutes:5
                                             withCompletionBlock:successBlock
                                            errorCompletionBlock:failureBlock
                                                        cbObject:nil];
    //expect improper from address
    [self waitForResult];
}

- (void)testResetUniversalIdPassword
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    
    [m_bcWrapper resetUniversalIdPassword:[TestFixtureBase getUser:@"UserA"].m_id
                                     withCompletionBlock:successBlock
                                    errorCompletionBlock:failureBlock
                                                cbObject:nil];
    [self waitForResult];
}

- (void)testResetUniversalIdPasswordAdvanced
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];

    NSString* content = @"{\"fromAddress\": \"braincloudunittest@gmail.com\",\"fromName\": \"braincloudunittest\",\"replyToAddress\": \"braincloudunittest@gmail.com\",\"replyToName\": \"replyToName\", \"templateId\": \"8f14c77d-61f4-4966-ab6d-0bee8b13d090\", \"substitutions\": { \":name\": \"John Doe\",\":resetLink\": \"www.dummuyLink.io\"}, \"categories\": [\"category1\",\"category2\" ]}";
    
    [m_bcWrapper resetUniversalIdPasswordAdvanced:[TestFixtureBase getUser:@"UserA"].m_id
                                                   serviceParams:content
                                             withCompletionBlock:successBlock
                                            errorCompletionBlock:failureBlock
                                                        cbObject:nil];
    //expect improper from address
    [self waitForResult];
}

- (void)testResetUniversalIdPasswordWithExpiry
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    
    [m_bcWrapper resetUniversalIdPasswordWithExpiry:[TestFixtureBase getUser:@"UserA"].m_id
     tokenTtlInMinutes:5
                                     withCompletionBlock:successBlock
                                    errorCompletionBlock:failureBlock
                                                cbObject:nil];
    [self waitForResult];
}

- (void)testReconnect
{
    [m_bcWrapper initialize:m_serverUrl secretKey:m_secret appId:m_appId appVersion:m_version companyName:@"wrapper" appName:@"unittest"];

    [m_bcWrapper authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                                                  password:[TestFixtureBase getUser:@"UserA"].m_password
                                               forceCreate:YES
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForResult];

	[m_bcWrapper logout:false withCompletionBlock:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];

    
    [m_bcWrapper reconnect:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];
}

- (void)testReconnectMissingProfile
{
    [m_bcWrapper initialize:m_serverUrl secretKey:m_secret appId:m_appId appVersion:m_version companyName:@"wrapper" appName:@"unittest"];

    [m_bcWrapper authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                                                  password:[TestFixtureBase getUser:@"UserA"].m_password
                                               forceCreate:YES
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForResult];

	[m_bcWrapper logout:true withCompletionBlock:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];

    
    [m_bcWrapper reconnect:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForFailedResult];
}

- (void)testLogoutRememberUser
{
    [m_bcWrapper initialize:m_serverUrl secretKey:m_secret appId:m_appId appVersion:m_version companyName:@"wrapper" appName:@"unittest"];

    [m_bcWrapper authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                                                  password:[TestFixtureBase getUser:@"UserA"].m_password
                                               forceCreate:YES
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForResult];
    
    NSString *profileId = [m_bcWrapper storedProfileId];
    
    [m_bcWrapper logout:false withCompletionBlock:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];
    
    
    if (![profileId isEqualToString:[m_bcWrapper storedProfileId]])
    {
        _XCTPrimitiveFail(self, @"Logout expecting user remembered");
    }
}

- (void)testLogoutForgetUser
{
    [m_bcWrapper initialize:m_serverUrl secretKey:m_secret appId:m_appId appVersion:m_version companyName:@"wrapper" appName:@"unittest"];

    [m_bcWrapper authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                                                  password:[TestFixtureBase getUser:@"UserA"].m_password
                                               forceCreate:YES
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForResult];
    
    [m_bcWrapper logout:true withCompletionBlock:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];
    
    if ([m_bcWrapper storedProfileId] != nil)
    {
        _XCTPrimitiveFail(self, @"Logout expecting user forgotten");
    }
}

- (void)testServiceNameAccessIsValid
{
    NSString *authName = [BCServiceName Presence];
    NSLog(@"Service Operation Name: %@", authName);
    
    XCTAssertNotNil(authName, @"Presence should not be nil(null)");
    XCTAssertTrue(authName.length > 0, @"Presence should not be empty");
}

- (void)testServiceOperationAccessIsValid
{
    NSString *authOperation = [BCServiceOperation GetLobbyData];
    NSLog(@"Service Operation: %@", authOperation);
    
    XCTAssertNotNil(authOperation, @"GetLobbyData should not be nil (null)");
    XCTAssertTrue(authOperation.length > 0, @"GetLobbyData should not be empty");
}

- (void)testReasonCodeAccessIsValid
{
    NSInteger reasonCode = MERGE_PROFILES;
    NSInteger expectedResult = 40212;
    NSLog(@"Reason Code: %ld", (long)reasonCode);
    
    XCTAssertEqual((long)reasonCode, expectedResult, @"Result should be 40212 for MERGE_PROFILE reason code");
    XCTAssertTrue(reasonCode > 0, @"MERGE_PROFILE should not be 0");
}

- (void)testStatusCodeAccessIsValid
{
    NSInteger statusCode = HTTP_GATEWAY_TIMEOUT;
    NSInteger expectedResult = 504;
    NSLog(@"Status Code: %ld", (long)statusCode);
    
    XCTAssertEqual((long)statusCode, expectedResult, @"Result should be 504 for HTTP_GATEWAY_TIMEOUT status code");
    XCTAssertTrue(statusCode > 0, @"HTTP_GATEWAY_TIMEOUT should not be 0");
}

- (void) testOperationParamAccessIsValid
{
    NSString *operationParam = [BCOperationParam LobbyCriteria];
    NSLog(@"Operation Param: %@", operationParam);
    
    XCTAssertNotNil(operationParam, @"LobbyCriteria should not be nil (null)");
    XCTAssertTrue(operationParam.length > 0, @"LobbyCriteria should not be empty");
}

@end
