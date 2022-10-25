//
//  TestBlockchain.m
//  brainCloudClientObjc
//
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
	[self waitForFailedResult];
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
