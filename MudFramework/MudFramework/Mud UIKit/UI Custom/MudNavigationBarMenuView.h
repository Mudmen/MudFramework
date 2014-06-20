//
//  TimNavigationBarMenuView.h
//  CRM
//
//  Created by TimTiger on 6/6/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MudNavigationBarMenuViewDelegate;
@interface MudNavigationBarMenuView : UIView

//菜单列表，每行的标题
@property (nonatomic,retain) NSArray *menuArray;
@property (nonatomic,assign) id <MudNavigationBarMenuViewDelegate> delegate;

@end

@protocol MudNavigationBarMenuViewDelegate <NSObject>

- (void)menuView:(UITableView *)menuView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end