//
//  RequiredViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequiredModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RequiredViewModel : NSObject

-(void)getRequiredWithPageNum:(NSNumber *)pageNo  SizeNum:(NSNumber *)sizenum StrategyId:(NSNumber *)strategyId Success:(void(^)(RequiredModel *bdModel))success  Failture:(void(^)(RequiredModel *reqError))failture;

@end

NS_ASSUME_NONNULL_END
