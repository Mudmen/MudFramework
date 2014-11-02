//
//  MudManager.h
//  MudFramework
//
//  Created by TimTiger on 14-8-17.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestSuccessBlock)();
typedef void(^RequestFailedBlock)(NSError *error);

@interface MudManager : NSObject

@end
