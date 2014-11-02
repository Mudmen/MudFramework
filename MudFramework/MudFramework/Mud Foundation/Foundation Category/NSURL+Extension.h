//
//  NSURL+Extension.h
//  MudFramework
//
//  Created by TimTiger on 14-8-12.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Extension)

/**
 *  判断URL的前缀和后缀
 *
 *  @param aString 要查询的缀字符串
 *
 *  @return YES if exists Or NO.
 */
- (BOOL)hasPrefix:(NSString *)aString;
- (BOOL)hasSuffix:(NSString *)aString;

@end
