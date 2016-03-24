//
//  WYUser.m
//  WYProject
//
//  Created by 王启镰 on 16/3/23.
//  Copyright © 2016年 wanglijinrong. All rights reserved.
//

#import "WYUser.h"

@implementation WYUser

+ (instancetype)sharedUser {
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (BOOL)isLogin {
    
    return NO;
}

@end
