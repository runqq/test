//
//  IsVipModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "IsVipModel.h"

@implementation IsVipModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"message":@"message",
             @"data":@"data"
             };
}

@end
