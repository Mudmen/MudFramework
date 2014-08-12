//
//  NSDate+Conversion.m
//  PhotoSharer
//
//  Created by TimTiger on 3/18/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "NSDate+Conversion.h"

@implementation NSDate (Conversion)

/**
 *  NSDate 转成字符串
 *
 *  @return 字符串
 */
- (NSString *)dateToNSString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *strDate = [dateFormatter stringFromDate:self];
    return strDate;
}

/**
 *  NSDate 转成 NSTimeInterval
 *
 *  @return NSTimeInterval
 */
- (NSTimeInterval)dateToNSTimeInterval {
    NSTimeInterval timeInterval = [self timeIntervalSince1970];
    return timeInterval;
}

/**
 *  NSDate 转成 NSNumber
 *
 *  @return NSNumber
 */
- (NSNumber *)dateToNSNumber {
    NSNumber *number = [NSNumber numberWithDouble:[self dateToNSTimeInterval]];
    return number;
}



@end
