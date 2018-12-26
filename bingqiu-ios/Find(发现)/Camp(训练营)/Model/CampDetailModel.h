//
//  CampDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CampDetailModel : NSObject

@property(nonatomic,assign)NSNumber *recordNum;
@property(nonatomic,assign)NSNumber *titleID;
@property(nonatomic,copy)NSString   *photo;
@property(nonatomic,copy)NSString   *subName;
@property(nonatomic,copy)NSString   *name;
@property(nonatomic,assign)NSNumber *cutDays;

@property(nonatomic,copy)NSString *signStatus;
@property(nonatomic,copy)NSString *recordEndDate;

@end

NS_ASSUME_NONNULL_END
