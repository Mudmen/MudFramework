//
//  TimPickerTextField.m
//  CRM
//
//  Created by TimTiger on 5/20/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudPickerTextField.h"
#import "MudToolBar.h"
#import "UIColor+Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "NSDate+Conversion.h"

NSString *const UIKeyboardHideNotification = @"UIKeyboardHideNotification";

@interface MudPickerTextField () <UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *_inputPickerView;
    UIDatePicker *_datePickerView;
    MudToolBar *toolBar;
    
    UIView *textInputView;
}
@end


@implementation MudPickerTextField 
@synthesize dataSource = _dataSource,actiondelegate = _actiondelegate,mode = _mode;

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
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardHideNotification object:nil];
}

#pragma mark - Set View
- (void)setupView {
    _mode = TextFieldInputModeKeyBoard;
    self.borderStyle = UITextBorderStyleRoundedRect;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handNotification:) name:UIKeyboardHideNotification object:nil];
}

- (UIView *)getCustomPicker {
    if (textInputView == nil) {
       
        [self initPicker];
        if (self.dataSource) {
            if([self.dataSource respondsToSelector:@selector(boundsOfPickerView:)]) {
                CGRect bounds = [self.dataSource boundsOfPickerView:_inputPickerView];
                _inputPickerView.bounds = bounds;
            }
        }
        [self initToolBar];
        toolBar.frame = CGRectMake(0, 0,_inputPickerView.bounds.size.width, 44);
        
        textInputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,_inputPickerView.bounds.size.width,_inputPickerView.bounds.size.height+toolBar.bounds.size.height)];
        textInputView.backgroundColor = [UIColor whiteColor];
        [textInputView addSubview:toolBar];
        [textInputView addSubview:_inputPickerView];
    }
    return textInputView;
}

- (UIView *)getDefaultPicker {
    if (textInputView == nil) {
        //初始化选择器
        [self initPicker];
        [self initToolBar];
        textInputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,_inputPickerView.bounds.size.width,_inputPickerView.bounds.size.height+toolBar.bounds.size.height)];
        textInputView.backgroundColor = [UIColor whiteColor];
        [textInputView addSubview:toolBar];
        [textInputView addSubview:_inputPickerView];
    }
    return textInputView;
}

- (UIView *)getDatePicker {
    if (textInputView == nil) {
        [self initDatePicker];
        [self initToolBar];
        textInputView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,_datePickerView.bounds.size.width,_datePickerView.bounds.size.height+toolBar.bounds.size.height)];
        textInputView.backgroundColor = [UIColor whiteColor];
        [textInputView addSubview:toolBar];
        [textInputView addSubview:_datePickerView];
    }
    return textInputView;
}

- (void)initDatePicker {
    _datePickerView = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,44, self.bounds.size.width, 216)];
    _datePickerView.datePickerMode = UIDatePickerModeDateAndTime;
    [_datePickerView addTarget:self action:@selector(dateDidChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)initPicker {
    if (_inputPickerView == nil) {
        _inputPickerView = [[UIPickerView alloc]init];
        _inputPickerView.delegate = self;
        _inputPickerView.dataSource = self;
    }
    _inputPickerView.frame = CGRectMake(0,44, 320, 216);
}

- (void)initToolBar {
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
}
- (UIView *)getAcessoryView {
    if (toolBar == nil) {
        [self initToolBar];
    }
    return toolBar;
}

- (void)handNotification:(NSNotification *)notification {
    if (self.isFirstResponder) {
        [self resignFirstResponder];
    }
}

#pragma mark - Overload
//光标的处理
- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    if (self.mode == TextFieldInputModeKeyBoard) {
        return [super caretRectForPosition:position];
    }
    return CGRectZero;
}

//输入源键盘的处理
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.mode == TextFieldInputModeCustomPicker) {
        self.inputView = [self getCustomPicker];
    } else if(self.mode == TextFieldInputModePicker){
        self.inputView = [self getDefaultPicker];
    } else if(self.mode == TextFieldInputModeKeyBoard || self.mode == TextFieldInputModeExternal) {
        self.inputAccessoryView = [self getAcessoryView];
    } else if(self.mode == TextFieldInputModeDatePicker) {
        self.inputView = [self getDatePicker];
    }
}

