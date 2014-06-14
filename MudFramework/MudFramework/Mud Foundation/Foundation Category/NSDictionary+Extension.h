//
//  NSDictionary+Extension.h
//  CRM
//
//  Created by TimTiger on 5/15/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

- (NSString *)stringForKey:(NSString *)aKey;
- (NSArray *)arrayForKey:(NSString *)aKey;
- (NSDictionary *)dictionaryForKey:(NSString *)aKey;
- (NSData *)dataForKey:(NSString *)aKey;
- (NSInteger)integerForKey:(NSString *)aKey;
- (float)floatForKey:(NSString *)aKey;
- (double)doubleForKey:(NSString *)aKey;
- (BOOL)boolForKey:(NSString *)aKey;
@end
