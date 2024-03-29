//
//  TestFixtureBase.h
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-05.
//  Copyright (c) 2015 bitHeads. All rights reserved.
//

#pragma once

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "BrainCloudClient.hh"
#import "BrainCloudCompletionBlocks.hh"
#import "TestUser.h"
#import "BrainCloudWrapper.hh"

#define MAX_WAIT_SECS 120

@interface FileUploadCompletedDetails : NSObject
@property NSString *fileUploadId;
@property NSString *jsonResponse;
@end

@interface FileUploadFailedDetails : NSObject
@property NSString *fileUploadId;
@property NSInteger status;
@property NSInteger reasonCode;
@property NSString *jsonResponse;
@end

// a mechanism for multifile upload
@interface FileUploadProgress : NSObject
@property NSMutableArray *fileUploadCompletedReceived;
@property NSMutableArray *fileUploadFailedReceived;
-(void) updateCompleted:(FileUploadCompletedDetails*)details;
-(void) clearProgress;
-(void) updateFailed:(FileUploadFailedDetails*)details;
-(NSUInteger) countCompleted;
-(NSUInteger) countFailed;
-(FileUploadCompletedDetails*) completedDetailsAtIndex:(NSUInteger)index;
-(FileUploadFailedDetails*) failedDetailsAtIndex:(NSUInteger)index;
@end

@interface TestFixtureBase : XCTestCase
{
  @protected
    BrainCloudClient *m_client;
    Boolean m_initUsers;
    BrainCloudWrapper *m_bcWrapper;

    // the braincloud app connection data from ids.txt
    // accessible member variables in base class
    NSString *m_parentLevel;
    NSString *m_childAppId;
    NSString *m_childSecret;
    NSString *m_serverUrl;
    NSString *m_appId;
    NSString *m_secret;
    NSString *m_version;
    NSString *m_peerName;

    // accessible within completion blocks
    __block bool _result;
    __block NSString *_jsonResponse;
    __block NSInteger _statusCode;
    __block NSInteger _reasonCode;
    __block NSString *_statusMessage;

    __block bool _eventCallbackReceived;
    __block NSString *_eventCallbackJson;
    __block int _rewardCallbacksReceived;
    __block int _apiRewardsReceived;
    __block NSString *_rewardCallbackJson;
    __block int _apiCountExpected;
    __block int _expectFail;
    __block int _globalErrorCount;
    __block int _networkErrorCount;
    __block FileUploadProgress *_fileUploadProgress;
    
    BCCompletionBlock successBlock;
    BCErrorCompletionBlock failureBlock;
    BCEventCompletionBlock eventBlock;
    BCRewardCompletionBlock rewardBlock;
    BCErrorCompletionBlock globalErrorBlock;
    BCNetworkErrorCompletionBlock networkErrorBlock;
    BCFileUploadCompletedCompletionBlock fileUploadCompletedBlock;
    BCFileUploadFailedCompletionBlock fileUploadFailedBlock;
    BCRTTConnectSuccessCompletionBlock rttConnectSuccessBlock;
    BCRTTConnectFailureCompletionBlock rttConnectFailureBlock;
    BCRTTEventBlock rttEventBlock;
}
// member variables
//@property bool result;
@property NSString *jsonResponse;
@property NSInteger statusCode;
@property NSInteger reasonCode;
@property NSString *statusMessage;

+ (TestUser *)getUser:(NSString *)userId;
+ (NSDictionary *)getDataFromResponse:(NSString *)jsonResponse;
+ (NSString *)getJsonString:(id)object;

+ (void)loadIds;

- (void)createUsers;
- (void)createUser:(NSString *)prefix suffix:(int)suffix;
- (NSString *)authenticateUser:(NSString *)userId password:(NSString *)password;

+ (void)setUp; // static setup per test suite
- (void)setUp; // instance setup per test
- (void)tearDown;
+ (void)waitForResponse:(BrainCloudClient*)bc watchResult:(bool*)watchResult;
- (void)waitForResult;
- (void)waitForFailedResult;
- (void)waitForResultExpectedCount:(int)numApiCalls;
- (void)waitForResultExpectedCount:(int)numApiCalls
                        expectFail:(bool)expectFail;
- (void)reset;

- (bool)goToChildProfile;
- (bool)goToParentProfile;
- (bool)attachPeer:(NSString*)user;
- (bool)detachPeer;

- (bool)authenticateOnSetup;

// these methods are used for accessing the ids.txt
// braincloud connection data from STATIC methods
+(NSString *)appId;
+(NSString *)parentLevel;
+(NSString *)childAppId;
+(NSString *)childSecret;
+(NSString *)serverUrl;
+(NSString *)secret;
+(NSString *)bcversion;
+(NSString *)peerName;

long createFile(const char * in_path, int64_t in_size);

@end
