//
//  StategyModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/1.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "StategyModel.h"

@implementation StategyModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"message":@"message",
             @"data":@"data"
             };
}
//+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
//    return @{
//             @"data": [StategyModel class]
//             };
//}

@end
