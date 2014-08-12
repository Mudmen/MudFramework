//
//  MudTabPagesView.h
//  MudFramework
//
//  Created by TimTiger on 14-7-26.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MudTabPageBar.h"
#import "MudTabPageBarItem.h"

@protocol MudTabPagesViewDelegate;
@interface MudTabPagesView : UIView

@property (nonatomic,assign) id <MudTabPagesViewDelegate> delegate;

//页面标签条
@property (nonatomic,retain) MudTabPageBar *pageBar;

//页面数组
@property (nonatomic,retain) NSArray *pageViews;

//手势滑动切换标签页
@property (nonatomic,readwrite) BOOL isSlideSwitchEnable;


@end

@protocol MudTabPagesViewDelegate <NSObject>

@optional
- (void)didSelectedIndex:(NSInteger)index;

/*!
 * @method 滑动左边界时传递手势
 * @abstract
 * @discussion
 * @param   手势
 * @result
 */
- (void)slideSwitchView:(MudTabPagesView *)view panLeftEdge:(UIPanGestureRecognizer*) panParam;

/*!
 * @method 滑动右边界时传递手势
 * @abstract
 * @discussion
 * @param   手势
 * @result
 */
- (void)slideSwitchView:(MudTabPagesView *)view panRightEdge:(UIPanGestureRecognizer*) panParam;

@end
