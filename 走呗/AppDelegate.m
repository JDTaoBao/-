//
//  AppDelegate.m
//  走呗
//
//  Created by apple on 15/9/16.
//  Copyright (c) 2015年 JIUXIAO. All rights reserved.
//

#import "AppDelegate.h"
#import "JXTabBarController.h"
#import "HomeViewController.h"
#import "AppointmentViewController.h"
#import "ReleseViewController.h"
#import "DiscoverViewController.h"
#import "MyViewController.h"
#import "Login.h"
#import "Constants.h"
#import "LoginViewController.h"


@interface AppDelegate ()

@property (nonatomic, strong)Login *login;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    
//    HomeViewController *homeVC = [[HomeViewController alloc] init];
//    UINavigationController *nhomeVC = [[UINavigationController alloc] initWithRootViewController:homeVC];
//    
//    AppointmentViewController *aVC = [[AppointmentViewController alloc] init];
//    
//    ReleseViewController *pvc= [[ReleseViewController alloc] init];
//    
//    DiscoverViewController *dvc = [[DiscoverViewController alloc] init];
//    
//    MyViewController *mvc = [[MyViewController alloc] init];
//    
//    self.tabbarController = [[JXTabBarController alloc] init];
//    [_tabbarController setViewControllers:@[nhomeVC, aVC, pvc, dvc, mvc]];
//    self.window.rootViewController = self.tabbarController;
//    [self.window makeKeyAndVisible];
    [self isLogined];
    
    return YES;
}

- (void)isLogined {
    self.login = [[Login alloc] init];
    
    if ([_login isLogined] == YES) {
        // 已经登陆过
        NSLog(@"laile");
    } else {
        // 首次登陆 没有本地账户信息
        [self initLoginVC];
        NSLog(@"laile1");
    }
}

- (void)initLoginVC {
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LoginViewController *lvc = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    UINavigationController *nalvc = [[UINavigationController alloc] initWithRootViewController:lvc];
    self.window.rootViewController = nalvc;
    [self.window makeKeyAndVisible];
    
    //    UIImageView *logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(FrameSizeWidth / 2.0 - 50, 100, 100, 100)];
    //    logoImageView.image = [UIImage imageNamed:@"login_logo"];
    //    [self.view addSubview:logoImageView];
    //
    //    self.phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(FrameSizeWidth / 2.0 - 100, FrameSizeHeight / 2.0 - 25, 200, 25)];
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
