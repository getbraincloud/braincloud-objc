//
//  TestCampaign.m
//  BrainCloud
//
//  Created by Michael Costa on 2026-05-28.
//  Copyright © 2026 BitHeads Inc. All rights reserved.
//

#import "TestFixtureBase.h"

@interface TestCampaign : TestFixtureBase

@end

@implementation TestCampaign

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testGetMyCampaigns
{
    [[m_client campaignService] getMyCampaigns:@"{}"
                               completionBlock:successBlock
                          errorCompletionBlock:failureBlock
                                      cbObject:nil];
    [self waitForResult];
}

@end
