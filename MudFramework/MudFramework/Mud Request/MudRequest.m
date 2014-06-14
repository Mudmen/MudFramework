//
//  TimRequest.m
//  CRM
//
//  Created by TimTiger on 5/14/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudRequest.h"

@implementation MudRequest

+(id)deafalutRequest {
    static MudRequest *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MudRequest alloc]init];
    });
    return _instance;
}

@end
