//
//  ChickVerificationCodeModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/12.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChickVerificationCodeModel.h"

@implementation ChickVerificationCodeModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             @"success" : @"success",
             @"message" : @"message"
             };
}

@end
