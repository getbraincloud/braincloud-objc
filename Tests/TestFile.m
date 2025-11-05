//
//  TestFile.m
//  brainCloudClientObjc
//
//  Copyright (c) 2015 bitHeads. All rights reserved.
//

#import "TestFixtureBase.h"
#import "StatusCodes.hh"
#import "ReasonCodes.hh"

@interface TestFile : TestFixtureBase
- (bool) simpleUpload:(NSInteger)mb
            cloudPath:(NSString *)cloudPath
        cloudFilename:(NSString *)cloudFilename
             uploadId:(NSString **)uploadId;
@end

@implementation TestFile

- (void)setUp { [super setUp]; }

- (void)tearDown { [super tearDown]; }

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
    
    [m_client registerFileUploadCallback:fileUploadCompletedBlock failedBlock:fileUploadFailedBlock];
    [self waitForResult];
    
    *uploadId = [[[TestFixtureBase getDataFromResponse:self.jsonResponse] valueForKey:@"fileDetails"] valueForKey:@"uploadId"];
    
    while ([_fileUploadProgress countCompleted] == 0 && [_fileUploadProgress countFailed] == 0)
    {
        int64_t transferred = [[m_client fileService] getUploadBytesTransferred:*uploadId];
        int64_t total = [[m_client fileService] getUploadTotalBytesToTransfer:*uploadId];
        double progress = [[m_client fileService] getUploadProgress:*uploadId];
        NSLog(@"%lld transfered %lld total %f progress\n", transferred, total, progress);
        if(progress < 0)
            break; // failsafe in case callbacks not caught
        [NSThread sleepForTimeInterval:0.3f];
        [m_client runCallBacks];
    }
    
    [m_client deregisterFileUploadCallback];
    
    return true;
}

- (void)testUploadSimpleFile
{
    NSString * uploadId = nil;
    if (![self simpleUpload:2 cloudPath:@"" cloudFilename:@"uploadsimplefile.txt" uploadId:&uploadId])
    {
        return;
    }
    
    if ([_fileUploadProgress countCompleted] != 1)
    {
        _XCTPrimitiveFail(self, @"Uploads completed not 1");
    }
    if ([_fileUploadProgress countFailed] != 0)
    {
        _XCTPrimitiveFail(self, @"Uploads failed not 0");
    }
    
    [_fileUploadProgress clearProgress];
}

- (void)testUploadSimpleFileAndCancel
{
    NSString * cloudFilename = @"uploadsimplefile.txt";
    const char * localPath = [cloudFilename UTF8String];
    createFile(localPath, 8*1024*1024);
    
    [[m_client fileService] uploadFile:@"a/b"
                         cloudFilename:cloudFilename
                             shareable:true
                       replaceIfExists:true
                             localPath:cloudFilename
                       completionBlock:successBlock
                  errorCompletionBlock:failureBlock
                              cbObject:nil];
    [self waitForResult];
    
    NSString * uploadId = [[[TestFixtureBase getDataFromResponse:self.jsonResponse] valueForKey:@"fileDetails"] valueForKey:@"uploadId"];
    
    [m_client registerFileUploadCallback:fileUploadCompletedBlock failedBlock:fileUploadFailedBlock];
    bool transferHasStarted = false;
    while(!transferHasStarted)
    {
        int64_t transferred = [[m_client fileService] getUploadBytesTransferred:uploadId];
        int64_t total = [[m_client fileService] getUploadTotalBytesToTransfer:uploadId];
        double progress = [[m_client fileService] getUploadProgress:uploadId];
        NSLog(@"%lld transfered %lld total %f progress\n", transferred, total, progress);
        
        if (transferred > 0)
        {
            transferHasStarted = true;
        }
        else
        {
            [NSThread sleepForTimeInterval:0.3f];
            [m_client runCallBacks];
        }
    }
    
    NSLog(@"Cancelling upload...");
    
    [[m_client fileService] cancelUpload:uploadId];
    while ([_fileUploadProgress countCompleted] == 0 && [_fileUploadProgress countFailed] == 0)
    {
        [NSThread sleepForTimeInterval:0.3f];
        [m_client runCallBacks];
    }

    [m_client deregisterFileUploadCallback];
    
    if ([_fileUploadProgress countCompleted] != 0)
    {
        _XCTPrimitiveFail(self, @"Uploads completed not 0");
    }
    if ([_fileUploadProgress countFailed] != 1)
    {
        _XCTPrimitiveFail(self, @"Uploads failed not 1");
    }
    
    if ([(FileUploadFailedDetails*)[_fileUploadProgress failedDetailsAtIndex: 0] status] != HTTP_CUSTOM)
    {
        _XCTPrimitiveFail(self, @"Wrong http status");
    }
    if ([(FileUploadFailedDetails*)[_fileUploadProgress failedDetailsAtIndex: 0] reasonCode] != CLIENT_UPLOAD_FILE_CANCELLED)
    {
        _XCTPrimitiveFail(self, @"Wrong reason code");
    }
    
    [_fileUploadProgress clearProgress];
}


