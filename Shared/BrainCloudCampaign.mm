//
//  BrainCloudCampaign.mm
//  BrainCloud
//
//  Created by Michael Costa on 2026-05-28.
//  Copyright © 2026 BitHeads Inc. All rights reserved.
//

#include "braincloud/BrainCloudClient.h"
#include "BrainCloudCallback.hh"

#import "BrainCloudCampaign.hh"
#import "BrainCloudClient.hh"


@interface BrainCloudCampaign()
{
    BrainCloud::BrainCloudClient *_client;
}
@end

@implementation BrainCloudCampaign

- (instancetype) init: (BrainCloudClient*) client
{
    self = [super init];
    
    if(self) {
        _client = (BrainCloud::BrainCloudClient *)[client getInternalClient];
    }
    
    return self;
}

- (void)getMyCampaigns:(NSString *)optionsJson
         completionBlock:(BCCompletionBlock)cb
    errorCompletionBlock:(BCErrorCompletionBlock)ecb
                cbObject:(BCCallbackObject)cbObject
{
    BrainCloudCallback *braincloudCallback = new BrainCloudCallback(cb, ecb, cbObject);
    
    std::string cppOptionsJson;
    if(optionsJson != nil)
    {
        cppOptionsJson = [optionsJson cStringUsingEncoding:NSUTF8StringEncoding];
    }
    
    _client->getCampaignService()->getMyCampaigns(cppOptionsJson, braincloudCallback);
}

@end
