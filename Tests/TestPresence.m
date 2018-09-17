//
//  TestPresence.m
//  BrainCloud
//
//  Created by Ryan Ruth on 2018-09-13.
//  Copyright © 2018 BitHeads Inc. All rights reserved.
//

#import "TestFixtureBase.h"

@interface TestPresence : TestFixtureBase

@end

@implementation TestPresence

NSString *_invalidId = @"Invalid_Id";

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }


- (void)testForcePush
{
    [[m_client presenceService] forcePush:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForResult];
}

- (void)testGetPresenceOfFriends
{
    [[m_client presenceService] getPresenceOfFriends:"brainCloud"
                                   includeOffline:true
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForResult];
}

- (void)testGetPresenceOfGroup
{
    [[m_client presenceService] getPresenceOfGroup:_invalidId
                                   includeOffline:true
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

- (void)testGetPresenceOfUsers
{
    [[m_client presenceService] getPresenceOfUsers:_invalidId
                                   includeOffline:true
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

- (void)testRegisterListenersForFriends
{
    [[m_client presenceService] registerListenersForFriends:_invalidId
                                    bidirectional:true
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

- (void)testRegsiterListenersForGroup
{
    [[m_client presenceService] registerListenersForGroup:_invalidId
                                    bidirectional:true
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

- (void)testRegisterListenersForProfiles
{
    [[m_client presenceService] registerListenersForProfiles:_invalidId
                                    bidirectional:true
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

- (void)testSetVisibility
{
    [[m_client presenceService] setVisibility:true
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

- (void)testStopListening
{
    [[m_client presenceService] stopListening:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

- (void)testUpdateActivity
{
    [[m_client presenceService] updateActivity:_invalidId
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

@end
