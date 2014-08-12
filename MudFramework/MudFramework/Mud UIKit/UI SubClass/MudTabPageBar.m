//
//  MudTabPageBar.m
//  MudFramework
//
//  Created by TimTiger on 14-7-26.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import "MudTabPageBar.h"
#import "MudTabPageBarItem.h"

@implementation MudTabPageBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.items && self.items.count > 0) {
        CGFloat width = self.bounds.size.width/self.items.count;
        for (NSInteger i = 0; i < self.items.count; i++) {
            MudTabPageBarItem *item = [self.items objectAtIndex:i];
            item.frame = CGRectMake(i*width,0, width,self.bounds.size.height);
        }
    }
}

- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    for (NSInteger i = 0; i < self.items.count; i++) {
        MudTabPageBarItem *tmpitem = [self.items objectAtIndex:i];
        if (selectIndex == i) {
            [tmpitem setSelected:YES];
        } else {
            [tmpitem setSelected:NO];
        }
    }
}

- (void)setItems:(NSArray *)items {
    [self removeViewsFromArray:self.items];
    _items = nil;
    _items = items;
    [self addViewsFromArray:self.items];
    if (self.items != nil && self.items.count > 0) {
        for (MudTabPageBarItem *item in self.items) {
            [item addTarget:self action:@selector(onItemAction:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self setSelectItem:[self.items firstObject]];
    }
}


- (void)setSelectItem:(MudTabPageBarItem *)item {
    for (NSInteger i = 0; i < self.items.count; i++) {
        MudTabPageBarItem *tmpitem = [self.items objectAtIndex:i];
        if (item == tmpitem) {
            _selectIndex = i;
            [tmpitem setSelected:YES];
        } else {
            [tmpitem setSelected:NO];
        }
    }
}

- (void)removeViewsFromArray:(NSArray *)views {
    if (views == nil) {
        return;
    }
    
    for (UIView *view in views) {
        [view removeFromSuperview];
    }
}

- (void)addViewsFromArray:(NSArray *)views {
    if (views == nil) {
        return;
    }
    
    for (UIView *view in views) {
        [self addSubview:view];
    }
}

#pragma mark - Button Action
- (void)onItemAction:(MudTabPageBarItem *)sender {
    [self setSelectItem:sender];
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectItem:index:)]) {
        [self.delegate didSelectItem:sender index:_selectIndex];
    }
}



@end
