//
//  EverydayTrainModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "EverydayTrainModel.h"

@implementation EverydayTrainModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"message":@"message",
             @"totalProperty":@"totalProperty"
             };
}
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data": [EverydayTrainDetailModel class]
             };
}

@end
