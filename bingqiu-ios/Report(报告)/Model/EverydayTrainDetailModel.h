//
//  EverydayTrainDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/14.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EverydayTrainDetailModel : NSObject

@property(nonatomic,copy)NSString *courseName;
@property(nonatomic,copy)NSString *trainTime;
@property(nonatomic,assign)NSNumber *allDistance;
@property(nonatomic,copy)NSString *iceStadium;
@property(nonatomic,copy)NSString *startTime;
@property(nonatomic,copy)NSString *coach;
@property(nonatomic,assign)NSNumber *titleID;

@end

NS_ASSUME_NONNULL_END
