//
//  MyModelModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyModelModel.h"

@implementation MyModelModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"totalProperty":@"totalProperty",
             @"message":@"message"
             };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data":[MyModelDetailModel class]
             };
}


@end
