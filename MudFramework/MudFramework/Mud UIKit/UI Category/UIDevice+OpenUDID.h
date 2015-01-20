//
//  UIDevice+OpenUDID.h
//  MudFramework
//
//  Created by TimTiger on 14-7-22.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

//关于各种ID的变化 请看 http://cache.baiducontent.com/c?m=9d78d513d99215b8599dd3395640c321590a8f397a9192027ea78e55c33a0614506694ea66744c13d3b2203047b21f0bb5ad6a2460473de4db8ed31b83ec8f7e78ce746f2e5d9b4b18d218a5c14c&p=87769a47a49d02f508e2947f0c4380&newp=8c348b5e86cc41ae59a7c7710f4d96231610db2151d0d71035&user=baidu&fm=sc&query=cfuuid&qid=&p1=1

#import <UIKit/UIKit.h>

@interface UIDevice (OpenUDID)

//+ (NSString *)openUDID; 废弃

+ (NSString *)ADUDID;

+ (NSString *)CFUUID;

+ (NSString *)NSUDID;

@end
