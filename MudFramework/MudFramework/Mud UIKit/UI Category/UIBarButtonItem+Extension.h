//
//  UIBarButtonItem+Extension.h
//  CRM
//
//  Created by TimTiger on 5/15/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+ (UIBarButtonItem *)itemWithImage:(UIImage*)image target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)itemWithTitle:(NSString*)title target:(id)target action:(SEL)action;

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state;

@end
