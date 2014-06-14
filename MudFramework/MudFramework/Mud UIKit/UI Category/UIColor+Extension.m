//
//  UIColor+Extension.m
//  CRM
//
//  Created by TimTiger on 5/11/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *) colorWithHex:(unsigned int)hex
{
	return [UIColor colorWithHex:hex alpha:1];
}

+ (UIColor *) colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha
{
	return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hex & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hex & 0xFF)) / 255.0
                           alpha:alpha];
}

@end
