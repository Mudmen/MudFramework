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

@interface MudNavigationBar ()
@end

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
   
//    1.方案一
//    for (UIView *view in self.subviews) {
//        if ([view isKindOfClass:[UIButton class]])
//        {
//            CGRect frame = view.frame;
//            if (frame.origin.x < 30) {
//                frame.origin.x = 5.f;
//                frame.origin.y = 0.f;
//            } else if (frame.origin.x > frame.size.width+5){
//                frame.origin.x = frame.origin.x-5;
//                frame.origin.y = 0.f;
//            }
//            view.frame = frame;
//        }
//    }
    //2.方案二
    if (IOS_7_BELOW) {
        return;
    }
    
    NSInteger rightBarButtonItemsCount = self.topItem.rightBarButtonItems.count;
    if (rightBarButtonItemsCount > 0) {
        NSMutableArray *rightItems = [NSMutableArray arrayWithArray:self.topItem.rightBarButtonItems];
        UIBarButtonItem *item = [rightItems objectAtIndex:0];
        if (item.tag != 299) {
            UIBarButtonItem *rightSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            rightSpacer.width = -10;
            rightSpacer.tag = 299;
            [rightItems insertObject:rightSpacer atIndex:0];
            self.topItem.rightBarButtonItems = rightItems;
        }
    }
    NSInteger leftBarButtonItemsCount = self.topItem.leftBarButtonItems.count;
    if (leftBarButtonItemsCount > 0) {
        NSMutableArray *leftItems = [NSMutableArray arrayWithArray:self.topItem.leftBarButtonItems];
        UIBarButtonItem *rightItem = [leftItems objectAtIndex:0];
        if (rightItem.tag != 300) {
            UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
            leftSpacer.width = -10;
            leftSpacer.tag = 300;
            [leftItems insertObject:leftSpacer atIndex:0];
            self.topItem.leftBarButtonItems = leftItems;
        }
    }
}

@end
