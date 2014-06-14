//
//  UIColor+Extension.h
//  CRM
//
//  Created by TimTiger on 5/11/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

//十六进制获取颜色
+ (UIColor *) colorWithHex:(unsigned int)hex;
+ (UIColor *) colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;

@end
