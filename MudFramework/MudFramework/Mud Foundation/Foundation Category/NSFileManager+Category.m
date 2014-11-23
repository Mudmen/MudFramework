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

- (uint64_t)folderSize:(NSString *)folderPath {
    NSArray *filesArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:folderPath error:nil];
    NSEnumerator *filesEnumerator = [filesArray objectEnumerator];
    NSString *fileName;
    uint64_t fileSize = 0;
    
    while (fileName = [filesEnumerator nextObject]) {
        NSDictionary *fileDictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[folderPath stringByAppendingPathComponent:fileName] error:nil];
        fileSize += [fileDictionary fileSize];
    }
    
    return fileSize;
}

/**
 *  获取文件大小 ，带单位
 *
 *  @param folderPath 文件夹路劲
 *
 *  @return 大小
 */
- (NSString *)stringFolderSize:(NSString *)folderPath {
    uint64_t size = [self folderSize:folderPath];
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

-(uint64_t)getFreeDiskspace {
    uint64_t totalSpace = 0;
    uint64_t totalFreeSpace = 0;
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    
    if (dictionary) {
        NSNumber *fileSystemSizeInBytes = [dictionary objectForKey: NSFileSystemSize];
        NSNumber *freeFileSystemSizeInBytes = [dictionary objectForKey:NSFileSystemFreeSize];
        totalSpace = [fileSystemSizeInBytes unsignedLongLongValue];
        totalFreeSpace = [freeFileSystemSizeInBytes unsignedLongLongValue];
//        NSLog(@"Memory Capacity of %llu MiB with %llu MiB Free memory available.", ((totalSpace/1024ll)/1024ll), ((totalFreeSpace/1024ll)/1024ll));
    } else {
//        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %@", [error domain], [error code]);
    }
    
    return totalFreeSpace;
}

@end
