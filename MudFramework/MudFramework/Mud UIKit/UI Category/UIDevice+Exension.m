//
//  UIDevice+Exension.m
//  MudFramework
//
//  Created by TimTiger on 14-8-1.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import "UIDevice+Exension.h"

@implementation UIDevice (Exension)


+ (UIDeviceOrientation)currentDeviceOrientation {
    UIDeviceOrientation orientation = [UIDevice currentDevice].orientation;
    return orientation;
}

@end
