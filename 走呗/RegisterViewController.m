//
//  RegisterViewController.m
//  走呗
//
//  Created by apple on 15/9/18.
//  Copyright (c) 2015年 JIUXIAO. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface RegisterViewController ()


@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *authCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation RegisterViewController
//注册页面
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title= @"注册";
    // Do any additional setup after loading the view from its nib.
    [_phoneNumberTextField addTarget:self action:@selector(phoneNumberTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:_phoneNumberTextField];
    
    [_authCodeTextField addTarget:self action:@selector(authCodeTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
    _authCodeTextField.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:_authCodeTextField];
    
    _passwordTextField.clearButtonMode=UITextFieldViewModeWhileEditing;
    [_passwordTextField addTarget:self action:@selector(passwordTextField:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview:_passwordTextField];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
}

-(void)phoneNumberTextField:(id)sender{
}
-(void)authCodeTextField:(id)sender{
}
-(void)passwordTextField:(id)sender{
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
- (IBAction)RegisterBtn:(id)sender {
    
    
}

- (IBAction)AuthCodeBtn:(id)sender {
    //获取短信验证码
    
    
}

@end
