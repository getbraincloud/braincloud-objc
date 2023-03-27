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
    [[m_client authenticationService] authenticateEmailPassword:user
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

- (bool) simpleUpload:(NSInteger)mb
            cloudPath:(NSString *)cloudPath
        cloudFilename:(NSString *)cloudFilename
             uploadId:(NSString **)uploadId
{
    *uploadId = nil;
    
    const char * localPath = [cloudFilename UTF8String];
    createFile(localPath, mb*1024LL*1024LL);
    
    [[m_client fileService] uploadFile:cloudPath
                         cloudFilename:cloudFilename
                             shareable:true
                       replaceIfExists:true
                             localPath:cloudFilename
                       completionBlock:successBlock
                  errorCompletionBlock:failureBlock
                              cbObject:nil];
    
    [self waitForResult];
    
    *uploadId = [[[TestFixtureBase getDataFromResponse:self.jsonResponse] valueForKey:@"fileDetails"] valueForKey:@"uploadId"];
    
    [m_client registerFileUploadCallback:fileUploadCompletedBlock failedBlock:fileUploadFailedBlock];
    while ([_fileUploadCompletedReceived count] == 0 && [_fileUploadFailedReceived count] == 0)
    {
        int64_t transferred = [[m_client fileService] getUploadBytesTransferred:*uploadId];
        int64_t total = [[m_client fileService] getUploadTotalBytesToTransfer:*uploadId];
        double progress = [[m_client fileService] getUploadProgress:*uploadId];
        NSLog(@"%lld transfered %lld total %f progress\n", transferred, total, progress);
        
        [NSThread sleepForTimeInterval:0.3f];
        [m_client runCallBacks];
    }
    [m_client deregisterFileUploadCallback];
    
    return true;
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
    
    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:nil];
    
    NSString *exists = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"exists"];
    if([exists isEqual:@"false"]){
        _XCTPrimitiveFail(self, @"File not found");
    }
}

- (void)testCheckFilenameNoExists
{
    [[m_client groupFileService] checkFilenameExists:groupID
                                          folderPath:@""
                                            fileName:@"nosuchfile.dat"
                                     completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
    
    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:nil];
    NSString *exists = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"exists"];
    if([exists isEqual:@"true"]){
        _XCTPrimitiveFail(self, @"File not expected");
    }
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

- (void)testGetFileInfo
{
    [[m_client groupFileService] getFileInfo:groupID
                                      fileId:groupFileId
                             completionBlock:successBlock
                        errorCompletionBlock:failureBlock
                                    cbObject:nil];
    
    [self waitForResult];
    
    [[m_client groupFileService] getCDNUrl:groupID
                                    fileId:groupFileId
                           completionBlock:successBlock
                      errorCompletionBlock:failureBlock
                                  cbObject:nil];
    
    [self waitForResult];
}

- (void)testGetFileInfoSimple
{
    [[m_client groupFileService] getFileInfoSimple:groupID
                                        folderPath:@""
                                          fileName:filename                                     completionBlock:successBlock
                              errorCompletionBlock:failureBlock
                                          cbObject:nil];
    
    [self waitForResult];
}

- (void)testGetFileList
{
    bool recurse = true;
    [[m_client groupFileService] getFileList:groupID
                                  folderPath:@""
                                     recurse:recurse                                     completionBlock:successBlock
                        errorCompletionBlock:failureBlock
                                    cbObject:nil];
    
    [self waitForResult];
}

- (void)testMoveFile
{
    [[m_client groupFileService] moveFile:groupID
                                   fileId:groupFileId
                                  version:version
                                newTreeId:@""
                              treeVersion:0
                              newFilename:newFileName
                       overwriteIfPresent:true                                 completionBlock:successBlock
                     errorCompletionBlock:failureBlock
                                 cbObject:nil];
    
    [self waitForResult];
    
    // reverting back
    [[m_client groupFileService] moveFile:groupID
                                   fileId:groupFileId
                                  version:version
                                newTreeId:@""
                              treeVersion:0
                              newFilename:filename
                       overwriteIfPresent:true                                 completionBlock:successBlock
                     errorCompletionBlock:failureBlock
                                 cbObject:nil];
    
    [self waitForResult];
}

