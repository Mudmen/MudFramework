//
//  NSError+Extension.h
//  MudFramework
//
//  Created by TimTiger on 14-8-10.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Extension)

/**
 * 用参数信息，生成一个错误
**/
+ (NSError *)errorWithDomain:(NSString *)domain localizedDescription:(NSString *)localizedDes errorCode:(NSInteger)code;

@end
