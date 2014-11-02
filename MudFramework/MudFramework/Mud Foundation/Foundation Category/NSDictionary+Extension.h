//
//  NSDictionary+Extension.h
//  CRM
//
//  Created by TimTiger on 5/15/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

/**
 *  Get string with key when we konw the value is NSString
 *
 *  @param aKey key
 *
 *  @return string
 */
- (NSString *)stringForKey:(NSString *)aKey;

/**
 *  Get array with key when we konw the value is NSArray
 *
 *  @param aKey key
 *
 *  @return array
 */
- (NSArray *)arrayForKey:(NSString *)aKey;

/**
 *  Get dictionary with key when we konw the value is NSDictionary
 *
 *  @param aKey key
 *
 *  @return dictionary
 */
- (NSDictionary *)dictionaryForKey:(NSString *)aKey;

/**
 *  Get data with key when we konw the value is NSData
 *
 *  @param aKey key
 *
 *  @return data
 */
- (NSData *)dataForKey:(NSString *)aKey;

/**
 *  Get integer value with key if value is NSNumber or NSString that has integer value.
 *
 *  @param aKey key
 *
 *  @return integervalue or 0 if value can't be integer value
 */
- (NSInteger)integerForKey:(NSString *)aKey;

- (NSInteger)integerForKey:(NSString *)aKey placeholder:(NSInteger)placeholder;

/**
 * like integerForKey
 */
- (float)floatForKey:(NSString *)aKey;

/**
 * like integerForKey
 */
- (double)doubleForKey:(NSString *)aKey;

/**
 * like integerForKey
 */
- (BOOL)boolForKey:(NSString *)aKey;
@end
