//
//  QieHuanStudentModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "QieHuanStudentModel.h"

@implementation QieHuanStudentModel

+(nullable NSDictionary<NSString *, id>*)modelCustomPropertyMapper{
    return @{
             @"success":@"success",
             @"message":@"message"
             };
}

@end
