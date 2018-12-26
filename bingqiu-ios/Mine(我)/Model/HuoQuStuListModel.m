//
//  HuoQuStuListModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HuoQuStuListModel.h"

@implementation HuoQuStuListModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"message":@"message",
             @"totalProperty":@"totalProperty"
             };
}
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data":[HuoQuStuListDetailModel class]
             };
}
@end
