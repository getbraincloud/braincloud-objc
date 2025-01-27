//
//  TestAuthentication.m
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-07.
//  Copyright (c) 2015 bitHeads. All rights reserved.
//

#import "TestFixtureBase.h"

@interface TestAuthentication : TestFixtureBase

@end

@implementation TestAuthentication

- (bool)authenticateOnSetup { return false; }

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testAuthenticateUniversal
{
    [[m_client authenticationService]
        authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                     password:[TestFixtureBase getUser:@"UserA"].m_password
                  forceCreate:true
              completionBlock:successBlock
         errorCompletionBlock:failureBlock
                     cbObject:nil];
    [self waitForResult];
    
    //test handoff
    [[m_client scriptService]runScript:@"createHandoffId" jsonScriptData:@"{}" completionBlock:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];
    
    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    NSDictionary *response = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"response"];
    
    NSString *handoffId = [response objectForKey:@"handoffId"];
    NSString *handoffToken = [response objectForKey:@"securityToken"];
    
    [[m_client authenticationService] authenticateHandoff:handoffId
                                            securityToken:handoffToken
                                          completionBlock:successBlock
                                     errorCompletionBlock:failureBlock
                                                 cbObject:nil];
    [self waitForResult];
    
    //test handoff
    [[m_client scriptService]runScript:@"CreateSettopHandoffCode" jsonScriptData:@"{}" completionBlock:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];
    
    NSData *ddata = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jjsonObj = [NSJSONSerialization JSONObjectWithData:ddata
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    NSDictionary *rresponse = [(NSDictionary *)[jjsonObj objectForKey:@"data"] objectForKey:@"response"];
    
    NSString *handoffCode = [rresponse objectForKey:@"handoffCode"];
    
    [[m_client authenticationService] authenticateSettopHandoff:handoffCode
                                                completionBlock:successBlock
                                           errorCompletionBlock:failureBlock
                                                       cbObject:nil];
    [self waitForResult];
    
}

//testing parameters,need example app to test google calls
- (void)testAuthenticateGoogleOpenId
{
    [[m_client authenticationService]
     authenticateGoogleOpenId:@"fail"
     idToken:@"fail"
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForFailedResult];
}
- (void)testAuthenticateGoogle
{
    [[m_client authenticationService]
     authenticateGoogle:@"fail"
     serverAuthCode:@"fail"
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForFailedResult];
}
- (void)testAuthenticateApple
{
    [[m_client authenticationService]
     authenticateApple:@"fail"
     identityToken:@"fail"
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForFailedResult];
}

- (void)testAuthenticateEmailPassword
{
    [[m_client authenticationService]
        authenticateEmailPassword:[TestFixtureBase getUser:@"UserB"].m_email
                     password:[TestFixtureBase getUser:@"UserB"].m_password
                  forceCreate:true
              completionBlock:successBlock
         errorCompletionBlock:failureBlock
                     cbObject:nil];
    [self waitForResult];
}
- (void)testResetEmailPassword
{
    NSString* email = @"braincloudunittest@gmail.com";
    
    [[m_client authenticationService] resetEmailPassword:email
                                     withCompletionBlock:successBlock
                                    errorCompletionBlock:failureBlock
                                                cbObject:nil];
    [self waitForResult];
}

