//
//  TimSearchBar.m
//  CRM
//
//  Created by TimTiger on 5/23/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudSearchBar.h"
#import "CommonMacro.h"
#import "MudToolBar.h"
#import "UIBarButtonItem+Extension.h"
#import "UIColor+Extension.h"
#import "NSString+Conversion.h"

@interface MudSearchBar ()

@property (nonatomic,retain) MudToolBar *toolBar;

@end

@implementation MudSearchBar
@synthesize toolBar;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //self.inputAccessoryView = [self getInputAccessoryView];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardHideNotification object:nil];
}

#pragma mark - Set View
- (void)setupView {

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handNotification:) name:UIKeyboardHideNotification object:nil];
}

- (UIView *)getInputAccessoryView {
    if (toolBar == nil) {
        toolBar = [[MudToolBar alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
        UIControl *lineControl = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, toolBar.bounds.size.width, 0.5)];
        lineControl.backgroundColor = [UIColor grayColor];
        [toolBar addSubview:lineControl];
        UIBarButtonItem *doneItem = [UIBarButtonItem itemWithTitle:@"完成" target:self
                                                            action:@selector(onFinishButtonAction:)];
        [doneItem setTitleColor:[UIColor colorWithHex:0x007aff] forState:UIControlStateNormal];
        
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                  target:nil action:nil];
        
        UIBarButtonItem *cancelItem = [UIBarButtonItem itemWithTitle:@"取消" target:self
                                                              action:@selector(onCancelButtonAction:)];
        
        [cancelItem setTitleColor:[UIColor colorWithHex:0x007aff] forState:UIControlStateNormal];
        
        [toolBar setItems:[NSArray arrayWithObjects:cancelItem,spaceItem,doneItem, nil]];
    }
    return toolBar;
}

#pragma mark - Notification
- (void)handNotification:(NSNotification *)notification {
    if (self.isFirstResponder) {
        [self resignFirstResponder];
    }
}

#pragma mark - Button Action
- (void)onFinishButtonAction:(id)sender {
    if ([self.text isEmpty]) {
        //搜索文字为空，
        if(self.delegate && [self.delegate respondsToSelector:@selector(searchBar:textDidChange:)]) {
            [self.delegate searchBar:self textDidChange:self.text];
        }
    } else {
        [self resignFirstResponder];
        [self setShowsCancelButton:NO animated:YES];
    }
}

- (void)onCancelButtonAction:(id)sender {
    self.text = @"";
    if(self.delegate && [self.delegate respondsToSelector:@selector(searchBar:textDidChange:)]) {
        [self.delegate searchBar:self textDidChange:self.text];
    }
    [self resignFirstResponder];
    [self setShowsCancelButton:NO animated:YES];
}

@end
