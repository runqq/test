//
//  BanBenBiJiaoDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "BanBenBiJiaoDetailModel.h"

@implementation BanBenBiJiaoDetailModel

+(nullable NSDictionary<NSString *, id >*)modelCustomPropertyMapper{
    return @{
             @"createTime":@"data.createTime",
             @"appId":@"data.appId",
             @"downloadUrl":@"data.downloadUrl",
             @"name":@"data.name",
             @"osType":@"data.osType",
             @"remark":@"data.remark",
             @"bbId":@"data.id",
             @"version":@"data.version"
             };

}

@end
