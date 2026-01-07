// Copyright 2026 bitHeads, Inc. All Rights Reserved.

//
//  AuthenticationTypeObjc.hh
//  brainCloudClientObjc
//
//  Created by Brad Hill on 2016-04-04.

//

#import <Foundation/Foundation.h>

#pragma once

@interface AuthenticationTypeObjc : NSObject

+ (AuthenticationTypeObjc *) Anonymous;
+ (AuthenticationTypeObjc *) Universal;
+ (AuthenticationTypeObjc *) Email;
+ (AuthenticationTypeObjc *) Facebook;
+ (AuthenticationTypeObjc *) GameCenter;
+ (AuthenticationTypeObjc *) Steam;
+ (AuthenticationTypeObjc *) Google;
+ (AuthenticationTypeObjc *) Twitter;
+ (AuthenticationTypeObjc *) Parse;
+ (AuthenticationTypeObjc *) Handoff;
+ (AuthenticationTypeObjc *) SettopHandoff;
+ (AuthenticationTypeObjc *) External;
+ (AuthenticationTypeObjc *) Ultra;
+ (AuthenticationTypeObjc *) Unknown;

- (NSString *)toString;
+ (AuthenticationTypeObjc *)fromString:(NSString *)authType;

- (id)initWithValue:(NSString *)value;

@property (readonly) NSString *value;

@end
