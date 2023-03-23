//
//  BrainCloudGroupFile.hh
//  brainCloudClientObjc
//
//  Created by Joanne Hoar on 2023-03-03.
//  Copyright © 2023 BitHeads Inc. All rights reserved.
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

/**
 * checkFilenameExists
 *
 * Service Name GroupFile
 * Service Operation CheckFilenameExists
 *
 * @param groupId ID of the group.
 * @param folderPath The path of the file
 * @param filename The filename of the file
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
- (void) checkFilenameExists:(NSString *)groupId
folderPath:(NSString *)folderPath
fileName:(NSString *)fileName
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

/**
 * checkFullpathFilenameExists
 *
 * Service Name GroupFile
 * Service Operation CheckFullpathFilenameExists
 *
 * @param groupId ID of the group.
 * @param fullPathFilename The full path of the file
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
- (void) checkFullpathFilenameExists:(NSString *)groupId
fullPathFilename:(NSString *)fullPathFilename
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

/**
 * copyFile
 *
 * Service Name GroupFile
 * Service Operation CopyFile
 *
 * @param groupId the groupId
 * @param fileId the fileId
 * @param version the version
 * @param newTreeId thenewTreeId
 * @param treeVersion the treeVersion
 * @param newFilename the newFilename
 * @param overwriteIfPresent true to overwriteIfPresent
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
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

/**
 * deleteFile
 *
 * Service Name GroupFile
 * Service Operation DeleteFile
 *
 * @param groupId the groupId
 * @param fileId the fileId
 * @param version the version
 * @param newFilename the newFilename
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
- (void) deleteFile:(NSString *)groupId
fileId:(NSString *)fileId
version:(int)version
newFilename:(NSString *)newFilename
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

/**
 * getFileInfo
 *
 * Service Name GroupFile
 * Service Operation GetFileInfo
 *
 * @param groupId the groupId
 * @param fileId the fileId
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
- (void) getFileInfo:(NSString *)groupId
fileId:(NSString *)fileId
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

/**
 * getCDNUrl
 *
 * Service Name GroupFile
 * Service Operation GetCdnUrl
 *
 * @param groupId the groupId
 * @param fileId the fileId
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
- (void) getCDNUrl:(NSString *)groupId
fileId:(NSString *)fileId
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

/**
 * getFileInfoSimple
 *
 * Service Name GroupFile
 * Service Operation GetFileInfoSimple
 *
 * @param groupId the groupId
 * @param folderPath the folderPath
 * @param fileName the fileName
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
- (void) getFileInfoSimple:(NSString *)groupId
folderPath:(NSString *)folderPath
fileName:(NSString *)fileName
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

/**
 * getFileList
 *
 * Service Name GroupFile
 * Service Operation GetFileList
 *
 * @param groupId the groupId
 * @param folderPath the folderPath
 * @param recurse true to recurse
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
- (void) getFileList:(NSString *)groupId
folderPath:(NSString *)folderPath
recurse:(bool)recurse
completionBlock:(BCCompletionBlock)cb
errorCompletionBlock:(BCErrorCompletionBlock)ecb
cbObject:(BCCallbackObject)cbObject;

/**
 * moveFile
 *
 * Service Name GroupFile
 * Service Operation MoveFile
 *
 * @param groupId the groupId
 * @param fileId the fileId
 * @param version the version
 * @param newTreeId the newTreeId
 * @param newFilename the newFilename
 * @param overwriteIfPresent true to overwriteIfPresent
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
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

/**
 * moveUserToGroupFile
 *
 * Service Name GroupFile
 * Service Operation MoveUserToGroupFile
 *
 * @param userCloudPath the userCloudPath
 * @param userCloudFilename the userCloudFilename
 * @param groupId the groupId
 * @param groupTreeId the groupTreeId
 * @param groupFilename the groupFilename
 * @param groupFileAcl the groupFileAcl
 * @param overwriteIfPresent the overwriteIfPresent
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
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

/**
 * updateFileInfo
 *
 * Service Name GroupFile
 * Service Operation UpdateFileInfo
 *
 * @param groupId the groupId
 * @param fileId the fileId
 * @param version the version
 * @param newFilename the newFilename
 * @param newAcl the newAcl
 * @param completionBlock Block to call on return of successful server response
 * @param errorCompletionBlock Block to call on return of unsuccessful server
 * response
 * @param cbObject User object sent to the completion blocks
 */
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
