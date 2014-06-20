//
//  MudItemBarItem.h
//  MudFramework
//
//  Created by TimTiger on 6/19/14.
//  Copyright (c) 2014 Mudmen. All rights reserved.
//

//UIbuttn中的imageView和titleLabel,它们是无法显示的。

#import <UIKit/UIKit.h>

@interface MudItemBarItem : UIButton
{
@private
}

@property(nonatomic,copy)             NSString    *text;        // default is nil
@property(nonatomic,retain)           UIImage     *iteImage;        // default is nil

@end
