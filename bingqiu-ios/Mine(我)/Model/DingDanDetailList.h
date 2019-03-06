//
//  DingDanDetailList.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DingDanDetailList : NSObject

@property(nonatomic,copy)NSString *usageState;
@property(nonatomic,copy)NSString *endDate;
@property(nonatomic,copy)NSString *memberName;
@property(nonatomic,copy)NSString *productName;
@property(nonatomic,copy)NSString *startDate;
@property(nonatomic,assign)NSNumber *productId;
@property(nonatomic,assign)NSNumber *memberId;

@end

NS_ASSUME_NONNULL_END
