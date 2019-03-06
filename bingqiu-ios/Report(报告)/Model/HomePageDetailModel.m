//
//  HomePageDetailModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HomePageDetailModel.h"

@implementation HomePageDetailModel

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"birthday":@"data.birthday",
             @"teamName":@"data.teamName",
             @"no":@"data.no",
             @"matchNumTeam":@"data.matchNumTeam",
             @"clubName":@"data.clubName",
             @"trainNum":@"data.trainNum",
             @"titleID":@"data.id",
             @"matchAssistNum":@"data.matchAssistNum",
             @"maxHeartRate":@"data.maxHeartRate",
             @"height":@"data.height",
             @"bodyMassFactor":@"data.bodyMassFactor",
             @"photo":@"data.photo",
             @"weight":@"data.weight",
             @"heatRate":@"data.heatRate",
             @"trainAllDistance":@"data.trainAllDistance",
             @"matchScore":@"data.matchScore",
             @"matchNum":@"data.matchNum",
             @"name":@"data.name",
             @"position":@"data.position",
             @"matchGoalNum":@"data.matchGoalNum",
             @"age":@"data.age",
             @"trainUpTime":@"data.trainUpTime",
             @"matchPunishTime":@"data.matchPunishTime",
             @"matchUpTime":@"data.matchUpTime"
             };
}


@end
