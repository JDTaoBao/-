//
//  AppDetailViewController.m
//  走呗
//
//  Created by apple on 15/9/21.
//  Copyright © 2015年 JIUXIAO. All rights reserved.
//

#import "AppDetailViewController.h"
#import "Constants.h"
#import "JXTabBarController.h"

@interface AppDetailViewController ()

@end

@implementation AppDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RGBCOLOR(213, 213, 213, 1);
}

- (void)viewWillAppear:(BOOL)animated {
    JXTabBarController *jxTab = [[JXTabBarController alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
