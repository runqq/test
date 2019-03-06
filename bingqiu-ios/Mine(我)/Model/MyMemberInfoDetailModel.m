//
//  MyMemberInfoDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyMemberInfoDetailModel.h"

@implementation MyMemberInfoDetailModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             
             @"birthday"        :@"data.birthday",
             @"no"              :@"data.no",
             @"guardianName"    :@"data.guardianName",
             @"titleID"         :@"data.id",
             @"height"          :@"data.height",
             @"photo"           :@"data.photo",
             @"weight"          :@"data.weight",
             @"heatRate"        :@"data.heatRate",
             @"bindMobile"      :@"data.bindMobile",
             @"name"            :@"data.name",
             @"position"        :@"data.position",
             @"membershipCategoryText":@"data.membershipCategoryText",
             @"genderText"      :@"data.genderText",
             
             };
    
}

@end
