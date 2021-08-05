//
//  TestGlobalFile.mm
//  brainCloudClientObjc
//
//  Created by David St-Louis on 2020-04-24.
//  Copyright (c) 2020 bitHeads. All rights reserved.
//

#import "TestFixtureBase.h"

static NSString *testfileName = @"png1.png";
static NSString *testFileId = @"34802251-0da0-419e-91b5-59d91790af15";
static NSString *testFolderPath = @"/existingfolder/";

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
