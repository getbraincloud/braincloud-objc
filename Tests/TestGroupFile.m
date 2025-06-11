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
static NSString *groupFileId = @"d2dd646a-f1af-4a96-90a7-a0310246f5a2";
static NSString *groupID = @"a7ff751c-3251-407a-b2fd-2bd1e9bca64a";
static int version = -1;
static NSString *filename = @"testingGroupFile.dat";
static NSString *newFileName = @"testCopiedFile.dat";
static NSString *tempFilename = @"deleteThisFileAfter.dat";
static NSString *updatedName = @"UpdatedGroupFile.dat";
static FileUploadProgress *fileProgress;

- (bool)authenticateOnSetup { return false; }

// static class method: executed once at start of whole test suite
+ (void) setUp {

    // iniialize
    BrainCloudWrapper* wrapper = [[BrainCloudWrapper alloc] init];
    fileProgress = [[FileUploadProgress alloc] init];
    [super setUp];
    [TestFixtureBase loadIds];
    BrainCloudClient* bc = [wrapper getBCClient];
    NSDictionary* secretMap = @{
        [TestFixtureBase appId]      : [TestFixtureBase secret],
        [TestFixtureBase childAppId] : [TestFixtureBase childSecret],
    };
    [bc initializeWithApps:[TestFixtureBase serverUrl]
                    defaultAppId:[TestFixtureBase appId]
                       secretMap:secretMap
                      appVersion:[TestFixtureBase bcversion]];
    [bc enableLogging:TRUE];

    // authenticate
    __block bool callbackResult = false;
    __block NSString *callbackJson = false;
    __block NSInteger callbackStatusCode;
    __block NSInteger callbackReasonCode;
    __block NSString *callbackStatusMessage;
    
    BCCompletionBlock resultSuccess = ^(NSString *serviceName, NSString *serviceOperation, NSString *jsonData,
                     BCCallbackObject cbObject)
    {
        callbackResult = true;
        callbackJson = jsonData;
    };
    BCErrorCompletionBlock resultFail = ^(NSString *serviceName, NSString *serviceOperation, NSInteger statusCode,
                                          NSInteger returnCode, NSString *statusMessage, BCCallbackObject cbObject)

    {
        callbackResult = false;
        callbackStatusCode = statusCode;
        callbackReasonCode = returnCode;
        callbackStatusMessage = statusMessage;
    };
    
    callbackResult = false; // reset flag to watch
    [[bc authenticationService] authenticateEmailPassword:@"objc-tester@place.com"
                                                       password:@"objc-tester@place.com"
                                                    forceCreate:true
                                                completionBlock:resultSuccess
                                           errorCompletionBlock:resultFail
                                                       cbObject:nil];
    
    [TestFixtureBase waitForResponse:bc watchResult:&callbackResult];


    XCTAssertTrue(callbackResult);

    // upload file
    NSString * uploadId = nil;
    
    if (![TestGroupFile simpleUpload:bc fileSize: 5 cloudPath:@"TestFolder" cloudFilename:filename uploadId:&uploadId])
    {
        return;
    }

    XCTAssertEqual([fileProgress countCompleted], 1);
    XCTAssertEqual([fileProgress countFailed], 0);
    
    NSLog(@"Upload progress asserted to be true");

    [fileProgress clearProgress];

    // join group
    [[bc groupService] joinGroup:groupID completionBlock:resultSuccess errorCompletionBlock:resultFail cbObject:nil];

    XCTAssertTrue(callbackResult);
    callbackResult = false;
    
    // move user to group file
    NSString *testAcl = @"{ \"other\": 2, \"member\": 2 }";
    
    callbackResult = false;
    [[bc groupFileService] moveUserToGroupFile:@"TestFolder/"
                                   userCloudFilename:filename
                                             groupId:groupID
                                         groupTreeId:@""
                                       groupFilename:filename
                                        groupFileAcl:testAcl
                                  overwriteIfPresent:true
                               completionBlock:resultSuccess
                                errorCompletionBlock:resultFail
                                            cbObject:nil];
    
    [TestFixtureBase waitForResponse:bc watchResult:&callbackResult];

    XCTAssertTrue(callbackResult);
    callbackResult = false;
    
    NSData *data = [callbackJson dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *jsonObj = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    
    groupFileId = [(NSDictionary *)[(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"fileDetails"] objectForKey:@"fileId"];
    

    [bc resetCommunication];
}

// instance class method: executed once at the start of EACH test
- (void)setUp {
    
    [super setUp];
    
    [self authenticate:@"objc-tester@place.com"];
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
	[m_bcWrapper logout:true withCompletionBlock:successBlock errorCompletionBlock:failureBlock cbObject:nil];
    [self waitForResult];
}

+ (bool) simpleUpload:(BrainCloudClient*) bc
             fileSize:(NSInteger)mb
            cloudPath:(NSString *)cloudPath
        cloudFilename:(NSString *)cloudFilename
             uploadId:(NSString **)uploadId
{
    *uploadId = nil;
    
    const char * localPath = [cloudFilename UTF8String];
    createFile(localPath, mb*1024LL*1024LL);

    __block bool uploadResult = false;
    __block bool callbackResult = false;

    BCFileUploadCompletedCompletionBlock fileSuccess = ^(NSString *fileUploadId, NSString *jsonResponse)
    {
        FileUploadCompletedDetails * successDetails = [[FileUploadCompletedDetails alloc] init];
        [successDetails setFileUploadId:fileUploadId];
        [successDetails setJsonResponse:jsonResponse];
        [fileProgress updateCompleted:successDetails];
        uploadResult = true;
    };
    BCFileUploadFailedCompletionBlock fileFail= ^(NSString *fileUploadId, NSInteger status, NSInteger reasonCode, NSString *jsonResponse)
    {
        FileUploadFailedDetails * failDetails = [[FileUploadFailedDetails alloc] init];
        [failDetails setFileUploadId:fileUploadId];
        [failDetails setStatus:status];
        [failDetails setReasonCode:reasonCode];
        [failDetails setJsonResponse:jsonResponse];
        [fileProgress updateFailed:failDetails];
        uploadResult = false;
    };
    BCCompletionBlock resultSuccess = ^(NSString *serviceName, NSString *serviceOperation, NSString *jsonData,
                     BCCallbackObject cbObject)
    {
        callbackResult = true;
    };
    BCErrorCompletionBlock resultFail = ^(NSString *serviceName, NSString *serviceOperation, NSInteger statusCode,
                                          NSInteger returnCode, NSString *statusMessage, BCCallbackObject cbObject)

    {
        callbackResult = false;
    };
    [[bc fileService] uploadFile:cloudPath
                         cloudFilename:cloudFilename
                             shareable:true
                       replaceIfExists:true
                             localPath:cloudFilename
                       completionBlock:resultSuccess
                  errorCompletionBlock:resultFail
                              cbObject:nil];
    
    [bc registerFileUploadCallback:fileSuccess failedBlock:fileFail];
    
    [TestFixtureBase waitForResponse:bc watchResult:&uploadResult];
    
    if (!uploadResult)
    {
        NSLog(@"File upload failed - timed out");
        // timed out
        [fileProgress clearProgress];
        [bc deregisterFileUploadCallback];
        return false;
    }
    
    NSLog(@"File upload completed successfully");
    [bc deregisterFileUploadCallback]; // upload complete
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
                       overwriteIfPresent:true
                          completionBlock:successBlock
                     errorCompletionBlock:failureBlock
                                 cbObject:nil];
    
    [self waitForResult];
}

- (void)testMoveUserToGroupFile
{
    NSString * uploadId = nil;
    if (![TestGroupFile simpleUpload:m_client fileSize:5 cloudPath:@"TestFolder" cloudFilename:tempFilename uploadId:&uploadId])
    {
        return;
    }
    
    if ([fileProgress countCompleted] != 1)
    {
        _XCTPrimitiveFail(self, @"Uploads completed not 1");
        return;
    }
    if ([fileProgress countFailed] != 0)
    {
        _XCTPrimitiveFail(self, @"Uploads failed not 0");
        return;
    }

    [fileProgress clearProgress];

    NSString *testAcl = @"{ \"other\": 2, \"member\": 2 }";
    
    [[m_client groupFileService] moveUserToGroupFile:@"TestFolder/"
                                   userCloudFilename:tempFilename
                                             groupId:groupID
                                         groupTreeId:@""
                                       groupFilename:tempFilename
                                        groupFileAcl:testAcl
                                  overwriteIfPresent:true
                                     completionBlock:successBlock
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
    XCTAssertTrue(_result);
    
    NSDictionary *response = [(NSDictionary *)[jsonObj objectForKey:@"data"] objectForKey:@"fileDetails"];
    
    NSString *newFileId = [response objectForKey:@"fileId"];
    
    // --- comment back in to verify file exists
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
    // ---
    
    if(newFileId != nil) {
        
        // delete file
        [[m_client groupFileService] deleteFile:groupID
                                         fileId:newFileId
                                        version:version
                                    newFilename:newFileName
                                completionBlock:successBlock
                           errorCompletionBlock:failureBlock
                                       cbObject:nil];
        [self waitForResult];
        
        XCTAssertTrue(_result);
    }
    
    // --- comment back in to verify file no longer exists
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
    // ...
}

- (void)testUpdateFileInfo
{
    NSString *testAcl = @"{ \"other\": 2, \"member\": 2 }";
    
    [[m_client groupFileService] updateFileInfo:groupID
                                         fileId:groupFileId
                                        version:version
                                    newFilename:updatedName
                                         newAcl:testAcl
                                completionBlock:successBlock
                           errorCompletionBlock:failureBlock
                                       cbObject:nil];
    [self waitForResult];
    
    [[m_client groupFileService] updateFileInfo:groupID
                                         fileId:groupFileId
                                        version:version
                                    newFilename:filename
                                         newAcl:testAcl
                                completionBlock:successBlock
                           errorCompletionBlock:failureBlock
                                       cbObject:nil];
    [self waitForResult];
}

@end
