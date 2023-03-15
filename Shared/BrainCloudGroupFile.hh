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

- (void) checkFilenameExists:(NSString *)groupId
folderPath:(NSString *)folderPath
fileName:(NSString *)fileName
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) checkFullpathFilenameExists:(NSString *)groupId
fullPathFilename:(NSString *)fullPathFilename
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) copyFile:(NSString *)groupId
fileId:(NSString *)fileId
version:(int)version
newTreeId:(NSString *)newTreeId
treeVersion:(int)treeVersion
newFilename:(NSString *)newFilename
overwriteIfPresent:(bool)overwriteIfPresent
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) deleteFile:(NSString *)groupId
fileId:(NSString *)fileId
version:(int)version
newFilename:(NSString *)newFilename
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) getFileInfo:(NSString *)groupId
fileId:(NSString *)fileId
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) getCDNUrl:(NSString *)groupId
fileId:(NSString *)fileId
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) getFileInfoSimple:(NSString *)groupId
folderPath:(NSString *)folderPath
fileName:(NSString *)fileName
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) getFileList:(NSString *)groupId
folderPath:(NSString *)folderPath
recurse:(bool)recurse
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) moveFile:(NSString *)groupId
fileId:(NSString *)fileId
version:(int)version
newTreeId:(NSString *)newTreeId
treeVersion:(int)treeVersion
newFilename:(NSString *)newFilename
overwriteIfPresent:(bool)overwriteIfPresent
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) moveUserToGroupFile:(NSString *)userCloudPath
userCloudFilename:(NSString *)userCloudFilename
groupId:(NSString *)groupId
groupTreeId:(NSString *)groupTreeId
groupFilename:(NSString *)groupFilename
groupFileAcl:(NSString *)groupFileAcl
overwriteIfPresent:(bool)overwriteIfPresent
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

- (void) updateFileInfo:(NSString *)groupId
fileId:(NSString *)fileId
version:(int)version
newFilename:(NSString *)newFilename
newAcl:(NSString *)newAcl
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

@end


#pragma clang diagnostic pop
