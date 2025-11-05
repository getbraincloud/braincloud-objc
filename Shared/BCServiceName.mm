#import "BCServiceName.hh"
#import "braincloud/ServiceName.h"

@implementation BCServiceName

+ (NSString *)AppStore {
    return [NSString stringWithCString:BrainCloud::ServiceName::AppStore.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AsyncMatch {
    return [NSString stringWithCString:BrainCloud::ServiceName::AsyncMatch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Authenticate {
    return [NSString stringWithCString:BrainCloud::ServiceName::Authenticate.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)AuthenticateV2 {
    return [NSString stringWithCString:BrainCloud::ServiceName::AuthenticateV2.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Blockchain {
    return [NSString stringWithCString:BrainCloud::ServiceName::Blockchain.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Chat {
    return [NSString stringWithCString:BrainCloud::ServiceName::Chat.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Currency {
    return [NSString stringWithCString:BrainCloud::ServiceName::Currency.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)CustomEntity {
    return [NSString stringWithCString:BrainCloud::ServiceName::CustomEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)DataStream {
    return [NSString stringWithCString:BrainCloud::ServiceName::DataStream.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Entity {
    return [NSString stringWithCString:BrainCloud::ServiceName::Entity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Event {
    return [NSString stringWithCString:BrainCloud::ServiceName::Event.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)File {
    return [NSString stringWithCString:BrainCloud::ServiceName::File.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Friend {
    return [NSString stringWithCString:BrainCloud::ServiceName::Friend.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)FriendData {
    return [NSString stringWithCString:BrainCloud::ServiceName::FriendData.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Gamification {
    return [NSString stringWithCString:BrainCloud::ServiceName::Gamification.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalApp {
    return [NSString stringWithCString:BrainCloud::ServiceName::GlobalApp.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalEntity {
    return [NSString stringWithCString:BrainCloud::ServiceName::GlobalEntity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalFileV3 {
    return [NSString stringWithCString:BrainCloud::ServiceName::GlobalFileV3.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalGameStatistics {
    return [NSString stringWithCString:BrainCloud::ServiceName::GlobalGameStatistics.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GlobalStatistics {
    return [NSString stringWithCString:BrainCloud::ServiceName::GlobalStatistics.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Group {
    return [NSString stringWithCString:BrainCloud::ServiceName::Group.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)GroupFile {
    return [NSString stringWithCString:BrainCloud::ServiceName::GroupFile.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)HeartBeat {
    return [NSString stringWithCString:BrainCloud::ServiceName::HeartBeat.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Identity {
    return [NSString stringWithCString:BrainCloud::ServiceName::Identity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ItemCatalog {
    return [NSString stringWithCString:BrainCloud::ServiceName::ItemCatalog.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Leaderboard {
    return [NSString stringWithCString:BrainCloud::ServiceName::Leaderboard.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Lobby {
    return [NSString stringWithCString:BrainCloud::ServiceName::Lobby.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Mail {
    return [NSString stringWithCString:BrainCloud::ServiceName::Mail.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)MatchMaking {
    return [NSString stringWithCString:BrainCloud::ServiceName::MatchMaking.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Messaging {
    return [NSString stringWithCString:BrainCloud::ServiceName::Messaging.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)None {
    return [NSString stringWithCString:BrainCloud::ServiceName::None.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)OneWayMatch {
    return [NSString stringWithCString:BrainCloud::ServiceName::OneWayMatch.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlaybackStream {
    return [NSString stringWithCString:BrainCloud::ServiceName::PlaybackStream.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerState {
    return [NSString stringWithCString:BrainCloud::ServiceName::PlayerState.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStatistics {
    return [NSString stringWithCString:BrainCloud::ServiceName::PlayerStatistics.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PlayerStatisticsEvent {
    return [NSString stringWithCString:BrainCloud::ServiceName::PlayerStatisticsEvent.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Presence {
    return [NSString stringWithCString:BrainCloud::ServiceName::Presence.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Product {
    return [NSString stringWithCString:BrainCloud::ServiceName::Product.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Profanity {
    return [NSString stringWithCString:BrainCloud::ServiceName::Profanity.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)PushNotification {
    return [NSString stringWithCString:BrainCloud::ServiceName::PushNotification.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RedemptionCode {
    return [NSString stringWithCString:BrainCloud::ServiceName::RedemptionCode.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)RTTRegistration {
    return [NSString stringWithCString:BrainCloud::ServiceName::RTTRegistration.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)S3Handling {
    return [NSString stringWithCString:BrainCloud::ServiceName::S3Handling.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Script {
    return [NSString stringWithCString:BrainCloud::ServiceName::Script.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)ServerTime {
    return [NSString stringWithCString:BrainCloud::ServiceName::ServerTime.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Time {
    return [NSString stringWithCString:BrainCloud::ServiceName::Time.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Tournament {
    return [NSString stringWithCString:BrainCloud::ServiceName::Tournament.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)Twitter {
    return [NSString stringWithCString:BrainCloud::ServiceName::Twitter.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)UserItems {
    return [NSString stringWithCString:BrainCloud::ServiceName::UserItems.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

+ (NSString *)VirtualCurrency {
    return [NSString stringWithCString:BrainCloud::ServiceName::VirtualCurrency.getValue().c_str()
                              encoding:NSASCIIStringEncoding];
}

@end
