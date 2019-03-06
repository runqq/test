//
//  HomePageDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomePageDetailModel : NSObject

@property(nonatomic,copy)NSString   *birthday;
@property(nonatomic,copy)NSString   *photo;
@property(nonatomic,copy)NSString   *name;
@property(nonatomic,copy)NSString   *trainUpTime;
@property(nonatomic,copy)NSString   *matchPunishTime;
@property(nonatomic,copy)NSString   *matchUpTime;

// 下面的之前是nsnumber类型
@property(nonatomic,assign)NSNumber *trainNum;
@property(nonatomic,assign)NSNumber *titleID;
@property(nonatomic,assign)NSNumber *matchAssistNum;
@property(nonatomic,assign)NSNumber *maxHeartRate;
@property(nonatomic,assign)NSNumber *height;
@property(nonatomic,assign)NSNumber *bodyMassFactor;
@property(nonatomic,assign)NSNumber *weight;
@property(nonatomic,assign)NSNumber *heatRate;
@property(nonatomic,assign)NSNumber *matchScore;
@property(nonatomic,assign)NSNumber *matchNum;
@property(nonatomic,copy)NSString *trainAllDistance;
@property(nonatomic,copy)NSString *matchGoalNum;
@property(nonatomic,assign)NSNumber *age;

// 球队信息
@property(nonatomic,copy)NSString   *position;
@property(nonatomic,copy)NSString   *no;
@property(nonatomic,assign)NSNumber *matchNumTeam;
@property(nonatomic,copy)NSString   *teamName;
@property(nonatomic,copy)NSString   *clubName;

@end

NS_ASSUME_NONNULL_END
