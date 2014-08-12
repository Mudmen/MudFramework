//
//  NSError+Extension.h
//  MudFramework
//
//  Created by TimTiger on 14-8-10.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Extension)

- (NSError *)errorWithDomain:(NSString *)domain localizedDescription:(NSString *)localizedDes errorCode:(NSInteger)code;

@end
