//
//  CampBaoMingModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CampBaoMingModel.h"

@implementation CampBaoMingModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             @"success":@"success",
             @"message":@"message"
             };
}

@end
