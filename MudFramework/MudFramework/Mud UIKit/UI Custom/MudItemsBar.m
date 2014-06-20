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

@interface MudItemsBar ()
{
    UIControl *mask;
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
    }
    return self;
}

- (void)setupViewsInView:(UIView *)parentView {
    if (self.items != nil && self.items.count > 0) {
        barView.frame = CGRectMake(0, -65, parentView.bounds.size.width, 64);
        barView.backgroundColor = self.backgroundColor;
        CGFloat width = parentView.bounds.size.width/self.items.count;
        if (self.translucentMask == YES) {
            mask = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, parentView.bounds.size.width, 1000)];
            mask.backgroundColor = [UIColor blackColor];
            UITapGestureRecognizer *disAppearGesture = [[UITapGestureRecognizer alloc]init];
            disAppearGesture.numberOfTapsRequired = 1;
            [disAppearGesture addTarget:self action:@selector(onTapMaskAction:)];
            [mask addGestureRecognizer:disAppearGesture];
            [parentView addSubview:mask];
            mask.alpha = 0;
        }
        for (NSInteger i = 0; i < self.items.count; i++) {
            MudItemBarItem *item = [self.items objectAtIndex:i];
            item.frame = CGRectMake(width*i,0,width,64);
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
    [view addSubview:barView];
    [UIView animateWithDuration:self.duration animations:^{
        barView.frame = resultRect;
        mask.alpha = 0.5;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)hiddenBar:(UIView *)view WithBarAnimation:(MudItemsBarAnimation)animation {
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
        mask.alpha = 0;
    } completion:^(BOOL finished) {
        [mask removeFromSuperview];
        [barView removeFromSuperview];
    }];
}

#pragma mark - Gesture Action
- (void)onTapMaskAction:(UIGestureRecognizer *)gesture {
    [mask removeGestureRecognizer:gesture];
    [self hiddenBar:mask.superview WithBarAnimation:self.barAnimation];
}

@end
