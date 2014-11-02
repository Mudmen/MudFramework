//
//  TimSearchBar.h
//  CRM
//
//  Created by TimTiger on 5/23/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MudUIkitDefines.h"

MUDUIKIT_EXTERN NSString *const UIKeyboardHideNotification;

@interface MudSearchBar : UISearchBar<UISearchBarDelegate>
- (void)changeBarTextfieldWithColor:(UIColor *)color bgImageName:(NSString *)bgImageName;
- (void)changeBarCancelButtonWithColor:(UIColor *)textColor bgImageName:(NSString *)bgImageName;
@end