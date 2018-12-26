//
//  AllStrategyModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllStraDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllStrategyModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,strong)NSMutableArray <AllStraDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
