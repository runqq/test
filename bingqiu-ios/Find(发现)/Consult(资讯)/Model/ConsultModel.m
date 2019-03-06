//
//  ConsultModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ConsultModel.h"

@implementation ConsultModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             @"success":@"success",
             @"message":@"message",
             @"totalProperty":@"totalProperty"
             };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data": [ConsultDetailModel class]
             };
}

@end
