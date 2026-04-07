//
//  TestTournament.m
//  BrainCloud
//
//  Created by Bradley Hill on 2017-01-06.
//  Copyright © 2017 BitHeads Inc. All rights reserved.
//

#import "TestFixtureBase.h"

@interface TestTournament : TestFixtureBase

@end

@implementation TestTournament

NSString *_tournamentCode = @"testTournament";
NSString *_leaderboardId = @"testTournamentLeaderboard";
NSString *_divSetId = @"testDivSetId";
NSString *_invalidId = @"Invalid_Id";
NSString *_groupLeaderboardId = @"groupTournament";
NSString *_groupId = nil;

BOOL _didJoin = false;

- (void)setUp { [super setUp]; }

- (void)tearDown
{
    if (_didJoin) [self leaveTournament];
    [super tearDown];
}

- (void)testClaimTournamentReward
{
    int version = [self joinTournament];

    [[m_client tournamentService] claimTournamentReward:_leaderboardId
                                              versionId:version
                                        completionBlock:successBlock
                                   errorCompletionBlock:failureBlock
                                               cbObject:nil];
    [self waitForFailedResult];
}

- (void)testGetTournamentStatus
{
    int version = [self joinTournament];

    [[m_client tournamentService] getTournamentStatus:_leaderboardId
                                            versionId:version
                                      completionBlock:successBlock
                                 errorCompletionBlock:failureBlock
                                             cbObject:nil];
    [self waitForResult];
}

