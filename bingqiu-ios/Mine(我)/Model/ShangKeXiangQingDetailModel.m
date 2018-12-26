//
//  ShangKeXiangQingDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ShangKeXiangQingDetailModel.h"

@implementation ShangKeXiangQingDetailModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             @"secondCoach":@"data.secondCoach",
             @"firstCoach":@"data.firstCoach",
             @"iceStadium":@"data.iceStadium",
             @"name":@"data.name",
             @"startTime":@"data.startTime",
             @"endTime":@"data.endTime",
             @"courseTime":@"data.courseTime",
             @"courseLength":@"data.courseLength",
             @"titleId":@"data.id"
             
             };
    
}

@end
