//
//  TestRTT.m
//  BrainCloud
//
//  Created by David St-Louis on 2020-01-19.
//  Copyright © 2020 BitHeads Inc. All rights reserved.
//

#import "TestFixtureBase.h"
#import "ReasonCodes.hh"

@interface TestRelay : TestFixtureBase

@end

@implementation TestRelay

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testTCP
{
    self.continueAfterFailure = NO;
    
    @try {
        [self relayFullFlow:BC_CONNECTION_TYPE_TCP];
    } @finally {
        self.continueAfterFailure = YES;
    }
}

- (void)testUDP
{
    self.continueAfterFailure = NO;
    
    @try {
        [self relayFullFlow:BC_CONNECTION_TYPE_UDP];
    } @finally {
        self.continueAfterFailure = YES;
    }
}

/* PROTOCOL UNIMPLEMENTED
- (void)testWS
{
    self.continueAfterFailure = NO;
    
    @try {
        [self relayFullFlow:BC_CONNECTION_TYPE_WS];
    } @finally {
        self.continueAfterFailure = YES;
    }
}
 */

- (void)relayFullFlow:(BCRelayConnectionType)connectionType
{
    __block BOOL isRoomReady = NO;
    __block NSDictionary *connectionInfo = nil;
    __weak TestFixtureBase *weakSelf = self;

    // Enable RTT
    {
        [[m_client rttService]
         enableRTT:YES
         successCompletionBlock:rttConnectSuccessBlock
         failureCompletionBlock:rttConnectFailureBlock
         cbObject:nil];
        [self waitForResult];
    }
    
    // Register for RTT lobby
    [[m_client rttService] registerRTTLobbyCallback:^(NSString *jsonData, BCCallbackObject cbObject)
    {
        NSData *data = [jsonData dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *eventJson = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:NSJSONReadingMutableContainers
                                                                    error:nil];
        
        NSString* op = [eventJson objectForKey:@"operation"];
        if (!op)
        {
            _XCTPrimitiveFail(weakSelf, @"");
        }
        
        if ([op isEqualToString:@"DISBANDED"])
        {
            NSInteger code = [[(NSDictionary*)[(NSDictionary*)[eventJson objectForKey:@"data"] objectForKey:@"reason"] objectForKey:@"code"] integerValue];
            if (code != RTT_ROOM_READY)
            {
                _XCTPrimitiveFail(weakSelf, @"");
            }
            isRoomReady = YES;
        }
        else if ([op isEqualToString:@"ROOM_READY"])
        {
            connectionInfo = [eventJson objectForKey:@"data"];
        }
    } cbObject:nil];

    // Create a lobby
    NSString* _lobbyType = @"READY_START_V2";
    NSArray* _otherUserCxIds = @[];
    NSString* _extraJson = @"{}";
    NSString* _settings = @"{}";
    NSString* _teamCode = @"all";
    
    [[m_client lobbyService] createLobby:_lobbyType
                                 rating:0
                         otherUserCxIds:_otherUserCxIds
                                isReady:true
                              extraJson:_extraJson
                               teamCode:_teamCode
                               settings:_settings
                        completionBlock:successBlock
                   errorCompletionBlock:failureBlock
                               cbObject:nil];
    [self waitForResultExpectedCount:1];

    // Wait for lobby to start, or timeout 2mins
    {
        long maxWait = 2 * 60 * 1000;
        while (!isRoomReady)
        {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
            maxWait -= 10;
            [m_client runCallBacks];
            if (maxWait < 0)
            {
                _XCTPrimitiveFail(weakSelf, @"");
            }
        }
    }

    // Register relay callback
    __block BOOL relayFailed = NO;
    NSData* messageData = [@"Hello World!" dataUsingEncoding:NSUTF8StringEncoding];
    
    __block BOOL hasReceivedSystemMessage = NO;
    [[m_client relayService] registerSystemCallback:^(NSString *jsonResponse, BCCallbackObject cbObject)
    {
        NSData *data = [jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *eventJson = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:NSJSONReadingMutableContainers
                                                                    error:nil];
        
        NSString* op = [eventJson objectForKey:@"op"];
        if ([op isEqualToString:@"CONNECT"])
        {
            hasReceivedSystemMessage = YES;
        }
    } cbObject:nil];
    
    __block BOOL hasReceivedEcho = NO;
    [[m_client relayService] registerRelayCallback:^(int netId, NSData *data, BCCallbackObject cbObject)
    {
        if ([data isEqualToData:messageData])
        {
            hasReceivedEcho = YES;
        }
    } cbObject:nil];
    
    // We set profile id because our unit tests fixture base clears it after a waitForResult call,
    // and removing that clear causes other tests to start failing... not great
    [[m_client authenticationService] setProfileID:[TestFixtureBase getUser:@"UserA"].m_profileId];
    
    // Relay connect
    {
        NSDictionary* connectData = (NSDictionary*)[connectionInfo objectForKey:@"connectData"];
        NSDictionary* posts = (NSDictionary*)[connectData objectForKey:@"ports"];
        NSString* host = (NSString*)[connectData objectForKey:@"address"];
        int port = 0;
        switch (connectionType)
        {
            case BC_CONNECTION_TYPE_TCP:
                port = (int)[[posts objectForKey:@"tcp"] integerValue];
                break;
            case BC_CONNECTION_TYPE_UDP:
                port = (int)[[posts objectForKey:@"udp"] integerValue];
                break;
            case BC_CONNECTION_TYPE_WSS:
            case BC_CONNECTION_TYPE_WS:
                port = (int)[[posts objectForKey:@"ws"] integerValue];
                break;
        }
        NSString* passcode = (NSString*)[connectionInfo objectForKey:@"passcode"];
        NSString* lobbyId = (NSString*)[connectionInfo objectForKey:@"lobbyId"];
        
        [[m_client relayService] connect:connectionType host:host port:port passcode:passcode lobbyId:lobbyId connectSuccess:^(NSString *jsonData, BCCallbackObject cbObject)
        {
            NSString* myProfileId = [[m_client authenticationService] profileID];
            int netId = [[m_client relayService] getNetIdForProfileId:myProfileId];
            [[m_client relayService] send:messageData toNetId:(uint64_t)netId reliable:YES ordered:YES channel:0];
        } connectFailure:^(NSString *errorMessage, BCCallbackObject cbObject)
        {
            relayFailed = YES;
        } cbObject:nil];
    }

    // Wait for 30sec. Enough so connect/echo the message and then see if ping keeps us alive
    {
        long maxWait = 30 * 1000;
        while (!relayFailed)
        {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.01]];
            maxWait -= 10;
            [m_client runCallBacks];
            if (maxWait < 0)
            {
                break;
            }
        }
        if (!hasReceivedSystemMessage || !hasReceivedEcho)
        {
            _XCTPrimitiveFail(weakSelf, @"");
        }
    }
}

@end
