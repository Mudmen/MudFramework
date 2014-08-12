//
//  MudTabPageItem.h
//  MudFramework
//
//  Created by TimTiger on 14-7-26.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MudTabPageBarItem : UIButton

@property (nonatomic,readwrite) BOOL indexViewHidden;
@property (nonatomic,readwrite) CGFloat indexViewHeight;
@property (nonatomic,retain) UIColor *indexViewColor;

@end
