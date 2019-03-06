//
//  HomePageModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HomePageModel.h"

@implementation HomePageModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"message":@"message",
             };
}
//+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
//    return @{
//             @"data": [HomePageDetailModel class]
//             };
//}

@end
