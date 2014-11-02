//
//  NSFileManager+Category.h
//  MudFramework
//
//  Created by TimTiger on 10/11/14.
//  Copyright (c) 2014 Mudmen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Category)

//标记文件夹 不备份到 iCloud
- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL;

/**
 *  获取文件大小
 *
 *  @param filePath 文件路劲
 *
 *  @return 文件大小
 */
- (unsigned long long)fileSizeAtPath:(NSString*)filePath;

/**
 *  获取文件夹 大小
 *
 *  @param folderPath 文件夹路径
 *
 *  @return 文件夹大小 【字符串 带单位】
 */
- (unsigned long long)folderSize:(NSString *)folderPath;

/**
 *  获取文件大小 ，带单位
 *
 *  @param folderPath 文件夹路劲
 *
 *  @return 大小
 */
- (NSString *)stringFolderSize:(NSString *)folderPath;

@end
