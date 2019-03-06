//
//  XunZhangModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/27.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XunZhangModel.h"

@implementation XunZhangModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"message":@"message",
             @"data":@"data"
             };
}

@end
