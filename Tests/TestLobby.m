//
//  TestLobby.m
//  BrainCloud-iOS
//
//  Created by Ryan Ruth on 2018-11-07.
//  Copyright © 2018 BitHeads Inc. All rights reserved.
//

#import "TestFixtureBase.h"

@interface TestLobby : TestFixtureBase

@end

@implementation TestLobby

- (bool)authenticateOnSetup { return false; }

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testCreateLobby
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    NSString* _lobbyType = @"MATCH_UNRANKED";
    NSArray* _otherUserCxIds = @[];
    NSString* _extraJson = @"{}";
    NSString* _settings = @"{}";
    NSString* _teamCode = @"all";
    
    [[m_client lobbyService] createLobby:_lobbyType
                                 rating:0
                         otherUserCxIds:_otherUserCxIds
                                isReady:false
                              extraJson:_extraJson
                               teamCode:_teamCode
                               settings:_settings
                        completionBlock:successBlock
                   errorCompletionBlock:failureBlock
                               cbObject:nil];
    [self waitForResult];
}

- (void)testCreateLobbyWithConfig
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    NSString* _lobbyType = @"MATCH_UNRANKED";
    NSArray* _otherUserCxIds = @[];
    NSString* _extraJson = @"{}";
    NSString* _settings = @"{}";
    NSString* _teamCode = @"all";
    NSString* _configOverrides = @"{\"teams\":[{\"code\":\"reserved\",\"minUsers\":0,\"maxUsers\":1,\"autoAssign\":false},{\"code\":\"all\",\"minUsers\":6,\"maxUsers\":6,\"autoAssign\":true}]}";
    
    [[m_client lobbyService] createLobbyWithConfig:_lobbyType
                                            rating:0
                                    otherUserCxIds:_otherUserCxIds
                                           isReady:false
                                         extraJson:_extraJson
                                          teamCode:_teamCode
                                          settings:_settings
                                   configOverrides:_configOverrides
                                   completionBlock:successBlock
                              errorCompletionBlock:failureBlock
                                          cbObject:nil];
    [self waitForResult];
}

- (void)testFindLobby
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    NSString* _lobbyType = @"MATCH_UNRANKED";
    NSArray* _otherUserCxIds = @[];
    NSString* _extraJson = @"{}";
    NSString* _teamCode = @"all";
    NSString* _algo = @"{\"strategy\":\"ranged-absolute\",\"alignment\":\"center\",\"ranges\":[1000]}";
    NSString* _filterJson = @"{}";
    
    [[m_client lobbyService] findLobby:_lobbyType
                               rating:0
                             maxSteps:1
                                 algo:_algo
                           filterJson:_filterJson
                       otherUserCxIds:_otherUserCxIds
                              isReady:true
                            extraJson:_extraJson
                             teamCode:_teamCode
                      completionBlock:successBlock
                 errorCompletionBlock:failureBlock
                             cbObject:nil];
    [self waitForResult];
}

- (void)testFindOrCreateLobby
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    NSString* _lobbyType = @"MATCH_UNRANKED";
    NSArray* _otherUserCxIds = @[];
    NSString* _extraJson = @"{}";
    NSString* _settings = @"{}";
    NSString* _teamCode = @"all";
    NSString* _algo = @"{\"strategy\":\"ranged-absolute\",\"alignment\":\"center\",\"ranges\":[1000]}";
    NSString* _filterJson = @"{}";
    
    [[m_client lobbyService] findOrCreateLobby:_lobbyType
                                        rating:0
                                      maxSteps:1
                                          algo:_algo
                                    filterJson:_filterJson
                                otherUserCxIds:_otherUserCxIds
                                       isReady:true
                                     extraJson:_extraJson
                                      teamCode:_teamCode
                                      settings:_settings
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    [self waitForResult];
}

- (void)testCancelFindRequest
{
    [[m_client authenticationService]
    authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    NSString* _lobbyType = @"MATCH_UNRANKED";
    NSArray* _otherUserCxIds = @[];
    NSString* _extraJson = @"{}";
    NSString* _settings = @"{}";
    NSString* _teamCode = @"all";
    NSString* _algo = @"{\"strategy\":\"ranged-absolute\",\"alignment\":\"center\",\"ranges\":[1000]}";
    NSString* _filterJson = @"{}";
    
    [[m_client lobbyService] findOrCreateLobby:_lobbyType
                                        rating:0
                                      maxSteps:1
                                          algo:_algo
                                    filterJson:_filterJson
                                otherUserCxIds:_otherUserCxIds
                                       isReady:true
                                     extraJson:_extraJson
                                      teamCode:_teamCode
                                      settings:_settings
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    [self waitForResult];

    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSString *_entryId = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"entryId"];

    [[m_client lobbyService] cancelFindRequest:_lobbyType
                                       entryId:_entryId
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    [self waitForResult];
}

- (void)testGetLobbyData
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] getLobbyData:@"badLobbyId"
                          completionBlock:successBlock
                     errorCompletionBlock:failureBlock
                                 cbObject:nil];
    [self waitForFailedResult];
}

- (void)testLeaveLobby
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] leaveLobby:@"badLobbyId"
                       completionBlock:successBlock
                  errorCompletionBlock:failureBlock
                              cbObject:nil];
    [self waitForFailedResult];
}

- (void)testRemoveMember
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] removeMember:@"badLobbyId"
                                    cxId:@"wrongId"
                         completionBlock:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForFailedResult];
}

- (void)testSendSignals
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] sendSignal:@"badLobbyId"
                             signalData:@"{\"message\":\"test\"}"
                        completionBlock:successBlock
                   errorCompletionBlock:failureBlock
                               cbObject:nil];
    [self waitForFailedResult];
}

