//
//  AccountTool.h
//  WeiboDemo
//
//  Created by 祝健 on 15/3/28.
//  Copyright (c) 2015年 NCS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"

@interface AccountTool : NSObject 

@property (nonatomic, readonly) Account *account;

+ (AccountTool *)sharedAccountTool;

- (void)saveAccount:(Account *)account;

@end