- (void)testResetEmailPasswordAdvanced
{
    NSString* email = @"braincloudunittest@gmail.com";
    NSString* content = @"{\"fromAddress\": \"braincloudunittest@gmail.com\",\"fromName\": \"ryan\",\"replyToAddress\": \"braincloudunittest@gmail.com\",\"replyToName\": \"replyToName\", \"templateId\": \"8f14c77d-61f4-4966-ab6d-0bee8b13d090\", \"substitutions\": { \":name\": \"John Doe\",\":resetLink\": \"www.dummuyLink.io\"}, \"categories\": [\"category1\",\"category2\" ]}";
    
    [[m_client authenticationService] resetEmailPasswordAdvanced:email
                                                   serviceParams:content
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
    
    [[m_client authenticationService] resetUniversalIdPassword:[TestFixtureBase getUser:@"UserA"].m_id
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

    NSString* content = @"{\"fromAddress\": \"braincloudunittest@gmail.com\",\"fromName\": \"ryan\",\"replyToAddress\": \"braincloudunittest@gmail.com\",\"replyToName\": \"replyToName\", \"templateId\": \"8f14c77d-61f4-4966-ab6d-0bee8b13d090\", \"substitutions\": { \":name\": \"John Doe\",\":resetLink\": \"www.dummuyLink.io\"}, \"categories\": [\"category1\",\"category2\" ]}";
    
    [[m_client authenticationService] resetUniversalIdPasswordAdvanced:[TestFixtureBase getUser:@"UserA"].m_id
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
    
    [[m_client authenticationService] resetUniversalIdPasswordWithExpiry:[TestFixtureBase getUser:@"UserA"].m_id
     tokenTtlInMinutes:5
                                     withCompletionBlock:successBlock
                                    errorCompletionBlock:failureBlock
                                                cbObject:nil];
    [self waitForResult];
}

- (void)testResetUniversalIdPasswordAdvancedWithExpiry
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];

    NSString* content = @"{\"fromAddress\": \"braincloudunittest@gmail.com\",\"fromName\": \"ryan\",\"replyToAddress\": \"braincloudunittest@gmail.com\",\"replyToName\": \"replyToName\", \"templateId\": \"8f14c77d-61f4-4966-ab6d-0bee8b13d090\", \"substitutions\": { \":name\": \"John Doe\",\":resetLink\": \"www.dummuyLink.io\"}, \"categories\": [\"category1\",\"category2\" ]}";
    
    [[m_client authenticationService] resetUniversalIdPasswordAdvancedWithExpiry:[TestFixtureBase getUser:@"UserA"].m_id
                                                   serviceParams:content
                                                     tokenTtlInMinutes:5
                                             withCompletionBlock:successBlock
                                            errorCompletionBlock:failureBlock
                                                        cbObject:nil];
    //expect improper from address
    [self waitForResult];
}

- (void)testAuthenticateAdvanced
{
    [[m_client authenticationService]
     authenticateAdvanced:[AuthenticationTypeObjc Universal]
     authenticationIds:[[AuthenticationIdsObjc alloc] initWithExternalId:@"authAdvancedUser" authenticationToken:@"authAdvancedPass" authenticationSubType:nil]
     forceCreate:true
     extraJson:@"{\"AnswerToEverything\":42}"
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    
    [self waitForResult];
}

- (void)testAuthenticateUltra
{
    if ([m_serverUrl containsString:@"api-internal.braincloudservers.com"] == NO &&
        [m_serverUrl containsString:@"internala.braincloudservers.com"] == NO &&
        [m_serverUrl containsString:@"api.internalg.braincloudservers.com"] == NO /* &&
        [m_serverUrl containsString:@"api.ultracloud.ultra.io"] == NO*/)
        return;

    // Authenticate universal first so we can run a script to get the ultra JWT
    [[m_client authenticationService]
        authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                     password:[TestFixtureBase getUser:@"UserA"].m_password
                  forceCreate:true
              completionBlock:successBlock
         errorCompletionBlock:failureBlock
                     cbObject:nil];
    [self waitForResult];
    
    // Get ultra id_token from the JWT
    [[m_client scriptService]runScript:@"getUltraToken" jsonScriptData:@"{}" completionBlock:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];
    
    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    NSDictionary *JWT = [(NSDictionary *)[(NSDictionary *)[(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"response"] objectForKey:@"data"] objectForKey:@"json"];
    
    NSString *id_token = [JWT objectForKey:@"id_token"];
    
    // Log out
    [[m_client playerStateService] logout:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];
    
    // Auth with Ultra
    [[m_client authenticationService] authenticateUltra:@"braincloud1"
                                           ultraIdToken:id_token
                                            forceCreate:YES
                                        completionBlock:successBlock
                                   errorCompletionBlock:failureBlock
                                               cbObject:nil];
    [self waitForResult];
}

- (void)testGetServerVersion
{
    [[m_client authenticationService] getServerVersion:successBlock
                                  errorCompletionBlock:failureBlock
                                              cbObject:nil];
    [self waitForResult];
}

@end
