///////////////////////////////////////////////////////////////////
// generated by ./generate_service_op.sh, do not edit manually!
///////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>

#pragma once

extern NSString const *const BrainCloudServiceOperationNone;
extern NSString const *const BrainCloudServiceOperationAuthenticate;
extern NSString const *const BrainCloudServiceOperationAttach;
extern NSString const *const BrainCloudServiceOperationMerge;
extern NSString const *const BrainCloudServiceOperationDetach;
extern NSString const *const BrainCloudServiceOperationResetEmailPassword;
extern NSString const *const BrainCloudServiceOperationSwitchToChildProfile;
extern NSString const *const BrainCloudServiceOperationSwitchToParentProfile;
extern NSString const *const BrainCloudServiceOperationGetChildProfiles;
extern NSString const *const BrainCloudServiceOperationCreate;
extern NSString const *const BrainCloudServiceOperationCreateWithIndexedId;
extern NSString const *const BrainCloudServiceOperationReset;
extern NSString const *const BrainCloudServiceOperationRead;
extern NSString const *const BrainCloudServiceOperationReadSingleton;
extern NSString const *const BrainCloudServiceOperationReadByType;
extern NSString const *const BrainCloudServiceOperationVerify;
extern NSString const *const BrainCloudServiceOperationReadShared;
extern NSString const *const BrainCloudServiceOperationDeregister;
extern NSString const *const BrainCloudServiceOperationDeregisterAll;
extern NSString const *const BrainCloudServiceOperationRegister;
extern NSString const *const BrainCloudServiceOperationSendSimple;
extern NSString const *const BrainCloudServiceOperationSendRich;
extern NSString const *const BrainCloudServiceOperationTrigger;
extern NSString const *const BrainCloudServiceOperationTriggerMultiple;
extern NSString const *const BrainCloudServiceOperationTriggerGrantExperience;
extern NSString const *const BrainCloudServiceOperationFullReset;
extern NSString const *const BrainCloudServiceOperationDataReset;
extern NSString const *const BrainCloudServiceOperationUpdate;
extern NSString const *const BrainCloudServiceOperationUpdatePartial;
extern NSString const *const BrainCloudServiceOperationUpdateShared;
extern NSString const *const BrainCloudServiceOperationUpdateSingleton;
extern NSString const *const BrainCloudServiceOperationUpdateAcl;
extern NSString const *const BrainCloudServiceOperationUpdateTimeToLive;
extern NSString const *const BrainCloudServiceOperationDelete;
extern NSString const *const BrainCloudServiceOperationDeleteSingleton;
extern NSString const *const BrainCloudServiceOperationUpdateSummary;
extern NSString const *const BrainCloudServiceOperationUpdateSetMinimum;
extern NSString const *const BrainCloudServiceOperationUpdateIncrementToMaximum;
extern NSString const *const BrainCloudServiceOperationGetFriendProfileInfoForExternalId;
extern NSString const *const BrainCloudServiceOperationGetExternalIdForProfileId;
extern NSString const *const BrainCloudServiceOperationReadFriendEntity;
extern NSString const *const BrainCloudServiceOperationReadFriendsEntities;
extern NSString const *const BrainCloudServiceOperationReadFriendsWithApplication;
extern NSString const *const BrainCloudServiceOperationReadFriends;
extern NSString const *const BrainCloudServiceOperationReadFriendsPlayerState;
extern NSString const *const BrainCloudServiceOperationFindPlayerByName;
extern NSString const *const BrainCloudServiceOperationGetSocialLeaderboard;
extern NSString const *const BrainCloudServiceOperationGetSocialLeaderboardIfExists;
extern NSString const *const BrainCloudServiceOperationGetMultiSocialLeaderboard;
extern NSString const *const BrainCloudServiceOperationGetGlobalLeaderboard;
extern NSString const *const BrainCloudServiceOperationGetGlobalLeaderboardPage;
extern NSString const *const BrainCloudServiceOperationGetGlobalLeaderboardPageIfExists;
extern NSString const *const BrainCloudServiceOperationGetGlobalLeaderboardView;
extern NSString const *const BrainCloudServiceOperationGetGlobalLeaderboardViewIfExists;
extern NSString const *const BrainCloudServiceOperationGetGlobalLeaderboardVersions;
extern NSString const *const BrainCloudServiceOperationGetCompletedTournament;
extern NSString const *const BrainCloudServiceOperationRewardTournament;
extern NSString const *const BrainCloudServiceOperationPostScore;
extern NSString const *const BrainCloudServiceOperationPostScoreDynamic;
extern NSString const *const BrainCloudServiceOperationPostScoreDynamicUsingConfig;
extern NSString const *const BrainCloudServiceOperationInitThirdParty;
extern NSString const *const BrainCloudServiceOperationPostThirdPartyLeaderboardScore;
extern NSString const *const BrainCloudServiceOperationIncrementThirdPartyLeaderboardScore;
extern NSString const *const BrainCloudServiceOperationLaunchAchievementUI;
extern NSString const *const BrainCloudServiceOperationPostThirdPartyLeaderboardAchievement;
extern NSString const *const BrainCloudServiceOperationIsThirdPartyAchievementComplete;
extern NSString const *const BrainCloudServiceOperationResetThirdPartyAchievements;
extern NSString const *const BrainCloudServiceOperationQueryThirdPartyAchievements;
extern NSString const *const BrainCloudServiceOperationGetInventory;
extern NSString const *const BrainCloudServiceOperationCashInReceipt;
extern NSString const *const BrainCloudServiceOperationAwardVC;
extern NSString const *const BrainCloudServiceOperationConsumeVC;
extern NSString const *const BrainCloudServiceOperationGetPlayerVC;
extern NSString const *const BrainCloudServiceOperationResetPlayerVC;
extern NSString const *const BrainCloudServiceOperationAwardParentVC;
extern NSString const *const BrainCloudServiceOperationConsumeParentVC;
extern NSString const *const BrainCloudServiceOperationGetParentVC;
extern NSString const *const BrainCloudServiceOperationResetParentVC;
extern NSString const *const BrainCloudServiceOperationSend;
extern NSString const *const BrainCloudServiceOperationUpdateEventData;
extern NSString const *const BrainCloudServiceOperationDeleteSent;
extern NSString const *const BrainCloudServiceOperationDeleteIncoming;
extern NSString const *const BrainCloudServiceOperationGetEvents;
extern NSString const *const BrainCloudServiceOperationUpdateIncrement;
extern NSString const *const BrainCloudServiceOperationReadNextXplevel;
extern NSString const *const BrainCloudServiceOperationReadXpLevels;
extern NSString const *const BrainCloudServiceOperationReadSubset;
extern NSString const *const BrainCloudServiceOperationReadForCategory;
extern NSString const *const BrainCloudServiceOperationSetXpPoints;
extern NSString const *const BrainCloudServiceOperationRun;
extern NSString const *const BrainCloudServiceOperationTweet;
extern NSString const *const BrainCloudServiceOperationAwardAchievements;
extern NSString const *const BrainCloudServiceOperationReadAchievements;
extern NSString const *const BrainCloudServiceOperationReadAchievedAchievements;
extern NSString const *const BrainCloudServiceOperationSetPlayerRating;
extern NSString const *const BrainCloudServiceOperationResetPlayerRating;
extern NSString const *const BrainCloudServiceOperationIncrementPlayerRating;
extern NSString const *const BrainCloudServiceOperationDecrementPlayerRating;
extern NSString const *const BrainCloudServiceOperationShieldOn;
extern NSString const *const BrainCloudServiceOperationShieldOnFor;
extern NSString const *const BrainCloudServiceOperationShieldOff;
extern NSString const *const BrainCloudServiceOperationGetShieldExpiry;
extern NSString const *const BrainCloudServiceOperationFindPlayers;
extern NSString const *const BrainCloudServiceOperationFindPlayersUsingFilter;
extern NSString const *const BrainCloudServiceOperationSubmitTurn;
extern NSString const *const BrainCloudServiceOperationUpdateMatchStateCurrentTurn;
extern NSString const *const BrainCloudServiceOperationUpdateMatchSummary;
extern NSString const *const BrainCloudServiceOperationAbandon;
extern NSString const *const BrainCloudServiceOperationComplete;
extern NSString const *const BrainCloudServiceOperationReadMatch;
extern NSString const *const BrainCloudServiceOperationReadMatchHistory;
extern NSString const *const BrainCloudServiceOperationFindMatches;
extern NSString const *const BrainCloudServiceOperationFindMatchesCompleted;
extern NSString const *const BrainCloudServiceOperationDeleteMatch;
extern NSString const *const BrainCloudServiceOperationLastUploadStatus;
extern NSString const *const BrainCloudServiceOperationReadQuests;
extern NSString const *const BrainCloudServiceOperationReadCompletedQuests;
extern NSString const *const BrainCloudServiceOperationReadInProgressQuests;
extern NSString const *const BrainCloudServiceOperationReadNotStartedQuests;
extern NSString const *const BrainCloudServiceOperationReadQuestsWithStatus;
extern NSString const *const BrainCloudServiceOperationReadQuestsWithBasicPercentage;
extern NSString const *const BrainCloudServiceOperationReadQuestsWithComplexPercentage;
extern NSString const *const BrainCloudServiceOperationReadQuestsByCategory;
extern NSString const *const BrainCloudServiceOperationReadGameStatisticsByCategory;
extern NSString const *const BrainCloudServiceOperationReadPlayerStatisticsByCategory;
extern NSString const *const BrainCloudServiceOperationReadMilestones;
extern NSString const *const BrainCloudServiceOperationReadMilestonesByCategory;
extern NSString const *const BrainCloudServiceOperationResetMilestones;
extern NSString const *const BrainCloudServiceOperationReadCompletedMilestones;
extern NSString const *const BrainCloudServiceOperationReadInProgressMilestones;
extern NSString const *const BrainCloudServiceOperationLogout;
extern NSString const *const BrainCloudServiceOperationUpdateName;
extern NSString const *const BrainCloudServiceOperationStartMatch;
extern NSString const *const BrainCloudServiceOperationCancelMatch;
extern NSString const *const BrainCloudServiceOperationCompleteMatch;
extern NSString const *const BrainCloudServiceOperationEnableMatchMaking;
extern NSString const *const BrainCloudServiceOperationStartStream;
extern NSString const *const BrainCloudServiceOperationReadStream;
extern NSString const *const BrainCloudServiceOperationEndStream;
extern NSString const *const BrainCloudServiceOperationDeleteStream;
extern NSString const *const BrainCloudServiceOperationAddEvent;
extern NSString const *const BrainCloudServiceOperationGetStreamSummariesForInitiatingPlayer;
extern NSString const *const BrainCloudServiceOperationGetStreamSummariesForTargetPlayer;
extern NSString const *const BrainCloudServiceOperationGetRecentStreamsForInitiatingPlayer;
extern NSString const *const BrainCloudServiceOperationGetRecentStreamsForTargetPlayer;
extern NSString const *const BrainCloudServiceOperationGetUserInfo;
extern NSString const *const BrainCloudServiceOperationStartSteamTransaction;
extern NSString const *const BrainCloudServiceOperationFinalizeSteamTransaction;
extern NSString const *const BrainCloudServiceOperationVerifyMicrosoftReceipt;
extern NSString const *const BrainCloudServiceOperationConfirmGooglePlayPurchase;
extern NSString const *const BrainCloudServiceOperationEligiblePromotions;
extern NSString const *const BrainCloudServiceOperationGetList;
extern NSString const *const BrainCloudServiceOperationGetListByIndexedId;
extern NSString const *const BrainCloudServiceOperationGetListCount;
extern NSString const *const BrainCloudServiceOperationGetPage;
extern NSString const *const BrainCloudServiceOperationGetPageOffset;
extern NSString const *const BrainCloudServiceOperationGetAttributes;
extern NSString const *const BrainCloudServiceOperationUpdateAttributes;
extern NSString const *const BrainCloudServiceOperationRemoveAttributes;
extern NSString const *const BrainCloudServiceOperationUpdatePlayerPicture;
extern NSString const *const BrainCloudServiceOperationUpdateContactEmail;
extern NSString const *const BrainCloudServiceOperationReadProperties;
extern NSString const *const BrainCloudServiceOperationGetUpdatedFiles;
extern NSString const *const BrainCloudServiceOperationGetFileList;
extern NSString const *const BrainCloudServiceOperationScheduleCloudScript;
extern NSString const *const BrainCloudServiceOperationRunParentScript;
extern NSString const *const BrainCloudServiceOperationRedeemCode;
extern NSString const *const BrainCloudServiceOperationGetRedeemedCodes;
extern NSString const *const BrainCloudServiceOperationCustomPageEvent;
extern NSString const *const BrainCloudServiceOperationCustomScreenEvent;
extern NSString const *const BrainCloudServiceOperationCustomTrackEvent;
extern NSString const *const BrainCloudServiceOperationProfanityCheck;
extern NSString const *const BrainCloudServiceOperationProfanityReplaceText;
extern NSString const *const BrainCloudServiceOperationProfanityIdenitfyBadWords;
extern NSString const *const BrainCloudServiceOperationPrepareUserUpload;
extern NSString const *const BrainCloudServiceOperationListUserFiles;
extern NSString const *const BrainCloudServiceOperationDeleteUserFiles;

