//
//  Account.h
//  WeiboDemo
//
//  Created by 祝健 on 15/3/28.
//  Copyright (c) 2015年 NCS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>

@property (nonatomic, copy) NSString    *USERID;
@property (nonatomic, copy) NSString    *PASSWORD;

- (id)initWithDict:(NSDictionary *)dict;

+ (id)accountWithDict:(NSDictionary *)dict;

@end
