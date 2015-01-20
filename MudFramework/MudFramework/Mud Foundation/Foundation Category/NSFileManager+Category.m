//
//  NSFileManager+Category.m
//  MudFramework
//
//  Created by TimTiger on 10/11/14.
//  Copyright (c) 2014 Mudmen. All rights reserved.
//

#import "NSFileManager+Category.h"

@implementation NSFileManager (Category)

- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL {
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    //    id flag = [NSNumber numberWithBool:NO];
    //    [URL getResourceValue: &flag
    //                   forKey: NSURLIsExcludedFromBackupKey error: &error];
    //
    return success;
    //    NSError *error = nil;
    //
    //    BOOL result = [URL setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error:&error];
    //    return result;
}

//单位字节（Byte）
+ (NSNumber *)systemFreeSize {
    NSString* path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] ;
    NSFileManager* fileManager = [[NSFileManager alloc ]init];
    NSDictionary *fileSysAttributes = [fileManager attributesOfFileSystemForPath:path error:nil];
    NSNumber *freeSpace = [fileSysAttributes objectForKey:NSFileSystemFreeSize];
    return freeSpace;
}
//剩余空间字符串，最小单位kB,最大单位G
+ (NSString *)stringForSystemFreeSize {
    NSNumber *freeSpace = [NSFileManager systemFreeSize];
    NSString  * str = nil;
    if ([freeSpace longLongValue]/1024.f/1024.f/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.2fGB",[freeSpace longLongValue]/1024.f/1024.f/1024.f];
    } else if ([freeSpace longLongValue]/1024.f/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.2fMB",[freeSpace longLongValue]/1024.f/1024.f];
    } else if ([freeSpace longLongValue]/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.2fKB",[freeSpace longLongValue]/1024.f];
    } else {
        str = @"0KB";
    }
    return str;
}


- (NSNumber *)folderSize:(NSString *)folderPath {
    NSArray *subPaths = [[NSFileManager defaultManager] subpathsAtPath:folderPath];
    unsigned long long totalSize = 0;
    for (NSString *path in subPaths) {
        unsigned long long size = [[[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil] fileSize];
        totalSize += size;
    }
    return @(totalSize);
}

/**
 *  获取文件大小 ，带单位
 *
 *  @param folderPath 文件夹路劲
 *
 *  @return 大小
 */
- (NSString *)stringFolderSize:(NSString *)folderPath {
    NSNumber *sizeNum = [self folderSize:folderPath];
    NSString  * str = nil;
    float size = [sizeNum floatValue];
    if (size/1024.f/1024.f/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.2fGB",size/1024.f/1024.f/1024.f];
    } else if (size/1024.f/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.2fMB",size/1024.f/1024.f];
    } else if (size/1024.f > 1) {
        str = [NSString stringWithFormat:@"%0.2fKB",size/1024.f];
    } else {
        str = @"0KB";
    }
    return str;
}


@end