- (void)testGetDivisionInfo
{
    [[m_client tournamentService] getDivisionInfo:_invalidId
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

- (void)testGetMyDivisions
{
    [[m_client tournamentService] getMyDivisions:successBlock
                            errorCompletionBlock:failureBlock
                                        cbObject:nil];
    [self waitForResult];
}

- (void)testJoinDivision
{
    [[m_client tournamentService] joinDivision:_invalidId
                                tournamentCode:_tournamentCode
                                  initialScore:0
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    [self waitForFailedResult];
}

- (void)testLeaveDivisionInstance
{
    [[m_client tournamentService] getDivisionInfo:_invalidId
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForFailedResult];
}

- (void)testJoinTournament { [self joinTournament]; }

- (void)testLeaveTournament
{
    [self joinTournament];
    [self leaveTournament];
}

- (void)testPostTournamentScoreUTC
{
    [self joinTournament];
    
    NSDate *now = [NSDate date];
    NSTimeInterval nowEpochSeconds = [now timeIntervalSince1970] * 1000;
    
    [[m_client tournamentService] postTournamentScoreUTC:_leaderboardId
                                                score:200
                                             jsonData:nil
                                     roundStartedTimeUTC:nowEpochSeconds
                                      completionBlock:successBlock
                                 errorCompletionBlock:failureBlock
                                             cbObject:nil];
    [self waitForResult];
}

- (void)testPostTournamentScoreWithResultsUTC
{
    [self joinTournament];
    
        NSDate *now = [NSDate date];
    NSTimeInterval nowEpochSeconds = [now timeIntervalSince1970] * 1000;
    
    [[m_client tournamentService] postTournamentScoreWithResultsUTC:_leaderboardId
                                                           score:200
                                                        jsonData:nil
                                                roundStartedTimeUTC:nowEpochSeconds
                                                       sortOrder:HIGH_TO_LOW
                                                     beforeCount:10
                                                      afterCount:10
                                                    initialScore:0
                                                 completionBlock:successBlock
                                            errorCompletionBlock:failureBlock
                                                        cbObject:nil];
    [self waitForResult];
}
- (void)testViewCurrentReward
{
    [self joinTournament];

    [[m_client tournamentService] viewCurrentReward:_leaderboardId
                                    completionBlock:successBlock
                               errorCompletionBlock:failureBlock
                                           cbObject:nil];
    [self waitForResult];
}

- (void)testViewReward
{
    [self joinTournament];

    [[m_client tournamentService] viewReward:_leaderboardId
                                   versionId:-1
                             completionBlock:successBlock
                        errorCompletionBlock:failureBlock
                                    cbObject:nil];
    [self waitForFailedResult];
}

- (void)testGetGroupDivisionInfo
{
    [self createGroupForTournament];

    [[m_client tournamentService] getGroupDivisionInfo:@"bronzeGroup"
                                               groupId:_groupId
                                       completionBlock:successBlock
                                  errorCompletionBlock:failureBlock
                                              cbObject:nil];
    [self waitForResult];

    [self deleteGroupForTournament];
}

- (void)testGetGroupDivisions
{
    [self createGroupForTournament];

    [[m_client tournamentService] getGroupDivisions:_groupId
                                    completionBlock:successBlock
                               errorCompletionBlock:failureBlock
                                           cbObject:nil];
    [self waitForResult];

    [self deleteGroupForTournament];
}

- (void)testGetGroupTournamentStatus
{
    [self createGroupForTournament];

    [[m_client tournamentService] getGroupTournamentStatus:_groupLeaderboardId
                                                   groupId:_groupId
                                                 versionId:-1
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForResult];

    [self deleteGroupForTournament];
}

- (void)testJoinAndLeaveGroupDivision
{
    [self createGroupForTournament];

    [[m_client tournamentService] joinGroupDivision:@"bronzeGroup"
                                     tournamentCode:@"testGroupTournament"
                                            groupId:_groupId
                                       initialScore:0
                                    completionBlock:successBlock
                               errorCompletionBlock:failureBlock
                                           cbObject:nil];
    [self waitForResult];

    NSDictionary *data = [TestFixtureBase getDataFromResponse:self.jsonResponse];
    NSString *leaderboardId = [data objectForKey:@"leaderboardId"];
    XCTAssertNotNil(leaderboardId, @"Error reading joinGroupDivision response leaderboardId");

    [[m_client tournamentService] leaveGroupDivisionInstance:leaderboardId
                                                     groupId:_groupId
                                             completionBlock:successBlock
                                        errorCompletionBlock:failureBlock
                                                    cbObject:nil];
    [self waitForResult];

    [self deleteGroupForTournament];
}

- (void)testJoinPostLeaveGroupTournament
{
    [self createGroupForTournament];

    NSDate *now = [NSDate date];
    NSTimeInterval nowEpochMillis = [now timeIntervalSince1970] * 1000;

    [[m_client tournamentService] joinGroupTournament:_groupLeaderboardId
                                       tournamentCode:@"testGroupTournament"
                                              groupId:_groupId
                                         initialScore:0
                                      completionBlock:successBlock
                                 errorCompletionBlock:failureBlock
                                             cbObject:nil];
    [self waitForResult];

    [[m_client tournamentService] postGroupTournamentScore:_groupLeaderboardId
                                                   groupId:_groupId
                                                     score:10
                                                  jsonData:nil
                                       roundStartedTimeUTC:nowEpochMillis
                                           completionBlock:successBlock
                                      errorCompletionBlock:failureBlock
                                                  cbObject:nil];
    [self waitForResult];

    [[m_client tournamentService] postGroupTournamentScoreWithResults:_groupLeaderboardId
                                                              groupId:_groupId
                                                                score:100
                                                             jsonData:nil
                                                  roundStartedTimeUTC:nowEpochMillis
                                                           sortOrder:HIGH_TO_LOW
                                                         beforeCount:10
                                                          afterCount:10
                                                        initialScore:0
                                                     completionBlock:successBlock
                                                errorCompletionBlock:failureBlock
                                                            cbObject:nil];
    [self waitForResult];

    [[m_client tournamentService] leaveGroupTournament:_groupLeaderboardId
                                               groupId:_groupId
                                       completionBlock:successBlock
                                  errorCompletionBlock:failureBlock
                                              cbObject:nil];
    [self waitForResult];

    [self deleteGroupForTournament];
}

- (int)joinTournament
{
    [[m_client tournamentService] joinTournament:_leaderboardId
                                  tournamentCode:_tournamentCode
                                    initialScore:100
                                 completionBlock:successBlock
                            errorCompletionBlock:failureBlock
                                        cbObject:nil];
    [self waitForResult];
    _didJoin = true;

    NSDictionary *jsonObj = [TestFixtureBase getDataFromResponse:self.jsonResponse];
    
    
    int versionId = (int)[[jsonObj objectForKey:@"versionId"] intValue];
    return versionId;
}

- (void)leaveTournament
{
    [[m_client tournamentService] leaveTournament:_leaderboardId
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForResult];
    _didJoin = false;
}

- (void)createGroupForTournament
{
    [[m_client groupService] createGroup:@"testGroup"
                               groupType:@"csharpTest"
                             isOpenGroup:YES
                                     acl:@"{ \"other\": 2, \"member\": 2 }"
                                jsonData:@"{}"
                     jsonOwnerAttributes:@"{}"
             jsonDefaultMemberAttributes:@"{}"
                         completionBlock:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];

    NSDictionary *data = [TestFixtureBase getDataFromResponse:self.jsonResponse];
    _groupId = [data objectForKey:@"groupId"];
}

- (void)deleteGroupForTournament
{
    if (!_groupId) return;

    [[m_client groupService] deleteGroup:_groupId
                                 version:-1
                         completionBlock:successBlock
                    errorCompletionBlock:failureBlock
                                cbObject:nil];
    [self waitForResult];
    _groupId = nil;
}

@end
