// Copyright 2026 bitHeads, Inc. All Rights Reserved.

//
//  BrainCloudTournament.h
//  BrainCloud
//
//  Created by Bradley Hill on 2017-01-06.

//

#pragma once
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

#import <Foundation/Foundation.h>
#import "BrainCloudCompletionBlocks.hh"
#import "BrainCloudLeaderboard.hh"

@class BrainCloudClient;

@interface BrainCloudTournament : NSObject

/**
 * Initializes the brainCloudService
 */
- (instancetype) init: (BrainCloudClient*) client;

/**
 * Processes any outstanding rewards for the given player
 *
 * Service Name - tournament
 * Service Operation - CLAIM_TOURNAMENT_REWARD
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param versionId Version of the tournament. Use -1 for the latest version.
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)claimTournamentReward:(NSString *)leaderboardId
                    versionId:(int)versionId
              completionBlock:(BCCompletionBlock)cb
         errorCompletionBlock:(BCErrorCompletionBlock)ecb
                     cbObject:(BCCallbackObject)cbObject;

/**
 * Get tournament status associated with a leaderboard
 *
 * Service Name - tournament
 * Service Operation - GET_TOURNAMENT_STATUS
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param versionId Version of the tournament. Use -1 for the latest version.
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)getTournamentStatus:(NSString *)leaderboardId
                  versionId:(int)versionId
            completionBlock:(BCCompletionBlock)cb
       errorCompletionBlock:(BCErrorCompletionBlock)ecb
                   cbObject:(BCCallbackObject)cbObject;

/**
 * Get the status of a division
 *
 * Service Name - tournament
 * Service Operation - GET_DIVISION_INFO
 *
 * @param divSetId The id for the division
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)getDivisionInfo:(NSString *)divSetId
        completionBlock:(BCCompletionBlock)cb
   errorCompletionBlock:(BCErrorCompletionBlock)ecb
               cbObject:(BCCallbackObject)cbObject;

/**
 * Gets the player's recently active divisions
 *
 * Service Name - tournament
 * Service Operation - GET_MY_DIVISIONS
 *
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)getMyDivisions:(BCCompletionBlock)cb
  errorCompletionBlock:(BCErrorCompletionBlock)ecb
              cbObject:(BCCallbackObject)cbObject;

/**
 * Joins a division
 *
 * Service Name - tournament
 * Service Operation - JOIN_DIVISION
 *
 * @param divSetId the id for the division
 * @param tournamentCode the tournament to join
 * @param initialScore score for player starting tournament, usually 0
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)joinDivision:(NSString *) divSetId
      tournamentCode: (NSString *)tournamentCode
        initialScore: (long)initialScore
     completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
            cbObject:(BCCallbackObject)cbObject;

/**
 * Leaves the specifid division
 *
 * Service Name - tournament
 * Service Operation - LEAVE_DIVISION_INSTANCE
 *
 * @param leaderBoardId the id of the tournament
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)leaveDivisionInstance:(NSString *) leaderBoardId
              completionBlock:(BCCompletionBlock)cb
         errorCompletionBlock:(BCErrorCompletionBlock)ecb
                     cbObject:(BCCallbackObject)cbObject;

/**
 * Join the specified tournament.
 * Any entry fees will be automatically collected.
 *
 * Service Name - tournament
 * Service Operation - JOIN_TOURNAMENT
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param tournamentCode Tournament to join
 * @param initialScore The initial score for players first joining a tournament
 *						  Usually 0, unless leaderboard is LOW_VALUE
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)joinTournament:(NSString *)leaderboardId
          tournamentCode:(NSString *)tournamentCode
            initialScore:(int)initialScore
         completionBlock:(BCCompletionBlock)cb
    errorCompletionBlock:(BCErrorCompletionBlock)ecb
                cbObject:(BCCallbackObject)cbObject;

/**
 * Removes player's score from tournament leaderboard
 *
 * Service Name - tournament
 * Service Operation - LEAVE_TOURNAMENT
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)leaveTournament:(NSString *)leaderboardId
         completionBlock:(BCCompletionBlock)cb
    errorCompletionBlock:(BCErrorCompletionBlock)ecb
                cbObject:(BCCallbackObject)cbObject;

/**
 * Post the users score to the leaderboard - UTC time
 *
 * Service Name - tournament
 * Service Operation - POST_TOURNAMENT_SCORE
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param score The score to post
 * @param jsonData Optional data attached to the leaderboard entry
 * @param roundStartedTimeUTC Time the user started the match resulting in the score being posted in UTC. Use UTC time in milliseconds since epoch
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)postTournamentScoreUTC:(NSString *)leaderboardId
                      score:(int)score
                   jsonData:(NSString *)jsonData
           roundStartedTimeUTC:(int64_t)roundStartedTimeUTC
            completionBlock:(BCCompletionBlock)cb
       errorCompletionBlock:(BCErrorCompletionBlock)ecb
                   cbObject:(BCCallbackObject)cbObject;

/**
* Post the users score to the leaderboard - UTC time
*
* Service Name - tournament
* Service Operation - POST_TOURNAMENT_SCORE_WITH_RESULTS
*
* @param leaderboardId The leaderboard for the tournament
* @param score The score to post
* @param jsonData Optional data attached to the leaderboard entry
* @param roundStartedTimeUTC Time the user started the match resulting in the score being posted in UTC. Use UTC time in milliseconds since epoch
* @param sort Sort key Sort order of page.
* @param beforeCount The count of number of players before the current player to include.
* @param afterCount The count of number of players after the current player to include.
* @param initialScore The initial score for players first joining a tournament
*                         Usually 0, unless leaderboard is LOW_VALUE
* @param completionBlock Block to call on return of successful server response
* @param errorCompletionBlock Block to call on return of unsuccessful server response
* @param cbObject User object sent to the completion blocks
*/
- (void)postTournamentScoreWithResultsUTC:(NSString *)leaderboardId
                                 score:(int)score
                              jsonData:(NSString *)jsonData
                      roundStartedTimeUTC:(int64_t)roundStartedTimeUTC
                             sortOrder:(SortOrder)sortOrder
                           beforeCount:(int)beforeCount
                            afterCount:(int)afterCount
                          initialScore:(int)initialScore
                       completionBlock:(BCCompletionBlock)cb
                  errorCompletionBlock:(BCErrorCompletionBlock)ecb
                              cbObject:(BCCallbackObject)cbObject;
