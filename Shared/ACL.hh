// Copyright 2025 bitHeads, Inc. All Rights Reserved.

//
//  ACL.h
//  brainCloudClientObjc
//
//  Created by Hill, Bradley on 2015-08-07.

//

#import <Foundation/Foundation.h>

#pragma once

typedef NS_ENUM(NSUInteger, Access) { None, ReadOnly, ReadWrite };

@interface ACL : NSObject

+ (NSString *)getAclJson:(Access)access;

+ (NSString *)getGroupAclJson:(Access)other memberAccess:(Access)member;

@end