- (void)testSwitchTeam
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] switchTeam:@"badLobbyId"
                               teamCode:@"all"
                        completionBlock:successBlock
                   errorCompletionBlock:failureBlock
                               cbObject:nil];
    [self waitForFailedResult];
}

- (void)testUpdateReady
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] updateReady:@"badLobbyId"
                                 isReady:true
                               extraJson:@"{}"
                         completionBlock:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForFailedResult];
}

- (void)testUpdateSettings
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService]updateSettings:@"badLobbyId"
                                  settings:@"{}"
                           completionBlock:successBlock
                      errorCompletionBlock:failureBlock
                                  cbObject:nil];
    [self waitForFailedResult];
}

- (void)testJoinLobby
{
    NSString* id = @"Id";
    NSArray* ids = [NSArray arrayWithObjects:id, nil];
    //expect bad lobby
    [[m_client lobbyService]joinLobby:@"badLobbyId"
                              isReady:true
                            extraJson:@"{}"
                             teamCode:@"red"
                       otherUserCxIds:ids
                           completionBlock:successBlock
                      errorCompletionBlock:failureBlock
                                  cbObject:nil];
    [self waitForFailedResult];
}

// We include all tests regarding pings in here
- (void)testPingRegions
{
    [[m_client authenticationService] authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
                                                   password:[TestFixtureBase getUser:@"UserA"].m_password
                                                forceCreate:true
                                            completionBlock:successBlock
                                       errorCompletionBlock:failureBlock
                                                   cbObject:nil];
    [self waitForResult];
        
    NSString* _lobbyType = @"MATCH_UNRANKED";
    NSArray*  _otherUserCxIds = @[];
    NSString* _extraJson = @"{}";
    NSString* _teamCode = @"all";
    NSString* _algo = @"{\"strategy\":\"ranged-absolute\",\"alignment\":\"center\",\"ranges\":[1000]}";
    NSString* _filterJson = @"{}";
    NSString* _settings = @"{}";
    NSString* _configOverrides = @"{\"teams\":[{\"code\":\"reserved\",\"minUsers\":0,\"maxUsers\":1,\"autoAssign\":false},{\"code\":\"all\",\"minUsers\":6,\"maxUsers\":6,\"autoAssign\":true}]}";
    
    // Test trying to call a function <>withPingData without having fetched pings
    [[m_client lobbyService] findOrCreateLobbyWithPingData:_lobbyType
                                                    rating:0
                                                  maxSteps:1
                                                      algo:_algo
                                                filterJson:_filterJson
                                            otherUserCxIds:_otherUserCxIds
                                                   isReady:true
                                                 extraJson:_extraJson
                                                  teamCode:_teamCode
                                                  settings:_settings
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForFailedResult];
    
    // Fetch pings
    [[m_client lobbyService] getRegionsForLobbies:@[_lobbyType]
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] pingRegions:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];
    
    // Ping regions 2 times to make sure we see in the log there's no caching happening and that they don't all end up at 0 on the second or third time
    [[m_client lobbyService] pingRegions:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];
    [[m_client lobbyService] pingRegions:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];
    NSDictionary* pingData = [m_client.lobbyService getPingData];
    int total = 0;
    for (NSString *key in pingData)
    {
        total += [pingData[key] intValue];
    }
    if (total == 0)
    {
        _XCTPrimitiveFail(self, @"Ping data total was 0");
    }
    
    // Call all the <>WithPingData functions and make sure they go through braincloud
    [[m_client lobbyService] findOrCreateLobbyWithPingData:_lobbyType
                                                    rating:0
                                                  maxSteps:1
                                                      algo:_algo
                                                filterJson:_filterJson
                                            otherUserCxIds:_otherUserCxIds
                                                   isReady:true
                                                 extraJson:_extraJson
                                                  teamCode:_teamCode
                                                  settings:_settings
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] findLobbyWithPingData:_lobbyType
                                            rating:0
                                          maxSteps:1
                                              algo:_algo
                                        filterJson:_filterJson
                                    otherUserCxIds:_otherUserCxIds
                                           isReady:true
                                         extraJson:_extraJson
                                          teamCode:_teamCode
                                   completionBlock:successBlock
                              errorCompletionBlock:failureBlock
                                          cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] createLobbyWithPingData:_lobbyType
                                              rating:0
                                      otherUserCxIds:_otherUserCxIds
                                             isReady:true
                                           extraJson:_extraJson
                                            teamCode:_teamCode
                                            settings:_settings
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] createLobbyWithConfigAndPingData:_lobbyType
                                              rating:0
                                      otherUserCxIds:_otherUserCxIds
                                             isReady:true
                                           extraJson:_extraJson
                                            teamCode:_teamCode
                                            settings:_settings
                                     configOverrides:_configOverrides
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
    
    // C++ has a JoinLobbyWithPingData that seems to be missing...
}

- (void)testGetLobbyInstances
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] getLobbyInstances:@"MATCH_UNRANKED"
                                  criteriaJson:@"{\"rating\":{\"min\":1,\"max\":1000}}"
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    [self waitForResult];
}

- (void)testGetLobbyInstancesWithPingData
{
    [[m_client authenticationService]
     authenticateUniversal:[TestFixtureBase getUser:@"UserA"].m_id
     password:[TestFixtureBase getUser:@"UserA"].m_password
     forceCreate:true
     completionBlock:successBlock
     errorCompletionBlock:failureBlock
     cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] getRegionsForLobbies:@[@"MATCH_UNRANKED"]
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] pingRegions:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];
    
    [[m_client lobbyService] getLobbyInstancesWithPingData:@"MATCH_UNRANKED"
                                  criteriaJson:@"{\"rating\":{\"min\":1,\"max\":1000},\"ping\":{\"max\":100}}"
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    [self waitForResult];
}

@end
