//
//  FenLeiModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FenLeiModel.h"

@implementation FenLeiModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"totalProperty":@"totalProperty"
             };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data": [FenLeiDetailModel class]
             };
}

@end
