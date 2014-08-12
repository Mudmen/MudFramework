//
//  UIDevice+Exension.h
//  MudFramework
//
//  Created by TimTiger on 14-8-1.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Exension)

//单位字节（Byte）
+ (NSNumber *)freeSize;
//剩余空间字符串，最小单位KB,最大单位G
+ (NSString *)stringForFreeSize;

//当前设备方向
+ (UIDeviceOrientation)currentDeviceOrientation;

@end
