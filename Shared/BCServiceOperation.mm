#import "BCServiceOperation.hh"
#import "braincloud/ServiceOperation.h"

@implementation BCServiceOperation

+ (NSString *)Abandon {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Abandon.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AbandonMatchWithSummaryData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AbandonMatchWithSummaryData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AcceptGroupInvitation {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AcceptGroupInvitation.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AddEvent {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AddEvent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AddFriends {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AddFriends.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AddFriendsFromPlatform {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AddFriendsFromPlatform.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AddGroupMember {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AddGroupMember.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ApproveGroupJoinRequest {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ApproveGroupJoinRequest.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreCachePurchaseContext {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AppStoreCachePurchaseContext.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreFinalizePurchase {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AppStoreFinalizePurchase.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreGetEligiblePromotions {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AppStoreGetEligiblePromotions.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreGetSalesInventory {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AppStoreGetSalesInventory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreRefreshPromotions {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AppStoreRefreshPromotions.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreStartPurchase {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AppStoreStartPurchase.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreVerifyPurchase {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AppStoreVerifyPurchase.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Attach {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Attach.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AttachBlockchainIdentity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AttachBlockchainIdentity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AttachNonLoginUniversalId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AttachNonLoginUniversalId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AttachParentWithIdentity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AttachParentWithIdentity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AttachPeerProfile {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AttachPeerProfile.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Authenticate {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Authenticate.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AutoJoinGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AutoJoinGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AutoJoinGroupMulti {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AutoJoinGroupMulti.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AwardAchievements {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AwardAchievements.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AwardParentVC {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AwardParentVC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AwardUserItem {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AwardUserItem.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AwardVC {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::AwardVC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CancelFindRequest {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CancelFindRequest.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CancelGroupInvitation {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CancelGroupInvitation.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CancelMatch {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CancelMatch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CancelScheduledScript {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CancelScheduledScript.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CashInReceipt {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CashInReceipt.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ChangeEmailIdentity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ChangeEmailIdentity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ChannelConnect {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ChannelConnect.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ChannelDisconnect {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ChannelDisconnect.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CheckFilenameExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CheckFilenameExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CheckFullpathFilenameExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CheckFullpathFilenameExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ClaimTournamentReward {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ClaimTournamentReward.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ClearUserStatus {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ClearUserStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Complete {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Complete.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CompleteMatch {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CompleteMatch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CompleteMatchWithSummaryData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CompleteMatchWithSummaryData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ConfirmGooglePlayPurchase {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ConfirmGooglePlayPurchase.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ConsumeParentVC {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ConsumeParentVC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ConsumeVC {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ConsumeVC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Create {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Create.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CreateEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CreateEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CreateGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CreateGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CreateGroupEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CreateGroupEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CreateLobby {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CreateLobby.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CreateLobbyWithPingData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CreateLobbyWithPingData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CreateWithIndexedId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CreateWithIndexedId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomPageEvent {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CustomPageEvent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomScreenEvent {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CustomScreenEvent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomTrackEvent {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::CustomTrackEvent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataReset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DataReset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DecrementPlayerRating {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DecrementPlayerRating.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Delete {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Delete.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteChatMessage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteChatMessage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteEntities {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteEntities.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteGroupEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteGroupEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteGroupJoinRequest {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteGroupJoinRequest.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteGroupMember {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteGroupMember.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteIncoming {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteIncoming.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteIncomingEvents {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteIncomingEvents.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteIncomingEventsByTypeOlderThan {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteIncomingEventsByTypeOlderThan.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteIncomingEventsOlderThan {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteIncomingEventsOlderThan.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteMatch {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteMatch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteMessages {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteMessages.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteSent {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteSent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteSingleton {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteSingleton.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteStream {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteStream.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeleteUserFiles {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeleteUserFiles.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Deregister {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Deregister.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DeregisterAll {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DeregisterAll.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Detach {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Detach.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DetachBlockchainIdentity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DetachBlockchainIdentity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DetachParent {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DetachParent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DetachPeer {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DetachPeer.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DisableMatchMaking {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DisableMatchMaking.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DropUserItem {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::DropUserItem.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EligiblePromotions {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::EligiblePromotions.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EnableMatchMaking {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::EnableMatchMaking.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EndStream {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::EndStream.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ExtendUserStatus {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ExtendUserStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FinalizeSteamTransaction {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FinalizeSteamTransaction.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindLobby {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindLobby.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindLobbyWithPingData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindLobbyWithPingData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindMatches {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindMatches.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindMatchesCompleted {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindMatchesCompleted.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindOrCreateLobby {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindOrCreateLobby.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindOrCreateLobbyWithPingData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindOrCreateLobbyWithPingData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindPlayerByName {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindPlayerByName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindPlayerByUniversalId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindPlayerByUniversalId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindPlayers {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindPlayers.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindPlayersUsingFilter {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindPlayersUsingFilter.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindUserByExactUniversalId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindUserByExactUniversalId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindUsersByExactName {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindUsersByExactName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindUsersByNameStartingWith {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindUsersByNameStartingWith.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindUsersBySubstrName {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindUsersBySubstrName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FindUsersByUniversalIdStartingWith {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FindUsersByUniversalIdStartingWith.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ForcePush {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ForcePush.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FullReset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::FullReset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetAttributes {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetAttributes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetBlockchainItems {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetBlockchainItems.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetCatalogItemDefinition {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetCatalogItemDefinition.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetCatalogItemsPage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetCatalogItemsPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetCatalogItemsPageOffset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetCatalogItemsPageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetCdnUrl {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetCdnUrl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetChannelId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetChannelId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetChannelInfo {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetChannelInfo.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetChatMessage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetChatMessage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetChildProfiles {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetChildProfiles.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetCompletedTournament {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetCompletedTournament.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetCount {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetCount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetCustomEntityPage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetCustomEntityPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetDivisionInfo {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetDivisionInfo.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetEntityPage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetEntityPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetEntityPageOffset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetEntityPageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetEvents {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetEvents.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetExpiredIdentities {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetExpiredIdentities.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetExternalIdForProfileId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetExternalIdForProfileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetFileInfo {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetFileInfo.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetFileInfoSimple {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetFileInfoSimple.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetFileList {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetFileList.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetFriendProfileInfoForExternalId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetFriendProfileInfoForExternalId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGlobalCDNUrl {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGlobalCDNUrl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGlobalFileList {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGlobalFileList.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGlobalLeaderboard {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGlobalLeaderboard.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGlobalLeaderboardEntryCount {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGlobalLeaderboardEntryCount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGlobalLeaderboardPage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGlobalLeaderboardPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGlobalLeaderboardPageIfExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGlobalLeaderboardPageIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGlobalLeaderboardVersions {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGlobalLeaderboardVersions.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGlobalLeaderboardView {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGlobalLeaderboardView.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGlobalLeaderboardViewIfExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGlobalLeaderboardViewIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGroupLeaderboardView {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGroupLeaderboardView.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGroupSocialLeaderboard {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGroupSocialLeaderboard.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetGroupSocialLeaderboardByVersion {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetGroupSocialLeaderboardByVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetIdentities {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetIdentities.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetIdentityStatus {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetIdentityStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetInventory {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetInventory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetList {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetList.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetListByIndexedId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetListByIndexedId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetListCount {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetListCount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetLobbyData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetLobbyData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetLobbyInstances {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetLobbyInstances.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetLobbyInstancesWithPingData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetLobbyInstancesWithPingData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetMessageboxes {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetMessageboxes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetMessageCounts {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetMessageCounts.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetMessages {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetMessages.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetMessagesPage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetMessagesPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetMessagesPageOffset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetMessagesPageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetMultiSocialLeaderboard {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetMultiSocialLeaderboard.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetMyDivisions {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetMyDivisions.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetMyGroups {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetMyGroups.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPageOffset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetParentVC {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetParentVC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPeerProfiles {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPeerProfiles.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPlayerScore {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPlayerScore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPlayerScores {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPlayerScores.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPlayerScoresFromLeaderboards {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPlayerScoresFromLeaderboards.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPlayersSocialLeaderboard {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPlayersSocialLeaderboard.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPlayersSocialLeaderboardByVersion {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPlayersSocialLeaderboardByVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPlayersSocialLeaderboardByVersionIfExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPlayersSocialLeaderboardByVersionIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPlayersSocialLeaderboardIfExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPlayersSocialLeaderboardIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPlayerVC {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPlayerVC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPresenceOfFriends {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPresenceOfFriends.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPresenceOfGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPresenceOfGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetPresenceOfUsers {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetPresenceOfUsers.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetProfileInfoForCredential {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetProfileInfoForCredential.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetProfileInfoForCredentialIfExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetProfileInfoForCredentialIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetProfileInfoForExternalAuthId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetProfileInfoForExternalAuthId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetProfileInfoForExternalAuthIdIfExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetProfileInfoForExternalAuthIdIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetRandomEntitiesMatching {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetRandomEntitiesMatching.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetRandomGroupsMatching {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetRandomGroupsMatching.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetRecentChatMessages {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetRecentChatMessages.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetRecentStreamsForInitiatingPlayer {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetRecentStreamsForInitiatingPlayer.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetRecentStreamsForTargetPlayer {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetRecentStreamsForTargetPlayer.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetRedeemedCodes {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetRedeemedCodes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetRegionsForLobbies {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetRegionsForLobbies.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetRunningOrQueuedCloudScripts {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetRunningOrQueuedCloudScripts.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetScheduledCloudScripts {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetScheduledCloudScripts.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetServerVersion {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetServerVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetShieldExpiry {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetShieldExpiry.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetSocialLeaderboard {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetSocialLeaderboard.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetSocialLeaderboardByVersion {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetSocialLeaderboardByVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetSocialLeaderboardByVersionIfExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetSocialLeaderboardByVersionIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetSocialLeaderboardIfExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetSocialLeaderboardIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetStreamSummariesForInitiatingPlayer {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetStreamSummariesForInitiatingPlayer.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetStreamSummariesForTargetPlayer {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetStreamSummariesForTargetPlayer.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetSubscribedChannels {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetSubscribedChannels.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetSummaryDataForProfileId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetSummaryDataForProfileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetTournamentStatus {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetTournamentStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetUniqs {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetUniqs.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetUpdatedFiles {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetUpdatedFiles.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetUserInfo {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetUserInfo.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetUserItem {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetUserItem.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetUserItemsPage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetUserItemsPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetUserItemsPageOffset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetUserItemsPageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetUsersOnlineStatus {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetUsersOnlineStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GetUserStatus {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GetUserStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GiveUserItemTo {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GiveUserItemTo.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupCopyFile {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GroupCopyFile.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupDeleteFile {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GroupDeleteFile.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupMoveFile {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::GroupMoveFile.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementGlobalEntityData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementGlobalEntityData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementGroupData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementGroupData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementGroupEntityData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementGroupEntityData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementPlayerRating {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementPlayerRating.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementSharedUserEntityData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementSharedUserEntityData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementShieldOnFor {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementShieldOnFor.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementSingletonData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementSingletonData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementThirdPartyLeaderboardScore {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementThirdPartyLeaderboardScore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IncrementUserEntityData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IncrementUserEntityData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)InitThirdParty {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::InitThirdParty.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)InviteGroupMember {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::InviteGroupMember.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IsThirdPartyAchievementComplete {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::IsThirdPartyAchievementComplete.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)JoinDivision {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::JoinDivision.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)JoinGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::JoinGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)JoinLobby {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::JoinLobby.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)JoinLobbyWithPingData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::JoinLobbyWithPingData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)JoinTournament {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::JoinTournament.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LastUploadStatus {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::LastUploadStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LaunchAchievementUI {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::LaunchAchievementUI.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LeaveDivisionInstance {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::LeaveDivisionInstance.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LeaveGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::LeaveGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LeaveLobby {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::LeaveLobby.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LeaveTournament {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::LeaveTournament.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ListAllLeaderboards {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ListAllLeaderboards.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ListFriends {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ListFriends.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ListGroupsPage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ListGroupsPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ListGroupsPageByOffset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ListGroupsPageByOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ListGroupsWithMember {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ListGroupsWithMember.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ListUserFiles {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ListUserFiles.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Logout {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Logout.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MakeSystemEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::MakeSystemEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MarkMessagesRead {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::MarkMessagesRead.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Merge {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Merge.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingSendMessage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::MessagingSendMessage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MoveUserToGroupFile {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::MoveUserToGroupFile.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)None {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::None.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PingRegions {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PingRegions.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostChatMessage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostChatMessage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostScore {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostScore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostScoreDynamic {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostScoreDynamic.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostScoreDynamicUsingConfig {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostScoreDynamicUsingConfig.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostScoreToDynamicGroupLeaderboard {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostScoreToDynamicGroupLeaderboard.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostScoreToDynamicGroupLeaderboardUsingConfig {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostScoreToDynamicGroupLeaderboardUsingConfig.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostScoreToGroupLeaderboard {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostScoreToGroupLeaderboard.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostThirdPartyLeaderboardAchievement {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostThirdPartyLeaderboardAchievement.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostThirdPartyLeaderboardScore {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostThirdPartyLeaderboardScore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostTournamentScore {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostTournamentScore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PostTournamentScoreWithResults {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PostTournamentScoreWithResults.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PrepareUserUpload {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PrepareUserUpload.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProcessStatistics {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ProcessStatistics.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfanityCheck {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ProfanityCheck.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfanityIdenitfyBadWords {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ProfanityIdenitfyBadWords.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfanityReplaceText {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ProfanityReplaceText.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProtectStreamUntil {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ProtectStreamUntil.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PublishUserItemToBlockchain {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PublishUserItemToBlockchain.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PurchaseUserItem {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::PurchaseUserItem.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)QueryThirdPartyAchievements {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::QueryThirdPartyAchievements.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Read {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Read.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadAchievedAchievements {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadAchievedAchievements.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadAchievements {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadAchievements.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadByType {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadByType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadCompletedMilestones {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadCompletedMilestones.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadCompletedQuests {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadCompletedQuests.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadForCategory {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadForCategory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadFriendEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadFriendEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadFriends {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadFriends.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadFriendsEntities {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadFriendsEntities.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadFriendsPlayerState {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadFriendsPlayerState.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadFriendsWithApplication {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadFriendsWithApplication.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadGameStatisticsByCategory {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadGameStatisticsByCategory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadGroupData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadGroupData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadGroupEntitiesPage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadGroupEntitiesPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadGroupEntitiesPageByOffset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadGroupEntitiesPageByOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadGroupEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadGroupEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadGroupMembers {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadGroupMembers.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadInProgressMilestones {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadInProgressMilestones.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadInProgressQuests {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadInProgressQuests.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadMatch {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadMatch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadMatchHistory {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadMatchHistory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadMilestones {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadMilestones.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadMilestonesByCategory {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadMilestonesByCategory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadNextXplevel {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadNextXplevel.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadNotStartedQuests {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadNotStartedQuests.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadPlayerStatisticsByCategory {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadPlayerStatisticsByCategory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadProperties {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadProperties.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadPropertiesInCategories {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadPropertiesInCategories.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadQuests {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadQuests.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadQuestsByCategory {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadQuestsByCategory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadQuestsWithBasicPercentage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadQuestsWithBasicPercentage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadQuestsWithComplexPercentage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadQuestsWithComplexPercentage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadQuestsWithStatus {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadQuestsWithStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadSelectedProperties {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadSelectedProperties.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadShared {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadShared.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadSharedEntitesList {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadSharedEntitesList.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadSharedEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadSharedEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadSingleton {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadSingleton.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadStream {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadStream.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadSubset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadSubset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReadXpLevels {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReadXpLevels.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ReceiveUserItemFrom {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ReceiveUserItemFrom.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RedeemCode {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RedeemCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RefreshBlockchainUserItems {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RefreshBlockchainUserItems.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RefreshIdentity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RefreshIdentity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Register {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Register.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RegisterListenersForFriends {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RegisterListenersForFriends.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RegisterListenersForGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RegisterListenersForGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RegisterListenersForProfiles {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RegisterListenersForProfiles.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RejectGroupInvitation {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RejectGroupInvitation.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RejectGroupJoinRequest {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RejectGroupJoinRequest.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RemoveAttributes {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RemoveAttributes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RemoveFriends {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RemoveFriends.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RemoveGroupMember {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RemoveGroupMember.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RemoveGroupScore {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RemoveGroupScore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RemoveMember {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RemoveMember.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RemovePlayerScore {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RemovePlayerScore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RemoveUserItemFromBlockchain {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RemoveUserItemFromBlockchain.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RequestClientConnection {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RequestClientConnection.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Reset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Reset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetEmailPassword {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetEmailPassword.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetEmailPasswordAdvanced {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetEmailPasswordAdvanced.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetEmailPasswordAdvancedWithExpiry {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetEmailPasswordAdvancedWithExpiry.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetEmailPasswordWithExpiry {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetEmailPasswordWithExpiry.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetMilestones {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetMilestones.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetParentVC {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetParentVC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetPlayerRating {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetPlayerRating.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetPlayerVC {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetPlayerVC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetThirdPartyAchievements {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetThirdPartyAchievements.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetUniversalIdPassword {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetUniversalIdPassword.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetUniversalIdPasswordAdvanced {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetUniversalIdPasswordAdvanced.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetUniversalIdPasswordAdvancedWithExpiry {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetUniversalIdPasswordAdvancedWithExpiry.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ResetUniversalIdPasswordWithExpiry {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ResetUniversalIdPasswordWithExpiry.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RewardTournament {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RewardTournament.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Run {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Run.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RunParentScript {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RunParentScript.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RunPeerScript {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RunPeerScript.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RunPeerScriptAsync {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::RunPeerScriptAsync.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScheduleCloudScript {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ScheduleCloudScript.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScheduleNormalizedNotification {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ScheduleNormalizedNotification.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScheduleRawNotification {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ScheduleRawNotification.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScheduleRichNotification {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ScheduleRichNotification.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SellUserItem {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SellUserItem.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Send {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Send.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendAdvancedEmail {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendAdvancedEmail.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendAdvancedEmailByAddress {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendAdvancedEmailByAddress.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendAdvancedEmailByAddresses {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendAdvancedEmailByAddresses.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendBasicEmail {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendBasicEmail.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendEventToProfiles {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendEventToProfiles.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendMessageSimple {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendMessageSimple.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendNormalized {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendNormalized.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendNormalizedBatch {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendNormalizedBatch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendNormalizedToGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendNormalizedToGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendRaw {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendRaw.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendRawBatch {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendRawBatch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendRawToGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendRawToGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendRich {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendRich.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendSignal {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendSignal.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendSimple {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendSimple.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SendTemplatedToGroup {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SendTemplatedToGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SetGroupOpen {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SetGroupOpen.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SetPlayerRating {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SetPlayerRating.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SetUserStatus {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SetUserStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SetVisibility {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SetVisibility.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SetXpPoints {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SetXpPoints.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ShieldOff {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ShieldOff.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ShieldOn {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ShieldOn.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ShieldOnFor {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ShieldOnFor.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)StartMatch {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::StartMatch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)StartSteamTransaction {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::StartSteamTransaction.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)StartStream {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::StartStream.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)StopListening {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::StopListening.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SubmitCrashReport {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SubmitCrashReport.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SubmitTurn {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SubmitTurn.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SwitchTeam {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SwitchTeam.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SwitchToChildProfile {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SwitchToChildProfile.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SwitchToParentProfile {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::SwitchToParentProfile.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Trigger {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Trigger.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TriggerGrantExperience {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::TriggerGrantExperience.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TriggerMultiple {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::TriggerMultiple.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Tweet {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Tweet.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Update {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Update.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateAcl {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateAcl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateActivity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateActivity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateAttributes {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateAttributes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateChatMessage {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateChatMessage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateContactEmail {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateContactEmail.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateEntity {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateEntityFields {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateEntityFields.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateEntityFieldsSharded {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateEntityFieldsSharded.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateEntityIndexedId {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateEntityIndexedId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateEntityOwnerAndAcl {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateEntityOwnerAndAcl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateEventData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateEventData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateEventDataIfExists {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateEventDataIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateFileInfo {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateFileInfo.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateGroupAcl {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateGroupAcl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateGroupData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateGroupData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateGroupEntityAcl {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateGroupEntityAcl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateGroupEntityData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateGroupEntityData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateGroupMember {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateGroupMember.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateGroupName {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateGroupName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateGroupSummaryData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateGroupSummaryData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateIncrement {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateIncrement.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateIncrementToMaximum {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateIncrementToMaximum.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateLanguageCode {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateLanguageCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateMatchStateCurrentTurn {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateMatchStateCurrentTurn.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateMatchSummary {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateMatchSummary.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdatePartial {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdatePartial.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdatePlayerPicture {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdatePlayerPicture.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateReady {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateReady.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateSetMinimum {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateSetMinimum.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateSettings {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateSettings.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateShared {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateShared.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateSingleton {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateSingleton.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateSingletonFields {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateSingletonFields.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateSummary {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateSummary.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateTimeToLive {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateTimeToLive.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateTimeZoneOffset {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateTimeZoneOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateUniversalIdLogin {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateUniversalIdLogin.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateUserItemData {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateUserItemData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateUserName {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UpdateUserName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UseUserItem {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::UseUserItem.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Verify {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::Verify.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VerifyMicrosoftReceipt {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::VerifyMicrosoftReceipt.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ViewCurrentReward {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ViewCurrentReward.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ViewReward {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::ViewReward.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VirtualCurrencyGetCurrency {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::VirtualCurrencyGetCurrency.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VirtualCurrencyGetParentCurrency {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::VirtualCurrencyGetParentCurrency.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VirtualCurrencyGetPeerCurrency {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::VirtualCurrencyGetPeerCurrency.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VirtualCurrencyResetCurrency {
    return [NSString stringWithCString:BrainCloud::ServiceOperation::VirtualCurrencyResetCurrency.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

@end
