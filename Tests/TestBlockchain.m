//
//  TestBlcokchain.m
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-10.
//  Copyright (c) 2022 bitHeads. All rights reserved.
//

#import "TestFixtureBase.h"

@interface TestBlockchain : TestFixtureBase

@end

@implementation TestBlockchain

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testGetBlockchainItems
{
    [[m_client blockchainService] getBlockchainItems:@"default"
						contextJson:@""
						completionBlock:successBlock
						errorCompletionBlock:failureBlock
						cbObject:nil];
//	[self waitForFailedResult];
	[self waitForResultExpectedCount:1 expectFail:true];
}

- (void)testGetUniqs
{
	[[m_client blockchainService] getUniqs:@"default"
						contextJson:@""
						completionBlock:successBlock
						errorCompletionBlock:failureBlock
						cbObject:nil];
	[self waitForFailedResult];
}
@end
