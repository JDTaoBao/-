//
//  Login.m
//  走呗
//
//  Created by apple on 15/9/17.
//  Copyright © 2015年 JIUXIAO. All rights reserved.
//

#import "Login.h"
#import "ViewController.h"
#import "AccountTool.h"
#import "LoginViewController.h"

@interface Login ()

@property (nonatomic, strong)NSString      *USERID;
@property (nonatomic, strong)NSString      *PASSWORD;
@property (nonatomic, strong)AccountTool   *accountTool;

@end

@implementation Login

- (instancetype)init {
    if (self = [super init]) {
        _accountTool = [[AccountTool alloc] init];
        
        // 读取本地数据
        _USERID = _accountTool.account.USERID;
        _PASSWORD = _accountTool.account.PASSWORD;
    }
    return self;
}

- (void)login {
    // 登陆操作
    
    
}

- (BOOL)isLogined {
    // 判断是否已经登陆
    if (_USERID.length > 0) {
        return YES;
    } else {
        return NO;
    }
}

@end
