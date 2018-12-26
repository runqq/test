//
//  BecomeVIPDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "BecomeVIPDetailModel.h"

@implementation BecomeVIPDetailModel
+(nonnull NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    return @{
             @"name":@"name",
             @"price":@"price",
             @"productId":@"productId",
             @"promotionId":@"promotionId",
             @"promotionPrice":@"promotionPrice",
             @"aveMonthlyAmount":@"aveMonthlyAmount"
            };
    
}
@end
