//
//  TouSuModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TouSuModel.h"

@implementation TouSuModel

+(nullable NSDictionary<NSString *, id >*)modelCustomPropertyMapper{
    return @{
             @"success":@"success",
             @"message":@"message"
             };
}

@end
