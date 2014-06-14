//
//  CRMNavigationViewController.m
//  CRM
//
//  Created by TimTiger on 5/11/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "MudNavigationViewController.h"
#import "MudNavigationBar.h"


@interface MudNavigationViewController ()

@end

@implementation MudNavigationViewController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        // Custom initialization
        MudNavigationBar *timNavBar = [[MudNavigationBar alloc]init];
        [self setValue:timNavBar forKey:@"navigationBar"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Set View
- (void)setupView {

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
