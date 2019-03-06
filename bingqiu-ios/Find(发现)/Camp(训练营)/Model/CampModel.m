//
//  CampModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CampModel.h"

@implementation CampModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"totalProperty":@"totalProperty",
             @"message":@"message"
             };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data": [CampDetailModel class]
             };
}

@end
