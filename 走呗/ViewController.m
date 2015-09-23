//
//  ViewController.m
//  走呗
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 JIUXIAO. All rights reserved.
//

#import "ViewController.h"
#import "Login.h"
#import "HomeViewController.h"
#import "AppointmentViewController.h"
#import "ReleseViewController.h"
#import "DiscoverViewController.h"
#import "PersonViewController.h"
#import "JXTabBarController.h"
#import "LoginViewController.h"
#import "Constants.h"

@interface ViewController ()

@property (nonatomic, strong)Login *login;
@property (nonatomic, strong)JXTabBarController *tabbarController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentMainView) name:@"LoginSuccess" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [self isLogined];
}


- (void)isLogined {
    self.login = [[Login alloc] init];
    
    if ([_login isLogined] == YES) {
        // 已经登陆过
        
    } else {
        // 首次登陆 没有本地账户信息
        
        [self initLoginVC];
        
    }
}

- (void)presentMainView {
    
    CATransition *animation  = [CATransition  animation];
    animation.duration = 0.4;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = NO;
    animation.removedOnCompletion = YES;
    animation.delegate = self;
    animation.repeatCount = 0;
    [self.view.layer addAnimation:animation forKey:@"animation"];
    [self.navigationController.view.layer addAnimation:animation forKey:@"transition"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    for (UIView *tempView in self.view.subviews) {
        [tempView removeFromSuperview];
    }
    
    //设置Nav的背景色和title色
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    [navigationBarAppearance setBarTintColor:RGBCOLOR(0, 215, 232, 1)];
    [navigationBarAppearance setTintColor:[UIColor whiteColor]];
    //    [navigationBarAppearance setTranslucent:NO];
    [navigationBarAppearance setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    // 将动态、约伴、发布、发现、消息 添加到tabbarcontroller容器中
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *nHomeVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    AppointmentViewController *appMentVC = [storyBoard instantiateViewControllerWithIdentifier:@"AppointmentViewController"];
//    UINavigationController *nAppMentVC = [[UINavigationController alloc] initWithRootViewController:appMentVC];
    
    AppointmentViewController *appVC = [[AppointmentViewController alloc] init];
    UINavigationController *nAppMentVC = [[UINavigationController alloc] initWithRootViewController:appVC];
    
//    ReleseViewController *pvc= [[ReleseViewController alloc] init];
    
    DiscoverViewController *dvc = [[DiscoverViewController alloc] init];
    
    PersonViewController *pervc = [[PersonViewController alloc] init];
    UINavigationController *npvc = [[UINavigationController alloc] initWithRootViewController:pervc];
    
    self.tabbarController = [[JXTabBarController alloc] init];
    
    [_tabbarController setViewControllers:@[nHomeVC, nAppMentVC, dvc, npvc] ];
    [UIApplication sharedApplication].keyWindow.rootViewController = _tabbarController;
    
    
}

// 登录按钮点击后的方法
- (void)loginButtonDidClicked:(id)sender {
    [_login login];
    
}

// 跳转到登录页面
- (void)initLoginVC {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LoginViewController *loginViewController = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    UINavigationController *naviLoginViewController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    
    [self presentViewController:naviLoginViewController animated:NO completion:nil];
    
    
}

@end
