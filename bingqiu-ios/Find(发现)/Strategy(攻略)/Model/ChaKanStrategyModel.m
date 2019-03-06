//
//  ChaKanStrategyModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChaKanStrategyModel.h"

@implementation ChaKanStrategyModel

+(nonnull NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             @"success":@"success",
             @"message":@"message",
             @"data":@"data"
             };
}

@end
