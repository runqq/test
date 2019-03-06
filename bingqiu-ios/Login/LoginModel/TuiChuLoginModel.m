//
//  TuiChuLoginModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TuiChuLoginModel.h"

@implementation TuiChuLoginModel

+(nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             @"success":@"success",
             @"message":@"message"
             };
    
}

@end
