//
//  UIApplication+Extension.h
//  MudFramework
//
//  Created by TimTiger on 14-8-5.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (Extension)

+ (UIInterfaceOrientation)currentStatusBarOrientation;

@end


typedef void(^ApplicaionVersionHandler)(BOOL newVersion,NSURL *updateURL);
@interface UIApplication (Version)

+ (NSString *)currentVersion;
+ (void)checkNewVersionWithAppleID:(NSString *)appleid handler:(ApplicaionVersionHandler)handler;
+ (void)updateApplicationWithURL:(NSURL *)url;

@end
