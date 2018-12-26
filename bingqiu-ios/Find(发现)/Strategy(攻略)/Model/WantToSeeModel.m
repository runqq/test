//
//  WantToSeeModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/2.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "WantToSeeModel.h"

@implementation WantToSeeModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"totalProperty":@"totalProperty"
             };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data": [WantToSeeDetailModel class]
             };
}

@end