#pragma mark - BUttton action
- (void)dateDidChange:(UIDatePicker *)picker {
    self.text = [[picker date] dateToNSString];
}

#pragma mark - UIPickerView Delegate /DataSource
- (void)onFinishButtonAction:(UIBarButtonItem *)sender {
    
    if (self.mode == TextFieldInputModeDatePicker) {
        self.text = [_datePickerView.date dateToNSString];
    }
    if (self.mode == TextFieldInputModePicker) {
        if (self.pickerDataSource && _inputPickerView) {
            NSInteger selectRow = [_inputPickerView selectedRowInComponent:0];
            self.text = [self.pickerDataSource objectAtIndex:selectRow];
        }
    }
    if (self.mode == TextFieldInputModeCustomPicker) {
        if(self.actiondelegate) {
            NSInteger numComponents = [_inputPickerView numberOfComponents];
            for (int i = 0; i < numComponents; i++) {
                if ([self.actiondelegate respondsToSelector:@selector(pickerView:finishSelectWithRow:inComponent:)]) {
                    [self.actiondelegate pickerView:_inputPickerView finishSelectWithRow:[_inputPickerView selectedRowInComponent:i] inComponent:i];
                }
            }
        }
    }
    [self resignFirstResponder];
}

- (void)onCancelButtonAction:(UIBarButtonItem *)sender {
    if (self.actiondelegate) {
        if ([self.actiondelegate respondsToSelector:@selector(pickerViewCancel:)]) {
            [self.actiondelegate pickerViewCancel:_inputPickerView];
        }
    }
    [self resignFirstResponder];
}

//选择了某一行的回调
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (self.actiondelegate) {
        if ([self.actiondelegate respondsToSelector:@selector(pickerView:didSelectRow:inComponent:)]) {
            [self.actiondelegate pickerView:_inputPickerView didSelectRow:row inComponent:component];
        }
    }
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (self.dataSource)
    {
        if ([self.dataSource respondsToSelector:@selector(numberOfComponentsInPickerView:)])
        {
          return [self.dataSource numberOfComponentsInPickerView:pickerView];
        }
    }
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (self.dataSource)
    {
        if ([self.dataSource respondsToSelector:@selector(pickerView:numberOfRowsInComponent:)])
        {
           return [self.dataSource pickerView:pickerView numberOfRowsInComponent:component];
        }
    } else if (self.pickerDataSource) {
        return self.pickerDataSource.count;
    }
    return 1;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (self.dataSource) {
        if ([self.dataSource respondsToSelector:@selector(pickerView:widthForComponent:)]) {
           return [self.dataSource pickerView:pickerView widthForComponent:component];
        }
    }
    return 320;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    if (self.dataSource) {
        if ([self.dataSource respondsToSelector:@selector(pickerView:rowHeightForComponent:)]) {
           return [self.dataSource pickerView:pickerView rowHeightForComponent:component];
        }
    }
    return 30;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (self.dataSource) {
        if ([self.dataSource respondsToSelector:@selector(pickerView:titleForRow:forComponent:)]) {
           return [self.dataSource pickerView:pickerView titleForRow:row forComponent:component];
        }
    }
    return nil;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    if (self.dataSource) {
        if ([self.dataSource respondsToSelector:@selector(pickerView:viewForRow:forComponent:reusingView:)]) {
           return [self.dataSource pickerView:pickerView viewForRow:row forComponent:component reusingView:view];
        }
    } else if (self.pickerDataSource && _inputPickerView) {
        UILabel *rowView = nil;
        if ([view isKindOfClass:[UILabel class]]) {
            rowView = (UILabel *)view;
        } else {
            rowView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
        }
        rowView.text = [self.pickerDataSource objectAtIndex:row];
        return rowView;
    }
    return view;
}

@end
