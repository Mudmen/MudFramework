//
//  MudDisplayTableViewController.h
//  MudFramework
//
//  Created by TimTiger on 6/18/14.
//  Copyright (c) 2014 Mudmen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MudDisplayTableViewController : UITableViewController

@property (nonatomic) BOOL hiddenTabBarWhenPush;

//视图数据的操作， initView 和 initData在 viewdidload中已经调用了，子类中只需要实现这两个方法就好
- (void)initView;
- (void)refreshView;
- (void)initData;
- (void)refreshData;
- (BOOL)isSearchResultsTableView:(UITableView *)tableView;

//相当于self.navigationviewcontroller push的功能
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
- (void)popViewControllerAnimated:(BOOL)animated;

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;

@end


@interface MudDisplayTableViewController (Notification)
- (void)addNotificationObserver;
- (void)removeNotificationObserver;

//监听、移除某个通知
- (void)addObserveNotificationWithName:(NSString *)aName;
- (void)addObserveNotificationWithName:(NSString *)aName object:(id)anObject;
- (void)removeObserverNotificationWithName:(NSString *)aName;
- (void)removeObserverNotificationWithName:(NSString *)aName object:(id)anObject;

//发送通知
- (void)postNotification:(NSNotification *)notification;
- (void)postNotificationName:(NSString *)aName object:(id)anObject;
- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

//监听到通知后的处理函数
- (void)handNotification:(NSNotification *)notifacation;

@end

@interface MudDisplayTableViewController (UIBarButtonItem)

- (void)setBackBarButtonWithImage:(UIImage *)image;
- (void)setRightBarButtonWithImage:(UIImage *)image;
- (void)setLeftBarButtonWithImage:(UIImage *)image;
- (void)onBackButtonAction:(id)sender;
- (void)onRightButtonAction:(id)sender;
- (void)onLeftButtonAction:(id)sender;

@end
