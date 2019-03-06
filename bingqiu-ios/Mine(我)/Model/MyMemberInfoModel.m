//
//  MyMemberInfoModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyMemberInfoModel.h"

@implementation MyMemberInfoModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"success":@"success",
             @"message":@"message",
             };
}

@end
