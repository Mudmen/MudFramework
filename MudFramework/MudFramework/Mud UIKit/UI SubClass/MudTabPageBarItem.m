//
//  MudTabPageItem.m
//  MudFramework
//
//  Created by TimTiger on 14-7-26.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import "MudTabPageBarItem.h"

@interface MudTabPageBarItem ()

@property (nonatomic,retain) UIView *indexView;

@end

@implementation MudTabPageBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _indexView = [[UIView alloc]init];
        self.indexViewHidden = NO;
        self.indexViewHeight = 2.0f;
        self.indexViewColor = [UIColor grayColor];
        [self addSubview:_indexView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor clearColor];
    self.indexView.frame = CGRectMake(0, 0, self.titleLabel.bounds.size.width+4, self.indexViewHeight);
    self.indexView.center = CGPointMake(self.titleLabel.center.x, self.bounds.size.height-self.indexViewHeight);
    self.indexView.backgroundColor = self.indexViewColor;
    if (self.indexViewHidden) {
        self.indexView.hidden = YES;
    } else {
       self.indexView.hidden = !self.selected;
    }
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    [self setNeedsLayout];
}

@end
