// Copyright 2026 bitHeads, Inc. All Rights Reserved.

//
//  Platform.hh
//  brainCloudClientObjc
//
//  Created by Preston Jennings on 2015-09-10.

//

#import <Foundation/Foundation.h>

#pragma once

@interface PlatformObjc : NSObject

+ (PlatformObjc *)Unknown;
+ (PlatformObjc *)Amazon;
+ (PlatformObjc *)AppleTVOS;
+ (PlatformObjc *)BlackBerry;
+ (PlatformObjc *)Facebook;
+ (PlatformObjc *)GooglePlayAndroid;
+ (PlatformObjc *)iOS;
+ (PlatformObjc *)Linux;
+ (PlatformObjc *)Mac;
+ (PlatformObjc *)Nintendo;
+ (PlatformObjc *)Oculus;
+ (PlatformObjc *)PS3;
+ (PlatformObjc *)PS4;
+ (PlatformObjc *)PSVita;
+ (PlatformObjc *)Roku;
+ (PlatformObjc *)Tizen;
+ (PlatformObjc *)VisionOS;
+ (PlatformObjc *)WatchOS;
+ (PlatformObjc *)Web;
+ (PlatformObjc *)Wii;
+ (PlatformObjc *)Windows;
+ (PlatformObjc *)WindowsPhone;
+ (PlatformObjc *)Xbox360;
+ (PlatformObjc *)XboxOne;

- (NSString *)toString;
+ (PlatformObjc *)fromString:(NSString *)platform;

- (id)initWithValue:(NSString *)value;

@property(readonly) NSString *value;

@end
