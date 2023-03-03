//
//  BrainCloudGroup.hh
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2016-05-11.
//  Copyright (c) 2016 bitHeads. All rights reserved.
//

#pragma once
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdocumentation"

#import "BrainCloudCompletionBlocks.hh"
#import <Foundation/Foundation.h>

@class BrainCloudClient;


@interface BrainCloudGroupFile : NSObject

/**
 * Initializes the brainCloudService
 */
- (instancetype) init: (BrainCloudClient*) client;

@end


#pragma clang diagnostic pop
