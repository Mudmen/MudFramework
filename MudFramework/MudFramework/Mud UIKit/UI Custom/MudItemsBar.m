//
//  MudItemsBar.m
//  MudFramework
//
//  Created by TimTiger on 6/19/14.
//  Copyright (c) 2014 Mudmen. All rights reserved.
//

#import "MudItemsBar.h"
#import "UIView+Category.h"
#import "MudItemBarItem.h"

@interface MudItemsBar () <MudItemsBarMaskDelegate>
{
    MudItemsBarMask *mask;
    UIView *barView;
}

@property (nonatomic) MudItemsBarAnimation barAnimation;

@end

@implementation MudItemsBar

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        barView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        self.separatorStyle = MudItemsBarSeparatorStyleSingleLine;
        self.separatorColor = [UIColor grayColor];
        self.translucentMask = YES;
        barView.backgroundColor = [UIColor whiteColor];
        self.duration = 0.2f;
        _isHidden = YES;
    }
    return self;
}

- (void)setupViewsInView:(UIView *)parentView {
    if (self.items != nil && self.items.count > 0) {
        barView.frame = CGRectMake(0, -65, parentView.bounds.size.width, 64);
        barView.backgroundColor = self.backgroundColor;
        CGFloat width = parentView.bounds.size.width/self.items.count;
        if (self.translucentMask == YES) {
            mask = [[MudItemsBarMask alloc]initWithFrame:CGRectMake(self.barOrigin.x,self.barOrigin.y, parentView.bounds.size.width, 1000)];
            mask.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
            mask.delegate = self;
            mask.clipsToBounds = YES;
            [mask becomeFirstResponder];
        }
        for (NSInteger i = 0; i < self.items.count; i++) {
            MudItemBarItem *item = [self.items objectAtIndex:i];
            item.frame = CGRectMake(width*i,0,width,64);
            if ((item.allControlEvents & UIControlEventTouchUpInside) != 1) {
                item.tag = 208+i;
                [item addTarget:self action:@selector(onItemAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            [item setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [barView addSubview:item];
        }
        if (self.separatorStyle != MudItemsBarSeparatorStyleNone) {
            for (NSInteger i = 1; i < self.items.count; i++) {
                UIControl *line = [[UIControl alloc]initWithFrame:CGRectMake(width*i, 0, 0.5, barView.bounds.size.height)];
                line.backgroundColor = self.separatorColor;
                [barView addSubview:line];
            }
        }
    }
}

- (void)dealloc {
    NSLog(@"MudItemsBar Dealloced");
}

#pragma mark - Animation
//动画设置bar的消失和出现

- (void)showBar:(UIView *)view WithBarAnimation:(MudItemsBarAnimation)animation {
    
    //不处于消失状态就不执行显示操作。
    if (_isHidden != YES) {
        return;
    }
    
    [self setupViewsInView:view];
    CGRect resultRect;
    self.barAnimation = animation;
    switch (animation) {
        case MudItemsBarAnimationTop:
        {
            barView.frame = CGRectMake(0,-65, view.bounds.size.width, 64);
            resultRect = CGRectMake(0, 0, view.bounds.size.width, 64);
        }
            break;
        case MudItemsBarAnimationLeft:
        {
            barView.frame = CGRectMake(-view.bounds.size.width,0, view.bounds.size.width, 64);
            resultRect = CGRectMake(0, 0, view.bounds.size.width, 64);
        }
            break;
        case MudItemsBarAnimationRight:
        {
            barView.frame = CGRectMake(view.bounds.size.width,0, view.bounds.size.width, 64);
            resultRect = CGRectMake(0, 0, view.bounds.size.width, 64);
        }
            break;
        case MudItemsBarAnimationBottom:
        {
            barView.frame = CGRectMake(0,view.bounds.size.height, view.bounds.size.width, 64);
            resultRect = CGRectMake(0,view.bounds.size.height-64, view.bounds.size.width, 64);

        }
            break;
        case MudItemsBarAnimationNone:
        {
            barView.frame = CGRectMake(0, 0, view.bounds.size.width, 64);
            resultRect = CGRectMake(0, 0, view.bounds.size.width, 64);
        }
            break;
        default:
            break;
    }
    [view addSubview:mask];
    [mask addSubview:barView];
    _isHidden = NO;
    [UIView animateWithDuration:self.duration animations:^{
        barView.frame = resultRect;
        mask.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hiddenBar:(UIView *)view WithBarAnimation:(MudItemsBarAnimation)animation {
    //没有处于显示状态，不执行消失操作
    if (_isHidden != NO) {
        return;
    }
    
    CGRect resultRect;
    switch (animation) {
        case MudItemsBarAnimationTop:
        {
            resultRect = CGRectMake(0,-65, view.bounds.size.width, 64);
        }
            break;
        case MudItemsBarAnimationLeft:
        {
            resultRect = CGRectMake(-view.bounds.size.width,0, view.bounds.size.width, 64);
        }
            break;
        case MudItemsBarAnimationRight:
        {
            resultRect = CGRectMake(view.bounds.size.width,0, view.bounds.size.width, 64);
        }
            break;
        case MudItemsBarAnimationBottom:
        {
            resultRect = CGRectMake(0,view.bounds.size.height, view.bounds.size.width, 64);
        }
            break;
        case MudItemsBarAnimationNone:
        {
            resultRect = CGRectMake(0, 0, view.bounds.size.width, 64);
        }
            break;
        default:
            break;
    }
    [UIView animateWithDuration:self.duration animations:^{
        barView.frame = resultRect;
        mask.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    } completion:^(BOOL finished) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(itemsBarWillDisAppear)]) {
            [self.delegate itemsBarWillDisAppear];
        }
        [barView removeFromSuperview];
        [mask removeFromSuperview];
        _isHidden = YES;
    }];
}

#pragma mark - Gesture/Item Action
- (void)didTouches:(NSSet *)touches withEvent:(UIEvent *)event {
    [self hiddenBar:barView.superview WithBarAnimation:self.barAnimation];
}

- (void)onItemAction:(MudItemBarItem *)item {
    if (self.delegate && [self.delegate respondsToSelector:@selector(itemsBar:clickedButtonAtIndex:)]) {
        [self.delegate itemsBar:self clickedButtonAtIndex:(item.tag-208)];
    }
    [self hiddenBar:barView.superview WithBarAnimation:self.barAnimation];
}

@end

@implementation MudItemsBarMask
- (id)init {
    self = [super init];
    if (self) {
        [self becomeFirstResponder];
    }
    return self;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTouches:withEvent:)]) {
        [self.delegate didTouches:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didTouches:withEvent:)]) {
        [self.delegate didTouches:touches withEvent:event];
    }
}

@end