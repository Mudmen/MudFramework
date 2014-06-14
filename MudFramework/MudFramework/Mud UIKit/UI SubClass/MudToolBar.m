//
//  TimToolBar.m
//  CRM
//
//  Created by TimTiger on 5/18/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudToolBar.h"
#import "CommonMacro.h"

@implementation MudToolBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        if (IOS_7_OR_LATER) {
            [self setBarTintColor:[UIColor whiteColor]];
        }
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation

@end
