//
//  Account.m
//  WeiboDemo
//
//  Created by 祝健 on 15/3/28.
//  Copyright (c) 2015年 NCS. All rights reserved.
//

#import "Account.h"

@implementation Account

- (id)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.USERID = dict[@"userid"];
        self.PASSWORD   = dict[@"password"];
    }
    return self;
}

+ (id)accountWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_USERID forKey:@"userid"];
    [aCoder encodeObject:_PASSWORD forKey:@"password"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.USERID = [aDecoder decodeObjectForKey:@"userid"];
        self.PASSWORD = [aDecoder decodeObjectForKey:@"userid"];
    }
    return self;
}

@end