- (void)testMoveUserToGroupFile
{
    NSString * uploadId = nil;
    if (![self simpleUpload:5 cloudPath:@"TestFolder" cloudFilename:tempFilename uploadId:&uploadId])
    {
        return;
    }
    
    if ([_fileUploadCompletedReceived count] != 1)
    {
        _XCTPrimitiveFail(self, @"Uploads completed not 1");
        return;
    }
    if ([_fileUploadFailedReceived count] != 0)
    {
        _XCTPrimitiveFail(self, @"Uploads failed not 0");
        return;
    }
    
    NSString *testAcl = @"{ \"other\": 2, \"member\": 2 }";
    
    [[m_client groupFileService] moveUserToGroupFile:@"TestFolder/"
                                   userCloudFilename:tempFilename
                                             groupId:groupID
                                         groupTreeId:@""
                                       groupFilename:tempFilename
                                        groupFileAcl:testAcl
                                  overwriteIfPresent:true                                  completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    
    [self waitForResult];
    
    
    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    
    NSString *newFileId = [(NSDictionary *)[(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"fileDetails"] objectForKey:@"fileId"];
    
    [[m_client groupFileService] deleteFile:groupID
                                     fileId:newFileId
                                    version:version
                                newFilename:tempFilename
                            completionBlock:successBlock
                       errorCompletionBlock:failureBlock
                                   cbObject:nil];
    [self waitForResult];
}


- (void)testCopyDeleteFile
{
    // copy file
    [[m_client groupFileService] copyFile:groupID
                                   fileId:groupFileId
                                  version:version
                                newTreeId:@""
                              treeVersion:0
                              newFilename:newFileName
                       overwriteIfPresent:true
                          completionBlock:successBlock
                                errorCompletionBlock:failureBlock
                                            cbObject:nil];
    [self waitForResult];
    NSData *data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:nil];
    
    //NSString *newFileId = [(NSDictionary *)[(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"fileDetails"] objectForKey:@"fileId"];
    
    NSDictionary *response = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"fileDetails"];
    
    NSString *newFileId = [response objectForKey:@"fileId"];
    
    
//    [[m_client groupFileService] checkFilenameExists:groupID
//                                          folderPath:@""
//                                            fileName:newFileName
//                                     completionBlock:successBlock
//                                errorCompletionBlock:failureBlock
//                                            cbObject:nil];
//    [self waitForResult];
//
//    data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
//    jsonObj = [NSJSONSerialization JSONObjectWithData:data
//                                              options:NSJSONReadingMutableContainers
//                                                error:nil];
//
//    bool exists = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"exists"];
//    if(!exists){
//        _XCTPrimitiveFail(self, @"File not copied");
//    }
    
    // delete file
    [[m_client groupFileService] deleteFile:groupID
                                     fileId:newFileId
                                    version:version
                                newFilename:newFileName
                            completionBlock:successBlock
                       errorCompletionBlock:failureBlock
                                   cbObject:nil];
    [self waitForResult];
    
//    [[m_client groupFileService] checkFilenameExists:groupID
//                                          folderPath:@""
//                                            fileName:newFileName
//                                     completionBlock:successBlock
//                                errorCompletionBlock:failureBlock
//                                            cbObject:nil];
//    [self waitForResult];
//    
//    data = [self.jsonResponse dataUsingEncoding:NSUTF8StringEncoding];
//    jsonObj = [NSJSONSerialization JSONObjectWithData:data
//                                              options:NSJSONReadingMutableContainers
//                                                error:nil];
//    
//    exists = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"exists"];
//    if(exists){
//        _XCTPrimitiveFail(self, @"File not deleted");
//    }
}

- (void)testUpdateFileInfo
{
    NSString *testAcl = @"{ \"other\": 2, \"member\": 2 }";
    
    [[m_client groupFileService] updateFileInfo:groupID
                                         fileId:groupFileId
                                        version:version
                                    newFilename:updatedName
                                         newAcl:testAcl                                     completionBlock:successBlock
                           errorCompletionBlock:failureBlock
                                       cbObject:nil];
    [self waitForResult];
    
    [[m_client groupFileService] updateFileInfo:groupID
                                         fileId:groupFileId
                                        version:version
                                    newFilename:filename
                                         newAcl:testAcl                                     completionBlock:successBlock
                           errorCompletionBlock:failureBlock
                                       cbObject:nil];
    [self waitForResult];
}

@end
