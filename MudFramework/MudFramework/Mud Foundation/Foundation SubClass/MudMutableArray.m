//
//  TimMutableArray.m
//  CRM
//
//  Created by TimTiger on 6/1/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudMutableArray.h"

@implementation MudMutableArray

- (void)addObject:(id)anObject {
    if (anObject == nil) {
        return;
    } else {
        [super addObject:anObject];
    }
}

@end
