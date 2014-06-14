//
//  NSDictionary+Extension.m
//  CRM
//
//  Created by TimTiger on 5/15/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

- (NSString *)stringForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return nil;
    }
    
    NSString *value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }
    
    return nil;
}

- (NSArray *)arrayForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return nil;
    }
    
    NSArray *value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    
    return nil;
}

- (NSDictionary *)dictionaryForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return nil;
    }
    
    NSDictionary *value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    
    return nil;
}

- (NSData *)dataForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return nil;
    }
    
    NSData *value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    
    return nil;
}

- (NSInteger)integerForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return 0;
    }
    
    NSNumber *value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value integerValue]) {
            return [value integerValue];
        }
    }
    
    return 0;
}

- (float)floatForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return 0;
    }
    
    NSNumber *value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value floatValue];
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value floatValue]) {
            return [value floatValue];
        }
    }
    
    return 0;
}

- (double)doubleForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return 0;
    }
    
    NSNumber *value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value doubleValue];
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value doubleValue]) {
            return [value doubleValue];
        }
    }
    
    return 0;
}

- (BOOL)boolForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return NO;
    }
    
    NSNumber *value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value boolValue]) {
            return [value boolValue];
        }
    }
    
    return NO;
}

@end
