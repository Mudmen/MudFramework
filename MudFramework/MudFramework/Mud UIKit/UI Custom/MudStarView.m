//
//  TimStarView.m
//  CRM
//
//  Created by TimTiger on 6/1/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudStarView.h"

@implementation MudStarView
@synthesize scale = _scale;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    starNormalView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    starHighlightView.frame = CGRectMake(0, 0, self.bounds.size.width*(self.scale/5.0f), self.bounds.size.height);
}

- (void)initView {
    starNormalView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    starNormalView.image = [UIImage imageNamed:@"star_normal"];
    starNormalView.userInteractionEnabled = NO;
    [self addSubview:starNormalView];
    starHighlightView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 0, self.bounds.size.height)];
    starHighlightView.image = [UIImage imageNamed:@"star_highlight"];
    starHighlightView.contentMode= UIViewContentModeLeft;
    starHighlightView.clipsToBounds = YES;
    starHighlightView.userInteractionEnabled = NO;
    [self addSubview:starHighlightView];
    
}

- (void)setScale:(NSInteger)scale {
    if (scale > 5) {
        _scale = 5;
    } else {
        _scale = scale;
    }
    [self setNeedsLayout];
}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self];
//    self.scale = point.x/self.bounds.size.width;
//    [self setNeedsLayout];
//}

@end
