//
//  LoginViewController.m
//  走呗
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 JIUXIAO. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg"]];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forgetPasswordButtonClicked:(id)sender {
    // 忘记密码按钮点击后的事件方法
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ForgetViewController *fvc = [story instantiateViewControllerWithIdentifier:@"ForgetViewController"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self.navigationController pushViewController:fvc animated:YES];
    
    
}

- (IBAction)loginButtonClicked:(id)sender {
    // 登录按钮点击后  事件方法
    
    // 1.判断手机号码或密码填写格式是否正确
    
    // 2.发送网络请求 登录
    
    // 3.成功登录后跳转到主界面
    
}


@end
