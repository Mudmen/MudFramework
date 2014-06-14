//
//  NSDate+Conversion.h
//  PhotoSharer
//
//  Created by TimTiger on 3/18/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Conversion)

/**
 *  NSDate 转成字符串
 *
 *  @return 字符串
 */
- (NSString *)dateToNSString;

/**
 *  NSDate 转成 double
 *
 *  @return double
 */
- (NSTimeInterval)dateToNSTimeInterval;

/**
 *  NSDate 转成 NSNumber
 *
 *  @return NSNumber
 */
- (NSNumber *)dateToNSNumber;

@end
