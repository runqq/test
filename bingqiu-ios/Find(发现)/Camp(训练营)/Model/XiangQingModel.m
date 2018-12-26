//
//  XiangQingModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XiangQingModel.h"

@implementation XiangQingModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"message":@"message"
             };
}

//+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
//    return @{
//             @"data": [MyDetailModel class]
//             };
//}

@end
