//
//  TestEvent.m
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-12.
//  Copyright (c) 2015 bitHeads. All rights reserved.
//

#import "TestFixtureBase.h"

@interface TestEvent : TestFixtureBase

@end

@implementation TestEvent

NSString *eventType = @"TestEvent";
NSString *eventData = @"{ \"globalTestName\":\"testValue\" }";

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testSendEvent
{
    [self sendEvent];
    if (!_eventCallbackReceived)
    {
        __weak TestFixtureBase *weakSelf = self;
       _XCTPrimitiveFail(weakSelf, @"No callback event received");
    }
    else
    {
        NSLog(@"Event JSON");
        NSLog(@"%@", _eventCallbackJson);
    }
}

-(void)testSendEventToProfiles
{
    NSArray *toIds = @[[TestFixtureBase getUser:@"UserA"].m_profileId];
    [m_client registerEventCallback:eventBlock];
    [[m_client eventService] SendEventToProfiles:toIds
                                       eventType:eventType
                                       eventData:eventData
                                 completionBlock:successBlock
                            errorCompletionBlock:failureBlock
                                        cbObject:nil];
    [self waitForResult];
    [m_client deregisterEventCallback];
}

- (void)testUpdateIncomingEventData
{
    NSString* eventId = [self sendEvent];
    [[m_client eventService] updateIncomingEventData:eventId
                                       jsonEventData:eventData
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
}

- (void)testUpdateIncomingEventDataIfExistsTrue
{
    NSString* eventId = [self sendEvent];
    [[m_client eventService] updateIncomingEventDataIfExists:eventId
                                       jsonEventData:eventData
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
}

- (void)testUpdateIncomingEventDataIfExistsFalse
{
    NSString* nonExistentEventId = @"66ba5285d9002730d8f707a0";
    [[m_client eventService] updateIncomingEventDataIfExists:nonExistentEventId
                                       jsonEventData:eventData
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
}

- (void)testDeleteIncomingEvent
{
    NSString* eventId = [self sendEvent];
    [[m_client eventService] deleteIncomingEvent:eventId
                                 completionBlock:successBlock
                            errorCompletionBlock:failureBlock
                                        cbObject:nil];
    [self waitForResult];
}

- (void)testDeleteIncomingEvents
{
    NSString* eventId1 = [self sendEvent];
    NSString* eventId2 = [self sendEvent];
    
    NSArray* eventIds = [NSArray arrayWithObjects:eventId1, eventId2, nil];
    
    [[m_client eventService] deleteIncomingEvents:eventIds
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    
    [self waitForResult];
}

- (void)testDeleteIncomingEventsOlderThan
{
    NSDate *now = [NSDate date];
    NSTimeInterval nowEpochSeconds = [now timeIntervalSince1970] * 1000;
    
    [[m_client eventService] deleteIncomingEventsOlderThan:nowEpochSeconds
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    
    [self waitForResult];
}

- (void)testDeleteIncomingEventsByTypeOlderThan
{
    NSDate *now = [NSDate date];
    NSTimeInterval nowEpochSeconds = [now timeIntervalSince1970] * 1000;
    
    [[m_client eventService] deleteIncomingEventsByTypeOlderThan:eventType
                                                      dateMillis:nowEpochSeconds
                                                 completionBlock:successBlock
                                            errorCompletionBlock:failureBlock
                                                        cbObject:nil];
    
    [self waitForResult];
}

- (void)testGetEvents
{
    [self sendEvent];
    [[m_client eventService] getEvents:successBlock
                  errorCompletionBlock:failureBlock
                              cbObject:nil];
    [self waitForResult];
}

- (NSString*)sendEvent
{
    [m_client registerEventCallback:eventBlock];
    [[m_client eventService] sendEvent:[TestFixtureBase getUser:@"UserA"].m_profileId
                             eventType:eventType
                         jsonEventData:eventData
                       completionBlock:successBlock
                  errorCompletionBlock:failureBlock
                              cbObject:nil];
    [self waitForResult];
    [m_client deregisterEventCallback];
    return (NSString *)[[TestFixtureBase getDataFromResponse:self.jsonResponse]
        valueForKey:@"evId"];
}

@end
