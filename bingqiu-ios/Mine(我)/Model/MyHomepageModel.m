//
//  MyHomepageModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyHomepageModel.h"

@implementation MyHomepageModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"message":@"message"
             };
}

//+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
//    return @{
//             @"data": [MyHomePageDetailModel class]
//             };
//}

@end
