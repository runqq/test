//
//  ListDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ListDetailModel.h"

@implementation ListDetailModel

//处理转换id问题
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"titleID":@"id",
             };
}
@end
