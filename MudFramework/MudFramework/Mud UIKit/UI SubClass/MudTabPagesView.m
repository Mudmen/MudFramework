//
//  MudTabPagesView.m
//  MudFramework
//
//  Created by TimTiger on 14-7-26.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import "MudTabPagesView.h"

@interface MudTabPagesView () <UIScrollViewDelegate,MudTabPageBarDelegate>

@property (nonatomic,retain) UIScrollView *pageScrollView;

@end

@implementation MudTabPagesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
    _pageScrollView = [[UIScrollView alloc]init];
    _pageScrollView.delegate = self;
    _pageScrollView.pagingEnabled = YES;
    _pageScrollView.panGestureRecognizer.enabled = NO;
    _pageScrollView.showsHorizontalScrollIndicator = NO;
    _pageScrollView.bounces = NO;

    [_pageScrollView.panGestureRecognizer addTarget:self action:@selector(scrollHandlePan:)];

    self.isSlideSwitchEnable = YES;

    [self addSubview:_pageScrollView];
}

//传递滑动事件给下一层
-(void)scrollHandlePan:(UIPanGestureRecognizer*) panParam
{
    //当滑道左边界时，传递滑动事件给代理
    if(_pageScrollView.contentOffset.x <= 0) {
        if (self.delegate
            && [self.delegate respondsToSelector:@selector(slideSwitchView:panLeftEdge:)]) {
            [self.delegate slideSwitchView:self panLeftEdge:panParam];
        }
    } else if(_pageScrollView.contentOffset.x >= _pageScrollView.contentSize.width - _pageScrollView.bounds.size.width) {
        if (self.delegate
            && [self.delegate respondsToSelector:@selector(slideSwitchView:panRightEdge:)]) {
            [self.delegate slideSwitchView:self panRightEdge:panParam];
        }
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat height = 0;
    if (self.pageBar) {
        self.pageBar.frame = CGRectMake(0, 0, self.bounds.size.width,self.pageBar.bounds.size.height);
        height = self.pageBar.bounds.size.height;
    }
    if (self.pageViews && self.pageViews.count > 0) {
        for (NSInteger i = 0; i < self.pageViews.count; i++) {
            UIView *view = [self.pageViews objectAtIndex:i];
            view.frame = CGRectMake(i*self.bounds.size.width,0, self.bounds.size.width, self.bounds.size.height-height);
        }
        self.pageScrollView.scrollEnabled = self.isSlideSwitchEnable;
        self.pageScrollView.frame = CGRectMake(0,height, self.bounds.size.width, self.bounds.size.height-height);
        self.pageScrollView.contentSize = CGSizeMake(self.pageViews.count*self.bounds.size.width, self.bounds.size.height-height);
    }
}

- (void)setPageBar:(MudTabPageBar *)pageBar {
    [self removeView:_pageBar];
    _pageBar = nil;
    _pageBar = pageBar;
    _pageBar.delegate = self;
    [self addSubview:_pageBar];
}

- (void)setPageViews:(NSArray *)pageViews {
    [self removeViewsFromArray:self.pageViews];
    _pageViews = nil;
    _pageViews = pageViews;
    [self addViewsFromArray:self.pageViews];
}

- (void)removeViewsFromArray:(NSArray *)views {
    if (views && views.count > 0) {
        for (UIView *view in views) {
            [self removeView:view];
        }
    }
}

- (void)addViewsFromArray:(NSArray *)views {
    for (UIView *view in views) {
        [self.pageScrollView addSubview:view];
    }
}

- (void)removeView:(UIView *)view {
    if (view == nil) {
        return;
    }
    [view removeFromSuperview];
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%f",scrollView.contentOffset.x);
    CGFloat pageFloat = scrollView.contentOffset.x/self.bounds.size.width;
    for (NSInteger i = 0; i < self.pageViews.count; i++) {
        if (pageFloat-i == 0) {
            self.pageBar.selectIndex = i;
        }
    }
}

#pragma mark - MudTabPageBar Delegate

- (void)didSelectItem:(MudTabPageBarItem *)item index:(NSInteger)index {
    [self.pageScrollView scrollRectToVisible:CGRectMake(self.bounds.size.width*index, 0, self.bounds.size.width, self.pageScrollView.bounds.size.height) animated:YES];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectedIndex:)]) {
        [self.delegate didSelectedIndex:index];
    }
}

@end
