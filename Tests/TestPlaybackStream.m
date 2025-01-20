//
//  TestPlaybackStream.m
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-12.
//  Copyright (c) 2015 bitHeads. All rights reserved.
//

#import "TestFixtureBase.h"

@interface TestPlaybackStream : TestFixtureBase

@end

@implementation TestPlaybackStream

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testStartStream
{
    NSString *streamId = [self startStream];
    [self endStream:streamId];
}

- (void)testEndStream
{
    NSString *streamId = [self startStream];
    [self endStream:streamId];
}

- (void)testDeleteStream
{
    NSString *streamId = [self startStream];
    [[m_client playbackStreamService] deleteStream:streamId
                                   completionBlock:successBlock
                              errorCompletionBlock:failureBlock
                                          cbObject:nil];
    [self waitForResult];
}

- (void)testAddEvent
{
    NSString *streamId = [self startStream];
    [[m_client playbackStreamService] addEvent:streamId
                                 jsonEventData:@"{ \"test\":\"test\" }"
                                   jsonSummary:@"{ \"test\":\"test\" }"
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    [self waitForResult];
    [self endStream:streamId];
}

- (void)testGetRecentStreamsForInitiatingPlayer
{
    [[m_client playbackStreamService]
            getRecentStreamsForInitiatingPlayer:[TestFixtureBase getUser:@"UserA"].m_profileId
                                  maxNumStreams:10
                                completionBlock:successBlock
                           errorCompletionBlock:failureBlock
                                       cbObject:nil];
    [self waitForResult];
}

- (void)testGetRecentStreamsForTargetPlayer
{
    [[m_client playbackStreamService]
            getRecentStreamsForTargetPlayer:[TestFixtureBase getUser:@"UserB"].m_profileId
                                  maxNumStreams:10
                                completionBlock:successBlock
                           errorCompletionBlock:failureBlock
                                       cbObject:nil];
    [self waitForResult];
}

-(void)testProtectStreamUntil
{
    NSString *playbackStreamId = [self startStream];
    (int32_t) numDays = 1;

    [[m_client playbackStreamService] protectStreamUntil:playbackStreamId
                                                 numDays:numDays
                                         completionBlock:successBlock
                                    errorCompletionBlock:failureBlock
                                                cbObject:nil];
    [self waitForResult]
    [self endStream:playbackStreamId];
}

- (void)testReadStream
{
    NSString *streamId = [self startStream];
    [[m_client playbackStreamService] readStream:streamId
                                 completionBlock:successBlock
                            errorCompletionBlock:failureBlock
                                        cbObject:nil];
    [self waitForResult];
    [self endStream:streamId];
}

/// Helper Functions ///
- (NSString *)startStream
{
    [[m_client playbackStreamService] startStream:[TestFixtureBase getUser:@"UserB"].m_profileId
                                includeSharedData:true
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForResult];
    return
        [[TestFixtureBase getDataFromResponse:self.jsonResponse] objectForKey:@"playbackStreamId"];
}

- (void)endStream:(NSString *)streamId
{
    [[m_client playbackStreamService] endStream:streamId
                                completionBlock:successBlock
                           errorCompletionBlock:failureBlock
                                       cbObject:nil];
    [self waitForResult];
}

@end
