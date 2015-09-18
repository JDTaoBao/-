//
//  TestViewController.m
//  走呗
//
//  Created by apple on 15/9/17.
//  Copyright © 2015年 JIUXIAO. All rights reserved.
//

#import "TestViewController.h"
#import "SetPasswordViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nextButtonClicked:(id)sender {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    SetPasswordViewController *spvc = [story instantiateViewControllerWithIdentifier:@"SetPasswordViewController"];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.navigationController pushViewController:spvc animated:YES];
}



@end
