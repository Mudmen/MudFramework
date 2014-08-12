//
//  UIDevice+Exension.m
//  MudFramework
//
//  Created by TimTiger on 14-8-1.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import "UIDevice+Exension.h"

@implementation UIDevice (Exension)

//单位字节（Byte）
+ (NSNumber *)freeSize {
    NSString* path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] ;
    NSFileManager* fileManager = [[NSFileManager alloc ]init];
    NSDictionary *fileSysAttributes = [fileManager attributesOfFileSystemForPath:path error:nil];
    NSNumber *freeSpace = [fileSysAttributes objectForKey:NSFileSystemFreeSize];
    return freeSpace;
}
//剩余空间字符串，最小单位kB,最大单位G
+ (NSString *)stringForFreeSize {
    NSNumber *freeSpace = [UIDevice freeSize];
    NSString  * str = nil;
    if ([freeSpace longLongValue]/1024.f/1024.f/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.2fGB",[freeSpace longLongValue]/1024.f/1024.f/1024.f];
    } else if ([freeSpace longLongValue]/1024.f/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.2fMB",[freeSpace longLongValue]/1024.f/1024.f];
    } else if ([freeSpace longLongValue]/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.2fKB",[freeSpace longLongValue]/1024.f];
    } else {
        str = @"0KB";
    }
    return str;
}

+ (UIDeviceOrientation)currentDeviceOrientation {
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    return orientation;
}

@end
