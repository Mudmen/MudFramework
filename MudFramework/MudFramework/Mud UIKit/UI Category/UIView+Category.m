//
//  UIView+Category.m
//  MudFramework
//
//  Created by TimTiger on 6/19/14.
//  Copyright (c) 2014 Mudmen. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
}

@end
