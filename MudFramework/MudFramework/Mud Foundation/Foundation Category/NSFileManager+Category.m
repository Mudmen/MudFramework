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

- (unsigned long long)fileSizeAtPath:(NSString*)filePath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    return 0;
}

- (unsigned long long)folderSize:(NSString *)folderPath {
    NSFileManager* manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return 0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName;
    unsigned long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil){
        NSString* fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    return folderSize;
}

/**
 *  获取文件大小 ，带单位
 *
 *  @param folderPath 文件夹路劲
 *
 *  @return 大小
 */
- (NSString *)stringFolderSize:(NSString *)folderPath {
    float size = [self folderSize:folderPath];
    NSString  * str = nil;
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
