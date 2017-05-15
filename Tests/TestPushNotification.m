//
//  TestPushNotification.m
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-07.
//  Copyright (c) 2015 bitHeads. All rights reserved.
//

#import "PlatformObjc.hh"
#import "TestFixtureBase.h"

@interface TestPushNotification : TestFixtureBase

@end

@implementation TestPushNotification

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testDeregisterAllTokens
{
    [[m_client pushNotificationService] deregisterAllPushNotificationDeviceTokens:successBlock
                                                             errorCompletionBlock:failureBlock
                                                                         cbObject:nil];
    [self waitForResult];
}

- (void)testDeregisterToken
{
    PlatformObjc *platform = [PlatformObjc iOS];
    [[m_client pushNotificationService] registerPushNotificationDeviceToken:platform
                                                                deviceToken:@"GARBAGE_TOKEN"
                                                            completionBlock:successBlock
                                                       errorCompletionBlock:failureBlock
                                                                   cbObject:nil];
    [self waitForResult];

    [self reset];
    [[m_client pushNotificationService] deregisterPushNotificationDeviceToken:platform
                                                                  deviceToken:@"GARBAGE_TOKEN"
                                                              completionBlock:successBlock
                                                         errorCompletionBlock:failureBlock
                                                                     cbObject:nil];
    [self waitForResult];
}

- (void)testRegisterToken
{
    PlatformObjc *platform = [PlatformObjc iOS];
    [[m_client pushNotificationService] registerPushNotificationDeviceToken:platform
                                                                deviceToken:@"GARBAGE_TOKEN"
                                                            completionBlock:successBlock
                                                       errorCompletionBlock:failureBlock
                                                                   cbObject:nil];
    [self waitForResult];
}

- (void)testSendSimpleNotification
{
    [[m_client pushNotificationService] sendSimplePushNotification:[TestFixtureBase getUser:@"UserA"].m_profileId
                                                           message:@"Test message."
                                                   completionBlock:successBlock
                                              errorCompletionBlock:failureBlock
                                                          cbObject:nil];
    [self waitForResult];
}

- (void)testSendRichNotification
{
    [[m_client pushNotificationService] sendRichPushNotification:[TestFixtureBase getUser:@"UserA"].m_profileId
                                          notificationTemplateId:1
                                                 completionBlock:successBlock
                                            errorCompletionBlock:failureBlock
                                                        cbObject:nil];
    [self waitForResult];
}

- (void)testSendRichNotificationWithParams
{
    [[m_client pushNotificationService]
        sendRichPushNotificationWithParams:[TestFixtureBase getUser:@"UserA"].m_profileId
                    notificationTemplateId:1
                          substitutionJson:@"{\"1\":\"test sub\"}"
                           completionBlock:successBlock
                      errorCompletionBlock:failureBlock
                                  cbObject:nil];
    [self waitForResult];
}

- (void)testSendTemplatedPushNotificationToGroup
{
    [[m_client groupService] createGroup:@"testGroup"
                               groupType:@"test"
                             isOpenGroup:NO
                                     acl:@""
                                jsonData:@""
                     jsonOwnerAttributes:@""
             jsonDefaultMemberAttributes:@""
                         completionBlock:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];

    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj =
        [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

    NSString *groupId = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"groupId"];

    [[m_client pushNotificationService] sendTemplatedPushNotificationToGroup:groupId
                                                      notificationTemplateId:1
                                                           substitutionsJson:@"{\"1\":\"test sub\"}"
                                                             completionBlock:successBlock
                                                        errorCompletionBlock:failureBlock
                                                                    cbObject:nil];
    [self waitForResult];

    [[m_client groupService] deleteGroup:groupId
                                 version:-1
                         completionBlock:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];
}

- (void)testSendNormalizedPushNotificationToGroup
{
    [[m_client groupService] createGroup:@"testGroup"
                               groupType:@"test"
                             isOpenGroup:NO
                                     acl:@""
                                jsonData:@""
                     jsonOwnerAttributes:@""
             jsonDefaultMemberAttributes:@""
                         completionBlock:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];

    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj =
        [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

    NSString *groupId = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"groupId"];

    [[m_client pushNotificationService]
        sendNormalizedPushNotificationToGroup:groupId
                             alertContentJson:@"{ \"body\": \"content of message\", \"title\": \"message title\" }"
                               customDataJson:nil
                              completionBlock:successBlock
                         errorCompletionBlock:failureBlock
                                     cbObject:nil];
    [self waitForResult];

    [[m_client groupService] deleteGroup:groupId
                                 version:-1
                         completionBlock:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];
}

- (void)testScheduleNormalizedPushNotificationUTC
{
    [[m_client pushNotificationService]
            scheduleNormalizedPushNotificationUTC:[TestFixtureBase getUser:@"UserB"].m_profileId
                                 alertContentJson:@"{ \"body\": \"content of message\", \"title\": \"message title\" }"
                                   customDataJson:nil
                                        startTime:0
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForResult];
}

- (void)testScheduleNormalizedPushNotificationMinutes
{
    [[m_client pushNotificationService]
            scheduleNormalizedPushNotificationMinutes:[TestFixtureBase getUser:@"UserB"].m_profileId
                                     alertContentJson:@"{ \"body\": \"content of message\", \"title\": \"message title\" }"
                                       customDataJson:nil
                                       minutesFromNow:42
                                      completionBlock:successBlock
                                 errorCompletionBlock:failureBlock
                                             cbObject:nil];
    [self waitForResult];
}

- (void)testScheduleRichPushNotificationUTC
{
    [[m_client pushNotificationService]
            scheduleRichPushNotificationUTC:[TestFixtureBase getUser:@"UserB"].m_profileId
                     notificationTemplateId:1
                           substitutionJson:@"{\"1\":\"test sub\"}"
                                  startTime:0
                            completionBlock:successBlock
                       errorCompletionBlock:failureBlock
                                   cbObject:nil];
    [self waitForResult];
}

- (void)testScheduleRichPushNotificationMinutes
{
    [[m_client pushNotificationService]
            scheduleRichPushNotificationMinutes:[TestFixtureBase getUser:@"UserB"].m_profileId
                         notificationTemplateId:1
                               substitutionJson:@"{\"1\":\"test sub\"}"
                                 minutesFromNow:42
                                completionBlock:successBlock
                           errorCompletionBlock:failureBlock
                                       cbObject:nil];
    [self waitForResult];
}

- (void)testSendNormalizedPushNotification
{
    [[m_client pushNotificationService]
        sendNormalizedPushNotification:[TestFixtureBase getUser:@"UserB"].m_profileId
                      alertContentJson:@"{ \"body\": \"content of message\", \"title\": \"message title\" }"
                        customDataJson:nil
                       completionBlock:successBlock
                  errorCompletionBlock:failureBlock
                              cbObject:nil];
    [self waitForResult];
}

- (void)testSendNormalizedPushNotificationBatch
{
    [[m_client pushNotificationService]
        sendNormalizedPushNotificationBatch:@[
            [TestFixtureBase getUser:@"UserA"]
                .m_profileId,
            [TestFixtureBase getUser:@"UserB"].m_profileId
        ]
                           alertContentJson:@"{ \"body\": \"content of message\", \"title\": \"message title\" }"
                             customDataJson:nil
                            completionBlock:successBlock
                       errorCompletionBlock:failureBlock
                                   cbObject:nil];
    [self waitForResult];
}

@end
