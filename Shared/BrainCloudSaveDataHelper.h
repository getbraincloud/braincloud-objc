// Copyright 2026 bitHeads, Inc. All Rights Reserved.

//
//  BrainCloudSaveDataHelper.h
//  BrainCloud
//
//  Created by Benoit Sarrazin on 2016-02-29.

//

#import <Foundation/Foundation.h>

@interface BrainCloudSaveDataHelper : NSObject

- (instancetype)initWithCompanyName:(NSString *)companyName appName:(NSString *)appName;

- (void)saveString:(NSString *)string forKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key;

@end
