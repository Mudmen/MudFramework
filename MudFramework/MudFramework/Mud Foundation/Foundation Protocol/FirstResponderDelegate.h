//
//  FirstResponderDelegate.h
//  CRM
//
//  Created by TimTiger on 5/24/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FirstResponderDelegate <NSObject>

@required
- (void)didBecomeFirstResponder:(id)responder;

@end
