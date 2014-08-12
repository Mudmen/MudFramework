//
//  UIApplication+Extension.m
//  MudFramework
//
//  Created by TimTiger on 14-8-5.
//  Copyright (c) 2014年 Mudmen. All rights reserved.
//

#import "UIApplication+Extension.h"

@implementation UIApplication (Extension)

+ (UIInterfaceOrientation)currentStatusBarOrientation {
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    return orientation;
}

@end

@implementation UIApplication (Version)

+ (NSString *)currentVersion {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleVersion"];
    return currentVersion;
}

+ (void)checkNewVersionWithAppleID:(NSString *)appleid handler:(ApplicaionVersionHandler)handler {
    
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleVersion"];
    dispatch_async(dispatch_get_global_queue(-2, 0), ^{
        NSString *URL = [NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",appleid];//   661123089
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:URL]];
        [request setHTTPMethod:@"POST"];
        NSHTTPURLResponse *urlResponse = nil;
        NSError *error = nil;
        NSData *recervedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:recervedData options:NSJSONReadingMutableContainers error:nil];
        NSArray *infoArray = [dic objectForKey:@"results"];
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([infoArray count]) {
                NSDictionary *releaseInfo = [infoArray objectAtIndex:0];
                NSString *lastVersion = [releaseInfo objectForKey:@"version"];
                __block NSURL *updateURL = [NSURL URLWithString:[releaseInfo objectForKey:@"trackViewUrl"]];
                if (![lastVersion isEqualToString:currentVersion]) {
                    handler(YES,updateURL);
                }
                else
                {
                    handler(NO,nil);
                }
            }
        });
    });
    
}

+ (void)updateApplicationWithURL:(NSURL *)url {
    [[UIApplication sharedApplication] openURL:url];
}

@end