/**
 * Returns the user's expected reward based on the current scores
 *
 * Service Name - tournament
 * Service Operation - VIEW_CURRENT_REWARD
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)viewCurrentReward:(NSString *)leaderboardId
          completionBlock:(BCCompletionBlock)cb
     errorCompletionBlock:(BCErrorCompletionBlock)ecb
                 cbObject:(BCCallbackObject)cbObject;

/**
 * Returns the user's reward from a finished tournament
 *
 * Service Name - tournament
 * Service Operation - VIEW_REWARD
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param versionId Version of the tournament. Use -1 for the latest version.
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)viewReward:(NSString *)leaderboardId
               versionId:(int)versionId
         completionBlock:(BCCompletionBlock)cb
    errorCompletionBlock:(BCErrorCompletionBlock)ecb
                cbObject:(BCCallbackObject)cbObject;

/**
 * Essentially the same as GetGroupTournamentStatus(), but takes a division set id instead 
 * of a leaderboard id as its parameter. Would generally be called before JoinGroupDivision() 
 * in the case that there are multiple tournaments, or if the group member is shown information 
 * to make an informed choice as to whether to join group in tournament.
 *
 * Service Name - tournament
 * Service Operation - GET_GROUP_DIVISION_INFO
 *
 * @param divSetId Division set id
 * @param groupId Member's group id
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)getGroupDivisionInfo:(NSString *)divSetId
                     groupId:(NSString *)groupId
             completionBlock:(BCCompletionBlock)cb
        errorCompletionBlock:(BCErrorCompletionBlock)ecb
                    cbObject:(BCCallbackObject)cbObject;

/**
 * Returns a list of the member's group's recently active divisions, organized 
 * by simplified tournament state: ACTIVE, PENDING, COMPLETE.
 *
 * Service Name - tournament
 * Service Operation - GET_GROUP_DIVISIONS
 *
 * @param groupId Member's group id.
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)getGroupDivisions:(NSString *)groupId
          completionBlock:(BCCompletionBlock)cb
     errorCompletionBlock:(BCErrorCompletionBlock)ecb
                 cbObject:(BCCallbackObject)cbObject;

/**
 * Get tournament status associated with a leaderboard. 
 * Option parameter: leaderboard version id 'versionId'. 
 * If -1, defaults to current version.
 *
 * Service Name - tournament
 * Service Operation - GET_GROUP_TOURNAMENT_STATUS
 *
 * @param leaderboardId The leaderboard for the group tournament
 * @param groupId Member's group id
 * @param versionId Version of the tournament, use -1 for the latest version
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)getGroupTournamentStatus:(NSString *)leaderboardId
                         groupId:(NSString *)groupId
                       versionId:(int)versionId
                 completionBlock:(BCCompletionBlock)cb
            errorCompletionBlock:(BCErrorCompletionBlock)ecb
                        cbObject:(BCCallbackObject)cbObject;

/**
 * Similar to JoinGroupTournament(), except requires the division set id instead of the leaderboard id.
 *
 * Service Name - tournament
 * Service Operation - JOIN_GROUP_DIVISION
 *
 * @param divSetId Division set id
 * @param tournamentCode The code for the group tournament to join
 * @param groupId Member's group id
 * @param initialScore The initial score to give the group on the group leaderboard
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)joinGroupDivision:(NSString *)divSetId
           tournamentCode:(NSString *)tournamentCode
                  groupId:(NSString *)groupId
             initialScore:(int)initialScore
          completionBlock:(BCCompletionBlock)cb
     errorCompletionBlock:(BCErrorCompletionBlock)ecb
                 cbObject:(BCCallbackObject)cbObject;

/**
 * Enrolls a member's group in the group tournament and assigns an initial score
 *
 * Service Name - tournament
 * Service Operation - JOIN_GROUP_TOURNAMENT
 *
 * @param leaderboardId The leaderboard for the group tournament
 * @param tournamentCode Group tournament to join
 * @param groupId Member's group id
 * @param initialScore Initial score for the user
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)joinGroupTournament:(NSString *)leaderboardId
             tournamentCode:(NSString *)tournamentCode
                    groupId:(NSString *)groupId
               initialScore:(int)initialScore
            completionBlock:(BCCompletionBlock)cb
       errorCompletionBlock:(BCErrorCompletionBlock)ecb
                   cbObject:(BCCallbackObject)cbObject;

/**
 * Similar to LeaveGroupTournament(), but removes member's group from division 
 * instance and also ensures that the division instance is removed from the 
 * group's division list.
 *
 * Service Name - tournament
 * Service Operation - LEAVE_GROUP_DIVISION_INSTANCE
 *
 * @param leaderboardId Id of the division leaderboard the member's group is in
 * @param groupId Member's group id
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)leaveGroupDivisionInstance:(NSString *)leaderboardId
                           groupId:(NSString *)groupId
                   completionBlock:(BCCompletionBlock)cb
              errorCompletionBlock:(BCErrorCompletionBlock)ecb
                          cbObject:(BCCallbackObject)cbObject;

/**
 * Allows a group member to remove the group's score from the tournament leaderboard
 *
 * Service Name - tournament
 * Service Operation - LEAVE_GROUP_TOURNAMENT
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param groupId Member's group id
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)leaveGroupTournament:(NSString *)leaderboardId
                     groupId:(NSString *)groupId
             completionBlock:(BCCompletionBlock)cb
        errorCompletionBlock:(BCErrorCompletionBlock)ecb
                    cbObject:(BCCallbackObject)cbObject;

/**
 * Posts the given score for member's group to the group leaderboard. 
 * Group's score is updated, if applicable, based on 
 * leaderboard type (best score, latest score, cumulative score).
 *
 * Service Name - tournament
 * Service Operation - POST_GROUP_TOURNAMENT_SCORE
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param groupId Member's group id
 * @param score The score to post for group
 * @param jsonData Optional data attached to the group leaderboard entry, if updated
 * @param roundStartedTimeUTC UTC timestamp the member started the match resulting in the score being posted. (date in millis.)
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)postGroupTournamentScore:(NSString *)leaderboardId
                         groupId:(NSString *)groupId
                           score:(int)score
                        jsonData:(NSString *)jsonData
             roundStartedTimeUTC:(int64_t)roundStartedTimeUTC
                 completionBlock:(BCCompletionBlock)cb
            errorCompletionBlock:(BCErrorCompletionBlock)ecb
                        cbObject:(BCCallbackObject)cbObject;

/**
 * Posts the given score for member's group to the group leaderboard and returns leaderboard results. 
 * Group's score is updated, if applicable, based on 
 * leaderboard type (best score, latest score, cumulative score).
 *
 * Service Name - tournament
 * Service Operation - POST_GROUP_TOURNAMENT_SCORE_WITH_RESULTS
 *
 * @param leaderboardId The leaderboard for the tournament
 * @param groupId Member's group id
 * @param score The score to post for group
 * @param jsonData Optional data attached to the group leaderboard entry, if updated
 * @param roundStartedTimeUTC UTC timestamp the member started the match resulting in the score being posted. (date in millis.)
 * @param sortOrder Sort key for sort order of page. ("HIGH_TO_LOW" or "LOW_TO_HIGH")
 * @param beforeCount The count of groups to include before the current group
 * @param afterCount The count of groups to include after the current group
 * @param initialScore The initial score for group on first joining a tournament, applicable to this call if auto-join supported. Usually 0, unless leaderboard is LOW_VALUE
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server response
 * @param cbObject User object sent to the completion blocks
 */
- (void)postGroupTournamentScoreWithResults:(NSString *)leaderboardId
                                    groupId:(NSString *)groupId
                                      score:(int)score
                                   jsonData:(NSString *)jsonData
                        roundStartedTimeUTC:(int64_t)roundStartedTimeUTC
                                  sortOrder:(SortOrder)sortOrder
                                beforeCount:(int)beforeCount
                                 afterCount:(int)afterCount
                               initialScore:(int)initialScore
                            completionBlock:(BCCompletionBlock)cb
                       errorCompletionBlock:(BCErrorCompletionBlock)ecb
                                   cbObject:(BCCallbackObject)cbObject;

@end

#pragma clang diagnostic pop
