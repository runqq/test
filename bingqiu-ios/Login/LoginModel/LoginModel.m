//
//  LoginModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/9.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    return @{
             @"success":@"success",
             @"message":@"message"
             };
}
@end
