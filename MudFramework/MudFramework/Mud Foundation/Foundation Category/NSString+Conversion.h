//
//  NSString+Conversion.h
//  PhotoSharer
//
//  Created by TimTiger on 3/18/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Conversion)

/**
 *  NSDate转字符串
 *
 *  @param date   日期
 *  @param format 字符串格式
 *
 *  @return 字符串
 */
+ (NSString *)stringWithDate:(NSDate *)date withFormat:(NSString *)format;

/**
 *  字符串转NSDate
 *
 *  @return NSDate
 */
- (NSDate *)stringToNSDate;

/**
 *  字符串MD5编码
 *
 *  @return 编码后的字符串
 */
- (NSString *)MD5;

@end

@interface NSString (Empty)

/**
 *  字符串是否为空
 */
+ (BOOL)isEmptyString:(NSString *)str;
- (BOOL)isEmpty;
- (BOOL)isNotEmpty;

@end