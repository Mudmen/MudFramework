//
//  NSURL+Extension.m
//  MudFramework
//
//  Created by TimTiger on 14-8-12.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import "NSURL+Extension.h"

@implementation NSURL (Extension)

- (BOOL)hasPrefix:(NSString *)aString  {
    NSString *absoluteString = [self absoluteString];
    return [absoluteString hasPrefix:aString];
}

- (BOOL)hasSuffix:(NSString *)aString {
    NSString *absoluteString = [self absoluteString];
    return [absoluteString hasSuffix:aString];
}

@end