- (void)testListUserFiles
{
    [[m_client fileService] listUserFiles:successBlock
                     errorCompletionBlock:failureBlock
                                 cbObject:nil];
    [self waitForResult];
}


- (void)testUploadMultipleFiles
{
    NSString * cloudFilename = @"uploadsimplefile.txt";
    const char * localPath = [cloudFilename UTF8String];
    createFile(localPath, 2*1024*1024);
    
    int numTransfers = 3;
    NSMutableArray * uploadIds = [[NSMutableArray alloc] init];
    for (int i = 0; i < numTransfers; ++i)
    {
        [[m_client fileService] uploadFile:@""
                             cloudFilename:[NSString stringWithFormat:@"%@_%d", cloudFilename, i]
                                 shareable:true
                           replaceIfExists:true
                                 localPath:cloudFilename
                           completionBlock:successBlock
                      errorCompletionBlock:failureBlock
                                  cbObject:nil];
        [self waitForResult];
        NSString * uploadId = [[[TestFixtureBase getDataFromResponse:self.jsonResponse] valueForKey:@"fileDetails"] valueForKey:@"uploadId"];
        if (uploadId == nil)
        {
            _XCTPrimitiveFail(self, @"Upload id not present in return JSON!");
            return;
        }
        [uploadIds addObject:uploadId];
    }
    
    [m_client registerFileUploadCallback:fileUploadCompletedBlock failedBlock:fileUploadFailedBlock];
    while ([_fileUploadProgress countCompleted] + [_fileUploadProgress countFailed] < numTransfers)
    {
        for (int i = 0; i < numTransfers; ++i)
        {
            int64_t transferred = [[m_client fileService] getUploadBytesTransferred:[uploadIds objectAtIndex:i]];
            int64_t total = [[m_client fileService] getUploadTotalBytesToTransfer:[uploadIds objectAtIndex:i]];
            double progress = [[m_client fileService] getUploadProgress:[uploadIds objectAtIndex:i]];
            if (transferred >= 0)
            {
                NSLog(@"File%d %lld transfered %lld total %f progress\n", i, transferred, total, progress);
            }
        }
        [NSThread sleepForTimeInterval:0.3f];
        [m_client runCallBacks];
    }

    [m_client deregisterFileUploadCallback];
    
    if ([_fileUploadProgress countCompleted] != numTransfers)
    {
        _XCTPrimitiveFail(self, @"Not all uploads succeeded");
    }
    if ([_fileUploadProgress countFailed] != 0)
    {
        _XCTPrimitiveFail(self, @"Uploads failed not 0");
    }
    
    [_fileUploadProgress clearProgress];
}


- (void)testDeleteFile
{
    NSString * filename = @"uploadsimplefile.txt";
    NSString * uploadId = nil;
    if (![self simpleUpload:2 cloudPath:@"" cloudFilename:filename uploadId:&uploadId])
    {
        return;
    }
    
    if ([_fileUploadProgress countCompleted] != 1)
    {
        _XCTPrimitiveFail(self, @"Uploads completed not 1");
        return;
    }
    if ([_fileUploadProgress countFailed] != 0)
    {
        _XCTPrimitiveFail(self, @"Uploads failed not 0");
        return;
    }
    
    [[m_client fileService] deleteUserFile:@""
                             cloudFilename:filename
                           completionBlock:successBlock
                      errorCompletionBlock:failureBlock
                                  cbObject:nil];
    [self waitForResult];
}

- (void)testGetCDNUrl
{
    NSString * filename = @"uploadsimplefile.txt";
    NSString * uploadId = nil;
    if (![self simpleUpload:2 cloudPath:@"" cloudFilename:filename uploadId:&uploadId])
    {
        return;
    }

    if ([_fileUploadProgress countCompleted] != 1)
    {
        _XCTPrimitiveFail(self, @"Uploads completed not 1");
        return;
    }
    if ([_fileUploadProgress countFailed] != 0)
    {
        _XCTPrimitiveFail(self, @"Uploads failed not 0");
        return;
    }

    [[m_client fileService] getCDNUrl:@""
                             cloudFileName:filename
                           completionBlock:successBlock
                      errorCompletionBlock:failureBlock
                                  cbObject:nil];
    [self waitForResult];

    [[m_client fileService] deleteUserFile:@""
                             cloudFilename:filename
                           completionBlock:successBlock
                      errorCompletionBlock:failureBlock
                                  cbObject:nil];
    [self waitForResult];
}

@end
