//
//  MudTabPageBar.h
//  MudFramework
//
//  Created by TimTiger on 14-7-26.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MudTabPageBarItem;
@protocol MudTabPageBarDelegate;
@interface MudTabPageBar : UIView

@property (nonatomic,assign) id <MudTabPageBarDelegate> delegate;

//每个items都是一个UIbutton类型
@property (nonatomic,retain) NSArray *items;

//是否显示下标视图
@property (nonatomic) BOOL indexViewHidden;

//下标视图颜色
@property (nonatomic,retain) UIColor *indexViewColor;

@property (nonatomic,readwrite) NSInteger selectIndex;

@end


@protocol MudTabPageBarDelegate <NSObject>

- (void)didSelectItem:(MudTabPageBarItem *)item index:(NSInteger)index;

@end