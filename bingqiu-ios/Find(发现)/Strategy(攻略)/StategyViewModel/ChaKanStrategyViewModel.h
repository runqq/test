//
//  ChaKanStrategyViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChaKanStrategyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChaKanStrategyViewModel : NSObject

-(void)getChaKanStrategyWithStrategyId:(NSNumber *)strategyid Success:(void(^)(ChaKanStrategyModel *chaKanStrategyModel))success  Failture:(void(^)(ChaKanStrategyModel *chaKanStrategyError))failture;

@end

NS_ASSUME_NONNULL_END
