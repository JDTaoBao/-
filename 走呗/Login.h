//
//  Login.h
//  走呗
//
//  Created by apple on 15/9/17.
//  Copyright © 2015年 JIUXIAO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Login : NSObject

// 判断是否已经登陆
- (BOOL)isLogined;

// 登陆
- (void)login;

@end
