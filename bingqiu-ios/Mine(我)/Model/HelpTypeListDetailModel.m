//
//  HelpTypeListDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HelpTypeListDetailModel.h"

@implementation HelpTypeListDetailModel

+(nonnull NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    return @{
             @"titleId":@"id"
             };
}

@end
