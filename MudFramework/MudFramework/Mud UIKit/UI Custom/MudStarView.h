//
//  TimStarView.h
//  CRM
//
//  Created by TimTiger on 6/1/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MudStarView : UIView
{
    UIImageView *starNormalView;
    UIImageView *starHighlightView;
}

//设置几星【0 5】之间
@property (nonatomic,readwrite) NSInteger scale;

@end
