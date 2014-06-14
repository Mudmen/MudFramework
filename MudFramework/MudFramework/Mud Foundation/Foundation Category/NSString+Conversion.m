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
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
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

@end