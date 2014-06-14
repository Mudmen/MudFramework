//
//  UITableViewHeaderFooterView+Extension.m
//  CRM
//
//  Created by TimTiger on 5/30/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "UITableViewHeaderFooterView+Extension.h"

@implementation UITableViewHeaderFooterView (Extension)

- (void)setBackgroundViewWithColor:(UIColor *)color {
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.bounds.size.width,self.bounds.size.height)];
    backgroundView.backgroundColor = color;
    self.backgroundView = backgroundView;
}

@end
