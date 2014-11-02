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

/**
 *  根据秒 获取HH:MM:SS格式 字符串
 *
 *  @return 返回时间字符串
 */
+ (NSString *)timeWithNSTimeInterval:(NSTimeInterval)interval;

/**
 *  空间大小转化为带单位的字符串
 *
 *  @param size 空间大小
 *
 *  @return 带单位的字符串
 */
+ (NSString *)sizeToString:(uint64_t)size;

@end

@interface NSString (Empty)

/**
 *  字符串是否为空
 */
+ (BOOL)isEmptyString:(NSString *)str; 
+ (BOOL)isNotEmptyString:(NSString *)str;
- (BOOL)isEmpty;
- (BOOL)isNotEmpty;

@end

typedef NS_ENUM(NSInteger,ValidationResult) {
    ValidationResultValid,                  //字符串符合格式
    ValidationResultValidateStringIsEmpty,  //验证字符串为空
    ValidationResultInValid,                //字符串不符合格式
};

@interface NSString (Regular)

/**
 *  检查是否是正确的邮箱地址
 *
 *  @param emailString 邮箱字符串
 *
 *  @return YES，有效，NO ,无效。
 */
- (ValidationResult)isValidEmail;
+ (ValidationResult)isValidEmail:(NSString *)emailString;

/**
 *  检查字符串是否符合指定格式
 *
 *  @param format 格式
 *
 *  @return YES,有效。 NO, 无效。
 */
- (ValidationResult)isValidWithFormat:(NSString *)format;
+ (ValidationResult)isValidString:(NSString *)string withFormat:(NSString *)format;

@end