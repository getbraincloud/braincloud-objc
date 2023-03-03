//
//  BrainCloudGroup.mm
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2016-05-11.
//  Copyright (c) 2016 bitHeads. All rights reserved.
//

#include "BrainCloudCallback.hh"
#include "braincloud/BrainCloudClient.h"
#import "BrainCloudClient.hh"
#import "BrainCloudGroup.hh"
#import "TypeHelpers.hh"

@interface BrainCloudGroup ()
{
    BrainCloud::BrainCloudClient *_client;
}
@end

@implementation BrainCloudGroup

- (instancetype) init: (BrainCloudClient*) client
{
    self = [super init];

    if(self) {
        _client = (BrainCloud::BrainCloudClient *)[client getInternalClient];
    }

    return self;
}

@end
