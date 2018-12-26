//
//  MyHomePageDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyHomePageDetailModel : NSObject

@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *membershipCatfegory;
@property(nonatomic,copy)NSString *favouredPolicy;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSNumber *titlID;
@property(nonatomic,copy)NSString *membershipCategoryText;
@property(nonatomic,copy)NSString *gender;

@property(nonatomic,copy)NSString *vipEndDate;

// 现金余额
@property(nonatomic,assign)double cashBalance;
// 奖学金
@property(nonatomic,assign)double scholarshipUsed;
@property(nonatomic,assign)double scholarshipSurplus;
@property(nonatomic,assign)double scholarshipSum;
// 信用额度
@property(nonatomic,assign)double creditLimitUsed;
@property(nonatomic,assign)double creditLimitSurplus;
@property(nonatomic,assign)double creditLimitTotal;



@end

NS_ASSUME_NONNULL_END
