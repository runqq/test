//
//  JiaoYiXiangQingDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiaoYiXiangQingDetailModel.h"

@implementation JiaoYiXiangQingDetailModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{
             @"amount":@"data.amount",
             @"clubName":@"data.clubName",
             @"iceStadiumName":@"data.iceStadiumName",
             @"memberName":@"data.memberName",
             @"accountRecordType":@"data.accountRecordType",
             @"membershipCategoryText":@"data.membershipCategoryText",
             @"rechargeType":@"data.rechargeType",
             @"cardType":@"data.cardType",
             @"billDate":@"data.billDate",
             @"courseAdvisor":@"data.courseAdvisor",
             @"isFirstText":@"data.isFirstText",
             @"auditTime":@"data.auditTime"
 
             };
    
}

@end
