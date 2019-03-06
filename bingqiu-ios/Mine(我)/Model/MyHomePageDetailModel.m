//
//  MyHomePageDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyHomePageDetailModel.h"

@implementation MyHomePageDetailModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             @"photo"                   :@"data.photo",
             @"membershipCategory"      :@"data.membershipCategory",
             @"favouredPolicy"          :@"data.favouredPolicy",
             @"name"                    :@"data.name",
             @"membershipCategoryText"  :@"data.membershipCategoryText",
             @"creditLimitUsed"         :@"data.creditLimitUsed",
             @"creditLimitSurplus"      :@"data.creditLimitSurplus",
             @"scholarshipUsed"         :@"data.scholarshipUsed",
             @"cashBalance"             :@"data.cashBalance",
             @"scholarshipSurplus"      :@"data.scholarshipSurplus",
             @"scholarshipSum"          :@"data.scholarshipSum",
             @"titlID"                  :@"data.id",
             @"creditLimitTotal"        :@"data.creditLimitTotal",
             @"gender"                  :@"gender",
             @"vipEndDate"              :@"data.vipEndDate"
             };
}

@end
