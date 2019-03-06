//
//  JiangXueJinModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiangXueJinModel.h"

@implementation JiangXueJinModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"totalProperty":@"totalProperty",
             @"message":@"message"
             };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data":[JiangXueJinDetailModel class]
             };
}

@end
