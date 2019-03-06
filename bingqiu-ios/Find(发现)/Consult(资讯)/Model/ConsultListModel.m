//
//  ConsultListModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ConsultListModel.h"

@implementation ConsultListModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"totalProperty":@"totalProperty"
             };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data": [ListDetailModel class]
             };
}

@end
