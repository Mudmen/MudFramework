//
//  NSError+Extension.m
//  MudFramework
//
//  Created by TimTiger on 14-8-10.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import "NSError+Extension.h"

@implementation NSError (Extension)

- (NSError *)errorWithDomain:(NSString *)domain localizedDescription:(NSString *)localizedDes errorCode:(NSInteger)code {
    NSDictionary *userinfo = [NSDictionary dictionaryWithObjectsAndKeys:localizedDes,NSLocalizedDescriptionKey, nil];
    NSError *error = [NSError errorWithDomain:domain code:code userInfo:userinfo];
    return error;
}

@end
