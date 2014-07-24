//
//  UIApplication+Version.h
//  CRM
//
//  Created by TimTiger on 14-7-23.
//  Copyright (c) 2014年 TimTiger. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ApplicaionVersionHandler)(BOOL newVersion,NSURL *updateURL);

@interface UIApplication (Version)

+ (NSString *)currentVersion;
+ (void)checkNewVersionWithAppleID:(NSString *)appleid handler:(ApplicaionVersionHandler)handler;
+ (void)updateApplicationWithURL:(NSURL *)url;

@end
