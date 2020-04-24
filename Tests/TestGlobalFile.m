//
//  TestGlobalFile.mm
//  brainCloudClientObjc
//
//  Created by David St-Louis on 2020-04-24.
//  Copyright (c) 2020 bitHeads. All rights reserved.
//

#import "TestFixtureBase.h"

static NSString *testfileName = @"testGlobalFile.png";
static NSString *testFileId = @"ed2d2924-4650-4a88-b095-94b75ce9aa18";
static NSString *testFolderPath = @"/fname/";

@interface TestGlobalFile : TestFixtureBase

@end

@implementation TestGlobalFile

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

- (void)testGetFileInfo
{
    [[m_client globalFileService] getFileInfo:testFileId
                              completionBlock:successBlock
                         errorCompletionBlock:failureBlock
                                     cbObject:nil];
    [self waitForResult];
}

- (void)testGetFileInfoSimple
{
    [[m_client globalFileService] getFileInfoSimple:testFolderPath
                                           filename:testfileName
                                    completionBlock:successBlock
                               errorCompletionBlock:failureBlock
                                           cbObject:nil];
    [self waitForResult];
}

- (void)testGetGlobalCDNUrl
{
    [[m_client globalFileService] getGlobalCDNUrl:testFileId
                                  completionBlock:successBlock
                             errorCompletionBlock:failureBlock
                                         cbObject:nil];
    [self waitForResult];
}

- (void)testGetGlobalFileList
{
    [[m_client globalFileService] getGlobalFileList:testFolderPath
                                            recurse:true
                                    completionBlock:successBlock
                               errorCompletionBlock:failureBlock
                                           cbObject:nil];
    [self waitForResult];
}

@end
