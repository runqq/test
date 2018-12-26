//
//  MyDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyDetailModel.h"

@implementation MyDetailModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             @"dayHours"    :@"data.dayHours",
             @"remark"      :@"data.remark",
             @"recordNum"   :@"data.recordNum",
             @"content"     :@"data.content",
             @"amIntro"     :@"data.amIntro",
             @"upFlag"      :@"data.upFlag",
             @"price"       :@"data.price",
             @"pmIntro"     :@"data.pmIntro",
             @"suitIntro"   :@"data.suitIntro",
             @"address"     :@"data.address",
             @"mobile"      :@"data.mobile",
             @"photo"       :@"data.photo",
             @"createTime"  :@"data.createTime",
             @"subName"     :@"data.subName",
             @"name"        :@"data.name",
             @"attention"   :@"data.attention",
             @"trainingDate":@"data.trainingDate",
             @"signDate"    :@"data.signDate",
             @"totalDuration":@"data.totalDuration",
             
             @"titleID"     :@"data.id",
             
             };
    
}

@end
