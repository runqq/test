//
//  ShangKeJiLuDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShangKeJiLuDetailModel : NSObject

@property(nonatomic,copy)NSString *courseName;
@property(nonatomic,copy)NSString *cardName;
@property(nonatomic,copy)NSString *iceStadiumTitle;
@property(nonatomic,assign)NSNumber *cardId;
@property(nonatomic,copy)NSString *startTime;
@property(nonatomic,copy)NSString *consumption;

@property(nonatomic,assign)NSNumber *courseId;

@end

NS_ASSUME_NONNULL_END
