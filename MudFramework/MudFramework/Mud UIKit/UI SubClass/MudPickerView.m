//
//  TimPickerView.m
//  CRM
//
//  Created by TimTiger on 5/17/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudPickerView.h"
#import "UIBarButtonItem+Extension.h"
#import "UIColor+Extension.h"
#import "MudToolBar.h"

NSString *const TimPickerViewWillShowNotification = @"TimPickerViewWillShowNotification";
NSString *const TimPickerViewDidShowNotification = @"TimPickerViewDidShowNotification";
NSString *const TimPickerViewWillHideNotification = @"TimPickerViewWillHideNotification";
NSString *const TimPickerViewDidHideNotification = @"TimPickerViewDidHideNotification";

@interface MudPickerView ()
{
}
@end

@implementation MudPickerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //Initialization code
        [self addToolBar];
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self) {
        //Initialization code
        [self addToolBar];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _toolBar.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y-44, self.frame.size.width,44);
    [self.superview addSubview:_toolBar];
}

#pragma mark - Set/Get
- (void)setBarColor:(UIColor *)barColor {
    [_toolBar setBarTintColor:barColor];
    [_toolBar setBackgroundColor:barColor];
    if (_barColor != barColor) {
        _barColor = nil;
    }
    _barColor = barColor;
}

#pragma mark - Tool bar
- (void)addToolBar {
    
    self.backgroundColor = [UIColor whiteColor];

    _toolBar = [[MudToolBar alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 44)];
    UIControl *lineControl = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, _toolBar.bounds.size.width, 0.5)];
    lineControl.backgroundColor = [UIColor blackColor];
    [_toolBar addSubview:lineControl];
    UIBarButtonItem *doneItem = [UIBarButtonItem itemWithTitle:@"完成" target:self
                                                        action:@selector(onFinishButtonAction:)];
    [doneItem setTitleColor:[UIColor colorWithHex:0x007aff] forState:UIControlStateNormal];
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:nil action:nil];
    UIBarButtonItem *cancelItem = [UIBarButtonItem itemWithTitle:@"取消" target:self
                                                          action:@selector(onCancelButtonAction:)];
    [cancelItem setTitleColor:[UIColor colorWithHex:0x007aff] forState:UIControlStateNormal];
    [_toolBar setItems:[NSArray arrayWithObjects:cancelItem,spaceItem,doneItem, nil]];

}

#pragma mark - Button Action
- (void)onFinishButtonAction:(UIBarButtonItem *)sender {
    if (self.timdelegate) {
        NSInteger numComponents = [self numberOfComponents];
        for (int i = 0; i < numComponents; i++) {
            if ([self.timdelegate respondsToSelector:@selector(pickerView:finishSelectWithRow:inComponent:)]) {
                [self.timdelegate pickerView:self finishSelectWithRow:[self selectedRowInComponent:i] inComponent:i];
            }
        }
    }
    [self resignFirstResponder];
}

- (void)onCancelButtonAction:(UIBarButtonItem *)sender {
    if (self.timdelegate) {
        if ([self.timdelegate respondsToSelector:@selector(pickerViewCancel:)]) {
            [self.timdelegate pickerViewCancel:self];
        }
    }
    [self resignFirstResponder];
}

@end
