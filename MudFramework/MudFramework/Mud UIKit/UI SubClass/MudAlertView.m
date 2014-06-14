//
//  TimAlertView.m
//  CRM
//
//  Created by TimTiger on 6/2/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudAlertView.h"

@interface MudAlertView ()  <UIAlertViewDelegate>
{
    AlertButtonHandler _cancelhandler;
    AlertButtonHandler _comfirmhandler;
}

@end

@implementation MudAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message cancelHandler:(AlertButtonHandler)cancelHandler comfirmButtonHandlder:(AlertButtonHandler)comfirmHandler {
    self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    if (self) {
        _cancelhandler = cancelHandler;
        _comfirmhandler = comfirmHandler;
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        _cancelhandler();
    } else if (buttonIndex == 1) {
        _comfirmhandler();
    }
}

@end
