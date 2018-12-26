//
//  VideoModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    return @{@"success":@"success",
             @"totalProperty":@"totalProperty"
             };
}
+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{
             @"data": [VideoDetailModel class]
             };
}

@end
