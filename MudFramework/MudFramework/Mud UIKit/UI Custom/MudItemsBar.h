//
//  MudItemsBar.h
//  MudFramework
//
//  Created by TimTiger on 6/19/14.
//  Copyright (c) 2014 Mudmen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MudItemsBarSeparatorStyle) {
    MudItemsBarSeparatorStyleNone,
    MudItemsBarSeparatorStyleSingleLine,
};

typedef NS_ENUM(NSInteger, MudItemsBarAnimation) {
    MudItemsBarAnimationRight,
    MudItemsBarAnimationLeft,
    MudItemsBarAnimationTop,
    MudItemsBarAnimationBottom,
    MudItemsBarAnimationNone,
};


@protocol MudItemsBarDelegate;
@interface MudItemsBar : NSObject

//自己创建要显示的MudItemBarItem ,然后放到这个数组里. 跟tabbar类似
@property (nonatomic,copy) NSArray *items;

@property (nonatomic,retain) UIColor *backgroundColor;  //default is white color

@property(nonatomic) MudItemsBarSeparatorStyle separatorStyle;   // default is UITableViewCellSeparatorStyleSingleLine
@property(nonatomic,retain) UIColor               *separatorColor;   // default is the standard separator gray
@property(nonatomic) BOOL translucentMask;  //default is YES
@property(nonatomic,readonly) BOOL hidden;
@property(nonatomic) CGFloat duration;

//如果你有为你的MudItemBarItem添加响应事件，那你不需要设置代理。
//如果你没有为MudItemBarItem添加响应事件，那么你设置这个delegate, 有item按下的时候，就会有回调。
@property (nonatomic,assign) id <MudItemsBarDelegate> delegate;

//动画设置bar的消失和出现
- (void)showBar:(UIView *)view WithBarAnimation:(MudItemsBarAnimation)animation;
- (void)hiddenBar:(UIView *)view WithBarAnimation:(MudItemsBarAnimation)animation;

@end

@protocol MudItemsBarDelegate <NSObject>

//Item 点击的回调
- (void)itemsBar:(MudItemsBar *)itemsBar clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
