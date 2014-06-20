//
//  MudItemBarItem.m
//  MudFramework
//
//  Created by TimTiger on 6/19/14.
//  Copyright (c) 2014 Mudmen. All rights reserved.
//

#import "MudItemBarItem.h"

@interface MudItemBarItem ()
{
}

@property (nonatomic,retain) UIImageView *itemImageView;
@property (nonatomic,retain) UILabel *textLabel;

@end

@implementation MudItemBarItem

- (id)init {
    self = [super init];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    _itemImageView = [[UIImageView alloc]init];
    self.itemImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:_itemImageView];
    
    _textLabel = [[UILabel alloc]init];
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    self.textLabel.textColor = [UIColor grayColor];
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_textLabel];
}

#pragma mark - OverLoad
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.hidden = YES;
    self.titleLabel.hidden = YES;
    self.itemImageView.frame = CGRectMake(0,5,34, 34);
    self.itemImageView.center = CGPointMake(self.bounds.size.width/2.f, self.itemImageView.center.y);
    self.itemImageView.image = self.iteImage;
    self.textLabel.frame = CGRectMake(0, 39, self.bounds.size.width, 20);
    self.textLabel.text = self.text;
}

@end
