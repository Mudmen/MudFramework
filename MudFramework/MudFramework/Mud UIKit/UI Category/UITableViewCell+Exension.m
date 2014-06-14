//
//  UITableViewCell+Exension.m
//  CRM
//
//  Created by TimTiger on 5/31/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "UITableViewCell+Exension.h"

@implementation UITableViewCell (Exension)

- (void)setSelectedBackgroundViewWithColor:(UIColor *)color {
    UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,self.bounds.size.width,self.bounds.size.height)];
    backgroundView.backgroundColor = color;
    self.selectedBackgroundView = backgroundView;
}

@end
