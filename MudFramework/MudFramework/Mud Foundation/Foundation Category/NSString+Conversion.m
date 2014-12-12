//
//  NSString+Conversion.m
//  PhotoSharer
//
//  Created by TimTiger on 3/18/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "NSString+Conversion.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Conversion)

- (NSDate *)stringToNSDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSString *format = @"yyyy-MM-dd HH:mm:ss";
    if (self.length < format.length)
    {
        format = [format substringToIndex:self.length-1];
        [dateFormatter setDateFormat:format];
        NSDate *date = [dateFormatter dateFromString:self];
        return date;
    } else if (self.length > format.length)
    {
        NSString *string = [self substringToIndex:format.length-1];
        [dateFormatter setDateFormat:format];
        NSDate *date = [dateFormatter dateFromString:string];
        return date;
    } else {
        [dateFormatter setDateFormat:format];
        NSDate *date = [dateFormatter dateFromString:self];
        return date;
    }
}

/**
 *  字符串转NSDate
 *
 *  @param format 格式
 *
 *  @return 日期
 */
- (NSDate *)stringToNSDateWithFormat:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

/**
 *  NSDate转字符串
 *
 *  @param date   日期
 *  @param format 字符串格式
 *
 *  @return 字符串
 */
+ (NSString *)stringWithDate:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:format];
    NSString *result = [formatter stringFromDate:date];
    return result;
}

- (NSString*)MD5
{
	// Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
 	// Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
	// Create 16 bytes MD5 hash value, store in buffer
    CC_MD5(ptr, strlen(ptr), md5Buffer);
    
	// Convert unsigned char buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
		[output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

/**
 *  根据秒 获取HH:MM:SS格式 字符串
 *
 *  @return 返回时间字符串
 */
+ (NSString *)timeWithNSTimeInterval:(NSTimeInterval)interval {
    NSInteger integer = (NSInteger)interval;
    NSString *resultStr = [NSString string];
    if (integer/3600 > 0) {
        resultStr = [resultStr stringByAppendingString:[NSString stringWithFormat:@"%.2d:",integer/3600]];
        integer %= 3600;
    }

    if (integer/60 > 0) {
         resultStr = [resultStr stringByAppendingString:[NSString stringWithFormat:@"%.2d:",integer/60]];
        integer %= 60;
    } else {
        resultStr = [resultStr stringByAppendingString:@"00:"];
    }
    
    if (integer > 0) {
        resultStr = [resultStr stringByAppendingString:[NSString stringWithFormat:@"%.2d:",integer]];
    } else {
        resultStr = [resultStr stringByAppendingString:@"00:"];
    }
    
    
    if ([resultStr isNotEmpty]) {
        resultStr = [resultStr substringToIndex:[resultStr length]-1];
    }
    return resultStr;
}

/**
 *  空间大小转化为带单位的字符串
 *
 *  @param size 空间大小
 *
 *  @return 带单位的字符串
 */
+ (NSString *)sizeToString:(uint64_t)size {
    NSString  * str = nil;
    if (size/1024.f/1024.f/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.1fG",size/1024.f/1024.f/1024.f];
    } else if (size/1024.f/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.1fM",size/1024.f/1024.f];
    } else if (size/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.1fKB",size/1024.f];
    } else {
        str = @"0KB";
    }
    return str;
}

/**
 *  html 转纯文本
 *
 *  @param html html文本
 *
 *  @return 纯文本
 */
+(NSString *)stringByFilterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        //找到标签的起始位置
        [scanner scanUpToString:@"<" intoString:nil];
        //找到标签的结束位置
        [scanner scanUpToString:@">" intoString:&text];
        //替换字符
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    //    NSString * regEx = @"<([^>]*)>";
    //    html = [html stringByReplacingOccurrencesOfString:regEx withString:@""];
    return html;
}

@end


@implementation NSString (Empty)

- (BOOL)isEmpty {
    
    if (self == nil || self.length < 1 || [self isEqual:[NSNull null]]) {
        return YES;
    }
    
    if(![[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]) {
        //string is all whitespace
        return YES;
    }

    return NO;
}

- (BOOL)isNotEmpty {
    if ([self isEmpty]) {
        return NO;
    } else {
        return YES;
    }
}

+ (BOOL)isEmptyString:(NSString *)str {
    
    if (str == nil || str.length < 1 || [str isEqual:[NSNull null]]) {
        return YES;
    }
    
    if (![[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]) {
        return  YES;
    }
    
    return NO;
}

+ (BOOL)isNotEmptyString:(NSString *)str {
    return ![NSString isEmptyString:str];
}

/**
 *  是否包含字符串
 *
 *  @param str 字符串
 *
 *  @return YES Or NO
 */
- (BOOL)isContainString:(NSString *)str {
    NSRange range = [self rangeOfString:str];
    if (range.length != 0) {
        return YES;
    } else {
        return NO;
    }
}


@end

@implementation NSString (Regular)

/**
 *  检查是否是正确的邮箱地址
 *
 *  @param emailString 邮箱字符串
 *
 *  @return YES，有效，NO ,无效。
 */
- (ValidationResult)isValidEmail {
    return [NSString isValidString:self withFormat:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}

+ (ValidationResult)isValidEmail:(NSString *)emailString {
    return [NSString isValidString:emailString withFormat:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}

/**
 *  检查字符串是否符合指定格式
 *
 *  @param format 格式
 *
 *  @return YES,有效。 NO, 无效。
 */
- (ValidationResult)isValidWithFormat:(NSString *)format {
    return [NSString isValidString:self withFormat:format];
}

+ (ValidationResult)isValidString:(NSString *)string withFormat:(NSString *)format {
    
    if ([string isEmpty]) {
        return ValidationResultValidateStringIsEmpty;
    }
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", format];
    BOOL ret = [emailTest evaluateWithObject:string];
    if (ret) {
        return ValidationResultValid;
    }
    return ValidationResultInValid;
}

@end