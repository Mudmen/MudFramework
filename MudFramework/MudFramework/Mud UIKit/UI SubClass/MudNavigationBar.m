//
//  TimNavigationBar.m
//  PhotoSharer
//
//  Created by TimTiger on 3/12/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudNavigationBar.h"
#import "UIColor+Extension.h"
#import "CommonMacro.h"

@implementation MudNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger itemNum = 0;
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            CGRect frame = view.frame;
            if (frame.origin.x < 30) {
                frame.origin.x = 0.f;
                frame.origin.y = 0.f;
            }else{
                frame.origin.x = frame.origin.x+5+IOS_7_OR_LATER*10+15*itemNum;
                frame.origin.y = 0.f;
                itemNum++;
            }
            view.frame = frame;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
