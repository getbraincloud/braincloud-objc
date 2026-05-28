//
//  BrainCloudCampaign.hh
//  BrainCloud
//
//  Created by Michael Costa on 2026-05-28.
//  Copyright © 2026 BitHeads Inc. All rights reserved.
//

//

#pragma once
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

#import <Foundation/Foundation.h>
#import "BrainCloudCompletionBlocks.hh"

@class BrainCloudClient;

@interface BrainCloudCampaign : NSObject

/**
 * Initializes the brainCloudService
 */
- (instancetype) init: (BrainCloudClient*) client;

/**
 * Returns the list of campaigns the current player is participating in,
 * providing campaign, campaign scenario, and participation details.
 *
 * Service Name - campaign
 * Service Operation - GET_MY_CAMPAIGNS
 *
 * @param optionsJson Optional parameters as a JSON string (reserved for future use).
 */
- (void)getMyCampaigns:(NSString *)optionsJson
       completionBlock:(BCCompletionBlock)cb
  errorCompletionBlock:(BCErrorCompletionBlock)ecb
              cbObject:(BCCallbackObject)cbObject;

@end

#pragma clang diagnostic pop
