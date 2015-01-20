//
//  UIDevice+OpenUDID.m
//  MudFramework
//
//  Created by TimTiger on 14-7-22.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import "UIDevice+OpenUDID.h"
#import <Foundation/Foundation.h>
#import <AdSupport/AdSupport.h>


@implementation UIDevice (OpenUDID)

+ (NSString *)ADUDID {
    NSString *adUDID = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    return adUDID;
}

+ (NSString *)CFUUID {
    CFUUIDRef cfuuid = CFUUIDCreate(kCFAllocatorDefault);
    NSString *cfuuidString = (NSString*)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, cfuuid));
    return cfuuidString;
}

+ (NSString *)NSUDID {
    return [[NSUUID UUID] UUIDString];
}

@end

