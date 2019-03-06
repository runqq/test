//
//  HotModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/5.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HotModel.h"

@implementation HotModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"totalProperty":@"totalProperty"
             };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data": [HotDetailModel class]
             };
}

@end
