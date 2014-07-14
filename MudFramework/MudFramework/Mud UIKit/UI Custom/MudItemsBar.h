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

@property(nonatomic) BOOL translucentMask;  //default is YES
@property(nonatomic,readonly) BOOL isHidden;
@property(nonatomic) CGFloat duration;  //动画时间
@property(nonatomic) CGPoint barOrigin; //工具条的起始位置
@property(nonatomic) MudItemsBarSeparatorStyle separatorStyle;       // default is UITableViewCellSeparatorStyleSingleLine
@property(nonatomic,retain)    UIColor *separatorColor;             // default is the standard separator gray
@property (nonatomic,copy)     NSArray *items;                           //items only can be MudItemBarItems
@property (nonatomic,retain)   UIColor *backgroundColor;               //default is white color

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
- (void)itemsBarWillDisAppear;

@end


@protocol MudItemsBarMaskDelegate <NSObject>
- (void)didTouches:(NSSet *)touches withEvent:(UIEvent *)event;
@end

@interface MudItemsBarMask : UIControl
@property (nonatomic,assign) id <MudItemsBarMaskDelegate> delegate;
@end
