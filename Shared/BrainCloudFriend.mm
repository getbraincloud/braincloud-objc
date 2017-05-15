//
//  BrainCloudFriend.m
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-10.
//  Copyright (c) 2016 bitHeads. All rights reserved.
//

#import "BrainCloudFriend.hh"
#import "FriendPlatformObjc.hh"
#import "AuthenticationTypeObjc.hh"

#include "BrainCloudCallback.hh"
#include "TypeHelpers.hh"
#include "braincloud/BrainCloudClient.h"
#include "braincloud/FriendPlatform.h"
#include "braincloud/AuthenticationType.h"

@implementation BrainCloudFriend

- (void)getProfileInfoForCredential:(NSString *)externalId
                 authenticationType:(AuthenticationTypeObjc *)authenticationType
                    completionBlock:(BCCompletionBlock)cb
               errorCompletionBlock:(BCErrorCompletionBlock)ecb
                           cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->getProfileInfoForCredential(
        [externalId UTF8String], BrainCloud::AuthenticationType::fromString([[authenticationType toString] UTF8String]), new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)getProfileInfoForExternalAuthId:(NSString *)externalId
                      externalAuthType:(NSString *)externalAuthType
                        completionBlock:(BCCompletionBlock)cb
                   errorCompletionBlock:(BCErrorCompletionBlock)ecb
                               cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->getProfileInfoForExternalAuthId(
        [externalId UTF8String], [externalAuthType UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)getExternalIdForProfileId:(NSString *)profileId
               authenticationType:(NSString *)authenticationType
                  completionBlock:(BCCompletionBlock)cb
             errorCompletionBlock:(BCErrorCompletionBlock)ecb
                         cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->getExternalIdForProfileId(
        [profileId UTF8String], [authenticationType UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)getSummaryDataForProfileId:(NSString *)profileId
                   completionBlock:(BCCompletionBlock)cb
              errorCompletionBlock:(BCErrorCompletionBlock)ecb
                          cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->getSummaryDataForProfileId(
        [profileId UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)readFriendEntity:(NSString *)entityId
                friendId:(NSString *)friendId
         completionBlock:(BCCompletionBlock)cb
    errorCompletionBlock:(BCErrorCompletionBlock)ecb
                cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->readFriendEntity(
        [entityId UTF8String], [friendId UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)readFriendsEntities:(NSString *)entityType
            completionBlock:(BCCompletionBlock)cb
       errorCompletionBlock:(BCErrorCompletionBlock)ecb
                   cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->readFriendsEntities(
        [entityType UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)readFriendPlayerState:(NSString *)friendId
              completionBlock:(BCCompletionBlock)cb
         errorCompletionBlock:(BCErrorCompletionBlock)ecb
                     cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->readFriendPlayerState(
            [friendId UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}


- (void)readFriendUserState:(NSString *)friendId
            completionBlock:(BCCompletionBlock)cb
       errorCompletionBlock:(BCErrorCompletionBlock)ecb
                   cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->readFriendPlayerState(
        [friendId UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)updateSummaryFriendData:(NSString *)jsonSummaryData
                completionBlock:(BCCompletionBlock)cb
           errorCompletionBlock:(BCErrorCompletionBlock)ecb
                       cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getPlayerStateService()->updateSummaryFriendData(
        [jsonSummaryData UTF8String], new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)findUsersByExactName:(NSString *)searchText
                  maxResults:(int)maxResults
             completionBlock:(BCCompletionBlock)cb
        errorCompletionBlock:(BCErrorCompletionBlock)ecb
                    cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->findUsersByExactName(
        [searchText UTF8String], maxResults, new BrainCloudCallback(cb, ecb, cbObject));
}
- (void)findUsersBySubstrName:(NSString *)searchText
                   maxResults:(int)maxResults
              completionBlock:(BCCompletionBlock)cb
         errorCompletionBlock:(BCErrorCompletionBlock)ecb
                     cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->findUsersBySubstrName(
        [searchText UTF8String], maxResults, new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)findPlayerByUniversalId:(NSString *)searchText
                     maxResults:(int)maxResults
                completionBlock:(BCCompletionBlock)cb
           errorCompletionBlock:(BCErrorCompletionBlock)ecb
                       cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->findPlayerByUniversalId(
            [searchText UTF8String], maxResults, new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)findUserByUniversalId:(NSString *)searchText
                   maxResults:(int)maxResults
              completionBlock:(BCCompletionBlock)cb
         errorCompletionBlock:(BCErrorCompletionBlock)ecb
                     cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->findPlayerByUniversalId(
        [searchText UTF8String], maxResults, new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)listFriends:(FriendPlatformObjc *)friendPlatform
      includeSummaryData:(bool)includeSummaryData
         completionBlock:(BCCompletionBlock)cb
    errorCompletionBlock:(BCErrorCompletionBlock)ecb
                cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->listFriends(
        BrainCloud::FriendPlatform::fromString([[friendPlatform toString] UTF8String]), includeSummaryData,
        new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)addFriends:(NSArray *)profileIds
         completionBlock:(BCCompletionBlock)cb
    errorCompletionBlock:(BCErrorCompletionBlock)ecb
                cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->addFriends(
        TypeHelpers::NSStringArrayToVector(profileIds), new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)removeFriends:(NSArray *)profileIds
      completionBlock:(BCCompletionBlock)cb
 errorCompletionBlock:(BCErrorCompletionBlock)ecb
             cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->removeFriends(
        TypeHelpers::NSStringArrayToVector(profileIds), new BrainCloudCallback(cb, ecb, cbObject));
}

- (void)getUsersOnlineStatus:(NSArray *)profileIds
             completionBlock:(BCCompletionBlock)cb
        errorCompletionBlock:(BCErrorCompletionBlock)ecb
                    cbObject:(BCCallbackObject)cbObject
{
    BrainCloud::BrainCloudClient::getInstance()->getFriendService()->getUsersOnlineStatus(
        TypeHelpers::NSStringArrayToVector(profileIds), new BrainCloudCallback(cb, ecb, cbObject));
}

@end
