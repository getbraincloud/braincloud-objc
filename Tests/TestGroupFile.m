//
//  TestGroupFile.m
//  BrainCloud
//
//  Created by Joanne Hoar on 2023-03-03.
//  Copyright © 2023 BitHeads Inc. All rights reserved.
//

#import "TestFixtureBase.h"

@interface TestGroupFile : TestFixtureBase

@end

@implementation TestGroupFile
NSString *groupFileId = @"d2dd646a-f1af-4a96-90a7-a0310246f5a2";
NSString *groupID = @"a7ff751c-3251-407a-b2fd-2bd1e9bca64a";
int version = -1;
int _returnCount = 0;
int _failCount = 0;
NSString *filename = @"testingGroupFile.dat";
NSString *newFileName = @"testCopiedFile.dat";
NSString *tempFilename = @"deleteThisFileAfter.dat";
NSString *updatedName = @"UpdatedGroupFile.dat";

- (bool)authenticateOnSetup { return false; }

- (void)setUp {
    
    [super setUp];
    
    [self authenticate:@"cpp-tester"];
}

- (void)tearDown {
    
    [self logout];
    
    [super tearDown];
}

- (void)authenticate:(NSString *)user
{
    [[m_client authenticationService] authenticateUniversal:user
                                                   password:user
                                                forceCreate:true
                                            completionBlock:successBlock
                                       errorCompletionBlock:failureBlock
                                                   cbObject:nil];
    [self waitForResult];
}

- (void)logout
{
    [[m_client playerStateService] logout:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];
    [[m_client authenticationService] clearSavedProfile];
}


- (void)testCheckFilenameExists
{
    [[m_client groupFileService] checkFilenameExists:groupID
                                          folderPath:@""
                                            fileName:filename
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
}

- (void)testCheckFilenameNoExists
{
    [[m_client groupFileService] checkFilenameExists:groupID
                                          folderPath:@""
                                            fileName:tempFilename
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
}

- (void)testCheckFullpathFilenameExists
{
    [[m_client groupFileService] checkFullpathFilenameExists:groupID
                                            fullPathFilename:filename
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
}


@end
