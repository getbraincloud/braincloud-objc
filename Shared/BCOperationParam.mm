// Copyright 2026 bitHeads, Inc. All Rights Reserved.

#import "BCOperationParam.hh"
#import "braincloud/OperationParam.h"

@implementation BCOperationParam

+ (NSString *)AlertContent {
    return [NSString stringWithCString:BrainCloud::OperationParam::AlertContent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Algo {
    return [NSString stringWithCString:BrainCloud::OperationParam::Algo.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreCategory {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStoreCategory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStorePayload {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStorePayload.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStorePriceInfoCriteria {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStorePriceInfoCriteria.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStorePurchaseData {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStorePurchaseData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreReceiptData {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStoreReceiptData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreStoreIAPId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStoreStoreIAPId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreStoreId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStoreStoreId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreTransactionData {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStoreTransactionData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreTransactionId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStoreTransactionId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AppStoreUserCurrency {
    return [NSString stringWithCString:BrainCloud::OperationParam::AppStoreUserCurrency.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServiceCurrentPlayer {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServiceCurrentPlayer.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServiceMatchId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServiceMatchId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServiceMatchState {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServiceMatchState.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServiceMatchStatus {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServiceMatchStatus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServiceMatchSummary {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServiceMatchSummary.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServiceOwnerId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServiceOwnerId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServicePlayers {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServicePlayers.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServicePushMessage {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServicePushMessage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServiceStatistics {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServiceStatistics.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatchServiceVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::AsyncMatchServiceVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAnonymousId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAnonymousId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthAnonymous {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthAnonymous.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthEmail {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthEmail.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthenticationToken {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthenticationToken.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthenticationType {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthenticationType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthExternal {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthExternal.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthFacebook {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthFacebook.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthGameCenter {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthGameCenter.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthGoogle {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthGoogle.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthOculus {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthOculus.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthParse {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthParse.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthSteam {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthSteam.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthTwitter {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthTwitter.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthUniversal {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthUniversal.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateAuthUpgradeId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateAuthUpgradeId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateBrainCloudVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateBrainCloudVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateCompressResponses {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateCompressResponses.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateCountryCode {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateCountryCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateDeviceId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateDeviceId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateEmailAddress {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateEmailAddress.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateExternalAuthName {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateExternalAuthName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateExternalId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateExternalId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateExtraJson {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateExtraJson.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateForceCreate {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateForceCreate.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateForceMergeFlag {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateForceMergeFlag.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateGameId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateGameId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateGameVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateGameVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateLanguageCode {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateLanguageCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateProfileId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateProfileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateRegion {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateRegion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateReleasePlatform {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateReleasePlatform.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateServiceParams {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateServiceParams.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateTimeZoneOffset {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateTimeZoneOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateTokenTtlInMinutes {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateTokenTtlInMinutes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateServiceAuthenticateUniversalId {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticateServiceAuthenticateUniversalId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticationServiceAuthenticationLevelName {
    return [NSString stringWithCString:BrainCloud::OperationParam::AuthenticationServiceAuthenticationLevelName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)BlockChainContext {
    return [NSString stringWithCString:BrainCloud::OperationParam::BlockChainContext.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)BlockChainIntegrationId {
    return [NSString stringWithCString:BrainCloud::OperationParam::BlockChainIntegrationId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Body {
    return [NSString stringWithCString:BrainCloud::OperationParam::Body.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ChannelId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ChannelId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ChannelSubId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ChannelSubId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ChannelType {
    return [NSString stringWithCString:BrainCloud::OperationParam::ChannelType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Content {
    return [NSString stringWithCString:BrainCloud::OperationParam::Content.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomData {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityFieldsJson {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityFieldsJson.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceAcl {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceAcl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceContext {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceContext.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceData {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceDeleteCriteria {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceDeleteCriteria.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceDoCount {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceDoCount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceEntityId {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceEntityId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceEntityType {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceEntityType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceIsOwned {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceIsOwned.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceMaxReturn {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceMaxReturn.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServicePageOffset {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServicePageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceRowsPerPage {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceRowsPerPage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceSearchJson {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceSearchJson.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceSortJson {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceSortJson.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceTimeToLive {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceTimeToLive.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityServiceVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityServiceVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntityShardKeyJson {
    return [NSString stringWithCString:BrainCloud::OperationParam::CustomEntityShardKeyJson.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CxId {
    return [NSString stringWithCString:BrainCloud::OperationParam::CxId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Data {
    return [NSString stringWithCString:BrainCloud::OperationParam::Data.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamCrashJson {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamCrashJson.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamCrashLog {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamCrashLog.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamCrashType {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamCrashType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamErrorMsg {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamErrorMsg.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamEventName {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamEventName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamEventProperties {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamEventProperties.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamUserEmail {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamUserEmail.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamUsername {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamUsername.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamUserNotes {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamUserNotes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStreamUserSubmitted {
    return [NSString stringWithCString:BrainCloud::OperationParam::DataStreamUserSubmitted.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DivSetID {
    return [NSString stringWithCString:BrainCloud::OperationParam::DivSetID.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EmailAddress {
    return [NSString stringWithCString:BrainCloud::OperationParam::EmailAddress.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EmailAddresses {
    return [NSString stringWithCString:BrainCloud::OperationParam::EmailAddresses.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntityServiceAcl {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntityServiceAcl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntityServiceData {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntityServiceData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntityServiceEntityId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntityServiceEntityId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntityServiceEntitySubtype {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntityServiceEntitySubtype.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntityServiceEntityType {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntityServiceEntityType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntityServiceFriendData {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntityServiceFriendData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntityServiceTargetPlayerId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntityServiceTargetPlayerId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntityServiceUpdateOps {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntityServiceUpdateOps.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntityServiceVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntityServiceVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EntryId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EntryId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceDateMillis {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceDateMillis.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceDeleteIncomingEventId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceDeleteIncomingEventId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceDeleteIncomingFromId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceDeleteIncomingFromId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceDeleteSentEventId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceDeleteSentEventId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceDeleteSentToId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceDeleteSentToId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceEventType {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceEventType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceEvIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceEvIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceIncludeIncomingEvents {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceIncludeIncomingEvents.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceIncludeSentEvents {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceIncludeSentEvents.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceSendEventData {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceSendEventData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceSendEventId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceSendEventId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceSendEventType {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceSendEventType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceSendRecordLocally {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceSendRecordLocally.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceSendToId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceSendToId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceToIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceToIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceUpdateEventDataData {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceUpdateEventDataData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceUpdateEventDataEventId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceUpdateEventDataEventId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EventServiceUpdateEventDataFromId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EventServiceUpdateEventDataFromId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)EvId {
    return [NSString stringWithCString:BrainCloud::OperationParam::EvId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ExternalAuthType {
    return [NSString stringWithCString:BrainCloud::OperationParam::ExternalAuthType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ExtraJson {
    return [NSString stringWithCString:BrainCloud::OperationParam::ExtraJson.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FacebookContent {
    return [NSString stringWithCString:BrainCloud::OperationParam::FacebookContent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FcmContent {
    return [NSString stringWithCString:BrainCloud::OperationParam::FcmContent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FieldAuthenticationToken {
    return [NSString stringWithCString:BrainCloud::OperationParam::FieldAuthenticationToken.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FileId {
    return [NSString stringWithCString:BrainCloud::OperationParam::FileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FileName {
    return [NSString stringWithCString:BrainCloud::OperationParam::FileName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Filter {
    return [NSString stringWithCString:BrainCloud::OperationParam::Filter.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FolderPath {
    return [NSString stringWithCString:BrainCloud::OperationParam::FolderPath.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceAuthenticationType {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceAuthenticationType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceEntityId {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceEntityId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceEntitySubType {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceEntitySubType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceEntityType {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceEntityType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceExternalId {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceExternalId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceExternalIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceExternalIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceFriendId {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceFriendId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceFriendPlatform {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceFriendPlatform.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceIncludeSummaryData {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceIncludeSummaryData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceMaxResults {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceMaxResults.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceMode {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceMode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceProfileId {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceProfileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceProfileIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceProfileIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceReadPlayerStateFriendId {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceReadPlayerStateFriendId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendServiceSearchText {
    return [NSString stringWithCString:BrainCloud::OperationParam::FriendServiceSearchText.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FullPathFilename {
    return [NSString stringWithCString:BrainCloud::OperationParam::FullPathFilename.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GamificationServiceAchievementsData {
    return [NSString stringWithCString:BrainCloud::OperationParam::GamificationServiceAchievementsData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GamificationServiceAchievementsGranted {
    return [NSString stringWithCString:BrainCloud::OperationParam::GamificationServiceAchievementsGranted.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GamificationServiceAchievementsName {
    return [NSString stringWithCString:BrainCloud::OperationParam::GamificationServiceAchievementsName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GamificationServiceCategory {
    return [NSString stringWithCString:BrainCloud::OperationParam::GamificationServiceCategory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GamificationServiceIncludeMetaData {
    return [NSString stringWithCString:BrainCloud::OperationParam::GamificationServiceIncludeMetaData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GamificationServiceMilestonesName {
    return [NSString stringWithCString:BrainCloud::OperationParam::GamificationServiceMilestonesName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalAppCategories {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalAppCategories.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalAppPropertyNames {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalAppPropertyNames.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceAcl {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceAcl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceContext {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceContext.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceData {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceEntityId {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceEntityId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceEntityType {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceEntityType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceIndexedId {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceIndexedId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceMaxReturn {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceMaxReturn.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceOrderBy {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceOrderBy.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServicePageOffset {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServicePageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceTimeToLive {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceTimeToLive.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntityServiceWhere {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalEntityServiceWhere.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalFileV3ServiceFileId {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalFileV3ServiceFileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalFileV3ServiceFileName {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalFileV3ServiceFileName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalFileV3ServiceFolderPath {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalFileV3ServiceFolderPath.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalFileV3ServiceRecurse {
    return [NSString stringWithCString:BrainCloud::OperationParam::GlobalFileV3ServiceRecurse.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupAcl {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupAcl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupAttributes {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupAttributes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupAutoJoinStrategy {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupAutoJoinStrategy.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupContext {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupContext.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupData {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupDefaultMemberAttributes {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupDefaultMemberAttributes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupEntityId {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupEntityId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupEntityType {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupEntityType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupFileACL {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupFileACL.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupFilename {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupFilename.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupFileVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupFileVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupId {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupIsOpenGroup {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupIsOpenGroup.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupIsOwnedByGroupMember {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupIsOwnedByGroupMember.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupName {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupOwnerAttributes {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupOwnerAttributes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupPageOffset {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupPageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupProfileId {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupProfileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupRole {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupRole.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupSummaryData {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupSummaryData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupTreeId {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupTreeId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupType {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupTypes {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupTypes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupWhere {
    return [NSString stringWithCString:BrainCloud::OperationParam::GroupWhere.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IdentityServiceAuthenticationType {
    return [NSString stringWithCString:BrainCloud::OperationParam::IdentityServiceAuthenticationType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IdentityServiceBlockchainConfig {
    return [NSString stringWithCString:BrainCloud::OperationParam::IdentityServiceBlockchainConfig.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IdentityServiceConfirmAnonymous {
    return [NSString stringWithCString:BrainCloud::OperationParam::IdentityServiceConfirmAnonymous.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IdentityServiceExternalId {
    return [NSString stringWithCString:BrainCloud::OperationParam::IdentityServiceExternalId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IdentityServiceForceSingleton {
    return [NSString stringWithCString:BrainCloud::OperationParam::IdentityServiceForceSingleton.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IdentityServicePublicKey {
    return [NSString stringWithCString:BrainCloud::OperationParam::IdentityServicePublicKey.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)InitialScore {
    return [NSString stringWithCString:BrainCloud::OperationParam::InitialScore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IosContent {
    return [NSString stringWithCString:BrainCloud::OperationParam::IosContent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)IsReady {
    return [NSString stringWithCString:BrainCloud::OperationParam::IsReady.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ItemCatalogServiceContext {
    return [NSString stringWithCString:BrainCloud::OperationParam::ItemCatalogServiceContext.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ItemCatalogServiceDefId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ItemCatalogServiceDefId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ItemCatalogServicePageOffset {
    return [NSString stringWithCString:BrainCloud::OperationParam::ItemCatalogServicePageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LeaderboardId {
    return [NSString stringWithCString:BrainCloud::OperationParam::LeaderboardId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LobbyCriteria {
    return [NSString stringWithCString:BrainCloud::OperationParam::LobbyCriteria.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LobbyId {
    return [NSString stringWithCString:BrainCloud::OperationParam::LobbyId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LobbyType {
    return [NSString stringWithCString:BrainCloud::OperationParam::LobbyType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)LobbyTypes {
    return [NSString stringWithCString:BrainCloud::OperationParam::LobbyTypes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MatchMakingServiceAttributes {
    return [NSString stringWithCString:BrainCloud::OperationParam::MatchMakingServiceAttributes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MatchMakingServiceExtraParams {
    return [NSString stringWithCString:BrainCloud::OperationParam::MatchMakingServiceExtraParams.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MatchMakingServiceMinutes {
    return [NSString stringWithCString:BrainCloud::OperationParam::MatchMakingServiceMinutes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MatchMakingServiceNumMatches {
    return [NSString stringWithCString:BrainCloud::OperationParam::MatchMakingServiceNumMatches.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MatchMakingServicePlaybackStreamId {
    return [NSString stringWithCString:BrainCloud::OperationParam::MatchMakingServicePlaybackStreamId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MatchMakingServicePlayerId {
    return [NSString stringWithCString:BrainCloud::OperationParam::MatchMakingServicePlayerId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MatchMakingServicePlayerRating {
    return [NSString stringWithCString:BrainCloud::OperationParam::MatchMakingServicePlayerRating.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MatchMakingServiceRangeDelta {
    return [NSString stringWithCString:BrainCloud::OperationParam::MatchMakingServiceRangeDelta.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MaxReturn {
    return [NSString stringWithCString:BrainCloud::OperationParam::MaxReturn.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MaxSteps {
    return [NSString stringWithCString:BrainCloud::OperationParam::MaxSteps.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingContentJson {
    return [NSString stringWithCString:BrainCloud::OperationParam::MessagingContentJson.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingContext {
    return [NSString stringWithCString:BrainCloud::OperationParam::MessagingContext.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingMarkAsRead {
    return [NSString stringWithCString:BrainCloud::OperationParam::MessagingMarkAsRead.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingMsgbox {
    return [NSString stringWithCString:BrainCloud::OperationParam::MessagingMsgbox.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingMsgIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::MessagingMsgIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingPageOffset {
    return [NSString stringWithCString:BrainCloud::OperationParam::MessagingPageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingSubject {
    return [NSString stringWithCString:BrainCloud::OperationParam::MessagingSubject.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingText {
    return [NSString stringWithCString:BrainCloud::OperationParam::MessagingText.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MessagingToProfileIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::MessagingToProfileIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MinutesFromNow {
    return [NSString stringWithCString:BrainCloud::OperationParam::MinutesFromNow.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MsgId {
    return [NSString stringWithCString:BrainCloud::OperationParam::MsgId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)NewACL {
    return [NSString stringWithCString:BrainCloud::OperationParam::NewACL.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)NewEmailAddress {
    return [NSString stringWithCString:BrainCloud::OperationParam::NewEmailAddress.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)NewFilename {
    return [NSString stringWithCString:BrainCloud::OperationParam::NewFilename.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)NewTreeId {
    return [NSString stringWithCString:BrainCloud::OperationParam::NewTreeId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)NumDaysToRotate {
    return [NSString stringWithCString:BrainCloud::OperationParam::NumDaysToRotate.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)OldEmailAddress {
    return [NSString stringWithCString:BrainCloud::OperationParam::OldEmailAddress.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)OneWayMatchServicePlaybackStreamId {
    return [NSString stringWithCString:BrainCloud::OperationParam::OneWayMatchServicePlaybackStreamId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)OneWayMatchServicePlayerId {
    return [NSString stringWithCString:BrainCloud::OperationParam::OneWayMatchServicePlayerId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)OneWayMatchServiceRangeDelta {
    return [NSString stringWithCString:BrainCloud::OperationParam::OneWayMatchServiceRangeDelta.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)OtherUserCxIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::OtherUserCxIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)OverwriteIfPresent {
    return [NSString stringWithCString:BrainCloud::OperationParam::OverwriteIfPresent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)OwnerId {
    return [NSString stringWithCString:BrainCloud::OperationParam::OwnerId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Peer {
    return [NSString stringWithCString:BrainCloud::OperationParam::Peer.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PingData {
    return [NSString stringWithCString:BrainCloud::OperationParam::PingData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlaybackMaxNumberOfStreams {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlaybackMaxNumberOfStreams.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlaybackStreamServiceEventData {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlaybackStreamServiceEventData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlaybackStreamServiceIncludeSharedData {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlaybackStreamServiceIncludeSharedData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlaybackStreamServiceInitiatingPlayerId {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlaybackStreamServiceInitiatingPlayerId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlaybackStreamServiceNumDays {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlaybackStreamServiceNumDays.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlaybackStreamServicePlaybackStreamId {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlaybackStreamServicePlaybackStreamId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlaybackStreamServiceSummary {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlaybackStreamServiceSummary.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlaybackStreamServiceTargetPlayerId {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlaybackStreamServiceTargetPlayerId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceAdditionalSecs {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceAdditionalSecs.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceAttributes {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceAttributes.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceContactEmail {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceContactEmail.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceDetails {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceDetails.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceDurationSecs {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceDurationSecs.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceIncludeSummaryData {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceIncludeSummaryData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceLanguageCode {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceLanguageCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServicePictureUrl {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServicePictureUrl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceReadEntitySubtype {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceReadEntitySubtype.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceStatusName {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceStatusName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceTimeZoneOffset {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceTimeZoneOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceUpdateNameData {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceUpdateNameData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceUpdateSummaryFriendData {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceUpdateSummaryFriendData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStateServiceWipeExisting {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStateServiceWipeExisting.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStatisticEventServiceEventMultiplier {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStatisticEventServiceEventMultiplier.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStatisticEventServiceEventName {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStatisticEventServiceEventName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStatisticEventServiceEvents {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStatisticEventServiceEvents.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStatisticsExperiencePoints {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStatisticsExperiencePoints.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStatisticsServiceReadEntitySubType {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStatisticsServiceReadEntitySubType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStatisticsServiceStatNames {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStatisticsServiceStatNames.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStatisticsServiceStats {
    return [NSString stringWithCString:BrainCloud::OperationParam::PlayerStatisticsServiceStats.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PresenceActivity {
    return [NSString stringWithCString:BrainCloud::OperationParam::PresenceActivity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PresenceBidirectional {
    return [NSString stringWithCString:BrainCloud::OperationParam::PresenceBidirectional.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PresenceGroupId {
    return [NSString stringWithCString:BrainCloud::OperationParam::PresenceGroupId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PresenceIncludeOffline {
    return [NSString stringWithCString:BrainCloud::OperationParam::PresenceIncludeOffline.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PresencePlatform {
    return [NSString stringWithCString:BrainCloud::OperationParam::PresencePlatform.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PresenceProfileIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::PresenceProfileIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PresenceVisible {
    return [NSString stringWithCString:BrainCloud::OperationParam::PresenceVisible.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceGetInventoryCategory {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceGetInventoryCategory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceGetInventoryPlatform {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceGetInventoryPlatform.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceGetInventoryUserCurrency {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceGetInventoryUserCurrency.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceItemId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceItemId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceLanguage {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceLanguage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceOpCashInReceiptReceipt {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceOpCashInReceiptReceipt.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceOpCashInReceiptUrl {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceOpCashInReceiptUrl.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceOrderId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceOrderId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceProductId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceProductId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceReceipt {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceReceipt.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceToken {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceToken.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceTransId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceTransId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceVCAmount {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceVCAmount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProductServiceVCId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProductServiceVCId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfanityFlagEmail {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProfanityFlagEmail.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfanityFlagPhone {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProfanityFlagPhone.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfanityFlagUrls {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProfanityFlagUrls.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfanityLanguages {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProfanityLanguages.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfanityReplaceSymbol {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProfanityReplaceSymbol.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfanityText {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProfanityText.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfileId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProfileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ProfileIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::ProfileIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationRegisterParamContent {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationRegisterParamContent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationRegisterParamDeviceToken {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationRegisterParamDeviceToken.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationRegisterParamDeviceType {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationRegisterParamDeviceType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationRegisterParamPushId {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationRegisterParamPushId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationRegisterParamScheduleIn {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationRegisterParamScheduleIn.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationRegisterParamSendInterval {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationRegisterParamSendInterval.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationRegisterParamToPlayerId {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationRegisterParamToPlayerId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationSendParamMessage {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationSendParamMessage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationSendParamNotificationTemplateId {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationSendParamNotificationTemplateId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationSendParamSubstitution {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationSendParamSubstitution.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotificationSendParamToPlayerId {
    return [NSString stringWithCString:BrainCloud::OperationParam::PushNotificationSendParamToPlayerId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Rating {
    return [NSString stringWithCString:BrainCloud::OperationParam::Rating.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RecordInHistory {
    return [NSString stringWithCString:BrainCloud::OperationParam::RecordInHistory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Recurse {
    return [NSString stringWithCString:BrainCloud::OperationParam::Recurse.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RedemptionCodeServiceCodeType {
    return [NSString stringWithCString:BrainCloud::OperationParam::RedemptionCodeServiceCodeType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RedemptionCodeServiceCustomRedemptionInfo {
    return [NSString stringWithCString:BrainCloud::OperationParam::RedemptionCodeServiceCustomRedemptionInfo.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RedemptionCodeServiceScanCode {
    return [NSString stringWithCString:BrainCloud::OperationParam::RedemptionCodeServiceScanCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RoundStartedEpoch {
    return [NSString stringWithCString:BrainCloud::OperationParam::RoundStartedEpoch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)S3HandlingServiceCategory {
    return [NSString stringWithCString:BrainCloud::OperationParam::S3HandlingServiceCategory.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)S3HandlingServiceFileDetails {
    return [NSString stringWithCString:BrainCloud::OperationParam::S3HandlingServiceFileDetails.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)S3HandlingServiceFileId {
    return [NSString stringWithCString:BrainCloud::OperationParam::S3HandlingServiceFileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Score {
    return [NSString stringWithCString:BrainCloud::OperationParam::Score.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScriptServiceJobId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ScriptServiceJobId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScriptServiceParentLevelName {
    return [NSString stringWithCString:BrainCloud::OperationParam::ScriptServiceParentLevelName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScriptServiceRunScriptData {
    return [NSString stringWithCString:BrainCloud::OperationParam::ScriptServiceRunScriptData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScriptServiceRunScriptName {
    return [NSString stringWithCString:BrainCloud::OperationParam::ScriptServiceRunScriptName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScriptServiceStartDateUTC {
    return [NSString stringWithCString:BrainCloud::OperationParam::ScriptServiceStartDateUTC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ScriptServiceStartMinutesFromNow {
    return [NSString stringWithCString:BrainCloud::OperationParam::ScriptServiceStartMinutesFromNow.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServerTimeServiceRead {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServerTimeServiceRead.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServiceMessageData {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServiceMessageData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServiceMessageMessages {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServiceMessageMessages.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServiceMessageOperation {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServiceMessageOperation.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServiceMessagePacketId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServiceMessagePacketId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServiceMessageReasonCode {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServiceMessageReasonCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServiceMessageService {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServiceMessageService.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServiceMessageSessionId {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServiceMessageSessionId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServiceMessageStatusMessage {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServiceMessageStatusMessage.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServiceParams {
    return [NSString stringWithCString:BrainCloud::OperationParam::ServiceParams.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Settings {
    return [NSString stringWithCString:BrainCloud::OperationParam::Settings.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SignalData {
    return [NSString stringWithCString:BrainCloud::OperationParam::SignalData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceAfterCount {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceAfterCount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceBeforeCount {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceBeforeCount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceConfigJson {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceConfigJson.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceData {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceEndIndex {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceEndIndex.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceEventMultiplier {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceEventMultiplier.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceEventName {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceEventName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceFetchType {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceFetchType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceIncludeLeaderboardSize {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceIncludeLeaderboardSize.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceLeaderboardId {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceLeaderboardId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceLeaderboardIds {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceLeaderboardIds.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceLeaderboardResultCount {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceLeaderboardResultCount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceLeaderboardType {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceLeaderboardType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceMaxResults {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceMaxResults.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceReplaceName {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceReplaceName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceRetainedCount {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceRetainedCount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceRotationReset {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceRotationReset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceRotationResetTime {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceRotationResetTime.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceRotationType {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceRotationType.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceScore {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceScore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceScoreData {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceScoreData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceSortOrder {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceSortOrder.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceStartIndex {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceStartIndex.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)SocialLeaderboardServiceVersionId {
    return [NSString stringWithCString:BrainCloud::OperationParam::SocialLeaderboardServiceVersionId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)StartDateUTC {
    return [NSString stringWithCString:BrainCloud::OperationParam::StartDateUTC.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Subject {
    return [NSString stringWithCString:BrainCloud::OperationParam::Subject.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TeamCode {
    return [NSString stringWithCString:BrainCloud::OperationParam::TeamCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Text {
    return [NSString stringWithCString:BrainCloud::OperationParam::Text.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ToTeamCode {
    return [NSString stringWithCString:BrainCloud::OperationParam::ToTeamCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TournamentCode {
    return [NSString stringWithCString:BrainCloud::OperationParam::TournamentCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TreeVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::TreeVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TwitterServiceTweetPic {
    return [NSString stringWithCString:BrainCloud::OperationParam::TwitterServiceTweetPic.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TwitterServiceTweetSecret {
    return [NSString stringWithCString:BrainCloud::OperationParam::TwitterServiceTweetSecret.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TwitterServiceTweetToken {
    return [NSString stringWithCString:BrainCloud::OperationParam::TwitterServiceTweetToken.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TwitterServiceTweetTweet {
    return [NSString stringWithCString:BrainCloud::OperationParam::TwitterServiceTweetTweet.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TwitterServiceVerifyToken {
    return [NSString stringWithCString:BrainCloud::OperationParam::TwitterServiceVerifyToken.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)TwitterServiceVerifyVerifier {
    return [NSString stringWithCString:BrainCloud::OperationParam::TwitterServiceVerifyVerifier.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UpdateContactEmail {
    return [NSString stringWithCString:BrainCloud::OperationParam::UpdateContactEmail.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UploadCloudFilename {
    return [NSString stringWithCString:BrainCloud::OperationParam::UploadCloudFilename.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UploadCloudPath {
    return [NSString stringWithCString:BrainCloud::OperationParam::UploadCloudPath.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UploadFileSize {
    return [NSString stringWithCString:BrainCloud::OperationParam::UploadFileSize.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UploadLocalPath {
    return [NSString stringWithCString:BrainCloud::OperationParam::UploadLocalPath.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UploadRecurse {
    return [NSString stringWithCString:BrainCloud::OperationParam::UploadRecurse.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UploadReplaceIfExists {
    return [NSString stringWithCString:BrainCloud::OperationParam::UploadReplaceIfExists.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UploadShareable {
    return [NSString stringWithCString:BrainCloud::OperationParam::UploadShareable.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserCloudFilename {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserCloudFilename.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserCloudPath {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserCloudPath.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceContext {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceContext.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceCriteria {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceCriteria.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceDefId {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceDefId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceImmediate {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceImmediate.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceIncludeDef {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceIncludeDef.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceItemId {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceItemId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceNewItemData {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceNewItemData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServicePageOffset {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServicePageOffset.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceProfileId {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceProfileId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceQuantity {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceQuantity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceShopId {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceShopId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItemsServiceVersion {
    return [NSString stringWithCString:BrainCloud::OperationParam::UserItemsServiceVersion.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Version {
    return [NSString stringWithCString:BrainCloud::OperationParam::Version.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VersionId {
    return [NSString stringWithCString:BrainCloud::OperationParam::VersionId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VirtualCurrencyServiceAmount {
    return [NSString stringWithCString:BrainCloud::OperationParam::VirtualCurrencyServiceAmount.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VirtualCurrencyServiceLevelName {
    return [NSString stringWithCString:BrainCloud::OperationParam::VirtualCurrencyServiceLevelName.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VirtualCurrencyServicePeerCode {
    return [NSString stringWithCString:BrainCloud::OperationParam::VirtualCurrencyServicePeerCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VirtualCurrencyServiceVCId {
    return [NSString stringWithCString:BrainCloud::OperationParam::VirtualCurrencyServiceVCId.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

@end
