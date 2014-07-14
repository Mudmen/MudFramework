//
//  MudDisplayTableViewController.m
//  MudFramework
//
//  Created by TimTiger on 6/18/14.
//  Copyright (c) 2014 Mudmen. All rights reserved.
//

#import "MudDisplayTableViewController.h"
#import "CommonMacro.h"
#import "MudRequest.h"
#import "UIBarButtonItem+Extension.h"
#import "UIColor+Extension.h"

@interface MudDisplayTableViewController ()

@end

@implementation MudDisplayTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHex:VIEWCONTROLLER_BACKGROUNDCOLOR];
    [self performSelector:@selector(initData)];
    [self performSelector:@selector(initView)];
    [self becomeRequestResponder]; //成为网络数据响应者
}

- (void)initView {
    // Do any additional setup after did load the view.
}

- (void)refreshView {
    // Do any setup when want to refresh the view.
}

- (void)initData {
    // Do any additional data setup after did load the view.
}

- (void)refreshData {
    // Do any data setup when want to refresh data.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self addUIkeyboardNotificationObserver];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeUIkeyboardNotificationObserver];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [self removeRequestResponder];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark Public API
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.hiddenTabBarWhenPush == YES) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    [self.navigationController pushViewController:viewController animated:animated];
}

- (void)popViewControllerAnimated:(BOOL)animated {
    [self.navigationController popViewControllerAnimated:animated];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [super dismissViewControllerAnimated:flag completion:completion];
}

- (BOOL)isSearchResultsTableView:(UITableView *)tableView {
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return YES;
    }
    return NO;
}

#pragma mark - Pvivate API
- (void)becomeRequestResponder {
    [[MudRequest deafalutRequest] addResponder:self];
}

- (void)removeRequestResponder {
    [[MudRequest deafalutRequest] removeResponder:self];
}

- (void)addUIkeyboardNotificationObserver {
    //    [self addObserveNotificationWithName:UIKeyboardWillShowNotification];
    //    [self addObserveNotificationWithName:UIKeyboardWillHideNotification];
    
    // 键盘高度变化通知，ios5.0新增的
#ifdef __IPHONE_5_0
    if(IOS_5_OR_LATER) {
        [self addObserveNotificationWithName:UIKeyboardWillChangeFrameNotification];
    }
#endif
    
    //    [self addObserveNotificationWithName:UITextFieldTextDidChangeNotification];
    [self addObserveNotificationWithName:UITextFieldTextDidEndEditingNotification];
    //    [self addObserveNotificationWithName:UITextViewTextDidChangeNotification];
    [self addObserveNotificationWithName:UITextViewTextDidEndEditingNotification];
    
}

- (void)removeUIkeyboardNotificationObserver {
    //    [self removeObserverNotificationWithName:UIKeyboardWillShowNotification];
    //    [self removeObserverNotificationWithName:UIKeyboardWillHideNotification];
    
    // 键盘高度变化通知，ios5.0新增的
#ifdef __IPHONE_5_0
    if(IOS_5_OR_LATER) {
        [self removeObserverNotificationWithName:UIKeyboardWillChangeFrameNotification];
    }
#endif
    
    //    [self removeObserverNotificationWithName:UITextFieldTextDidChangeNotification];
    [self removeObserverNotificationWithName:UITextFieldTextDidEndEditingNotification];
    //    [self removeObserverNotificationWithName:UITextViewTextDidChangeNotification];
    [self removeObserverNotificationWithName:UITextViewTextDidEndEditingNotification];
}

#pragma mark Notification

//- (void)keyboardWillShow:(NSNotification *)notification {
//
//    NSDictionary *userInfo = [notification userInfo];
//
//    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGRect keyboardRect = [aValue CGRectValue];
//    CGFloat tableHeight = self.tableView.bounds.size.height;  //table高度
//    CGFloat keyboardHeight = keyboardRect.size.height;  //键盘高度
//    CGFloat visibleHeight = tableHeight-keyboardHeight; //可见区域
//    CGFloat cellBottomY = self.firstResponderCell.frame.origin.y+self.firstResponderCell.bounds.size.height;
//
//    if (cellBottomY > visibleHeight) { //当cell被键盘挡住的时候
//        NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
//        NSTimeInterval animationDuration;
//        [animationDurationValue getValue:&animationDuration]; //获得键盘弹出的动画时间
//        [UIView animateWithDuration:animationDuration animations:^{
//            self.tableView.contentOffset = CGPointMake(0,cellBottomY-visibleHeight);
//        }];
//    }
//}
//
//
//- (void)keyboardWillHide:(NSNotification *)notification {
//
//    NSDictionary* userInfo = [notification userInfo];
//    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
//    NSTimeInterval animationDuration;
//    [animationDurationValue getValue:&animationDuration];
//    [UIView animateWithDuration:animationDuration animations:^{
//        self.tableView.contentOffset = CGPointMake(0,0);
//    }];
//
//}

- (void)textDidChange {
    [self performSelector:@selector(getInputData)];
}

- (void)getInputData {
    
}

#pragma mark ScrollView DElegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}


@end

@implementation MudDisplayTableViewController (Notification)

- (void)addNotificationObserver {
    
}

- (void)removeNotificationObserver {
    
}

- (void)addObserveNotificationWithName:(NSString *)aName {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handNotification:) name:aName object:nil];
}

- (void)addObserveNotificationWithName:(NSString *)aName object:(id)anObject {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handNotification:) name:aName object:anObject];
}

- (void)removeObserverNotificationWithName:(NSString *)aName {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:aName object:nil];
}

- (void)removeObserverNotificationWithName:(NSString *)aName object:(id)anObject {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:aName object:anObject];
}

- (void)postNotification:(NSNotification *)notification {
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject {
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject];
}

- (void)postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo {
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject userInfo:aUserInfo];
}

- (void)handNotification:(NSNotification *)notifacation {
    //    if ([notifacation.name isEqualToString:UIKeyboardWillShowNotification]) {
    //        [self keyboardWillShow:notifacation];
    //    } else if ([notifacation.name isEqualToString:UIKeyboardWillHideNotification]) {
    //        [self keyboardWillHide:notifacation];
    //    } else
    if ([notifacation.name isEqualToString:UIKeyboardWillChangeFrameNotification]
        || [notifacation.name isEqualToString:UITextFieldTextDidChangeNotification]
        || [notifacation.name isEqualToString:UITextFieldTextDidEndEditingNotification]
        || [notifacation.name isEqualToString:UITextViewTextDidChangeNotification]
        || [notifacation.name isEqualToString:UITextViewTextDidEndEditingNotification]) {
        [self textDidChange];
    }
}

@end

@implementation MudDisplayTableViewController (UIBarButtonItem)

- (void)setBackBarButtonWithImage:(UIImage *)image {
    UIBarButtonItem *backItem = [UIBarButtonItem itemWithImage:image target:self action:@selector(onBackButtonAction:)];
    [self.navigationItem setLeftBarButtonItem:backItem];
}

- (void)setLeftBarButtonWithImage:(UIImage *)image {
    UIBarButtonItem *backItem = [UIBarButtonItem itemWithImage:image target:self action:@selector(onLeftButtonAction:)];
    [self.navigationItem setLeftBarButtonItem:backItem];
}

- (void)setRightBarButtonWithImage:(UIImage *)image {
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImage:image target:self action:@selector(onRightButtonAction:)];
    [self.navigationItem setRightBarButtonItem:rightItem];
}

- (void)onLeftButtonAction:(id)sender {
    
}

- (void)onBackButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onRightButtonAction:(id)sender {
    
}
@end
