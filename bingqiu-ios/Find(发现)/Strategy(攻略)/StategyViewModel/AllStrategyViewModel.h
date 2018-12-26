//
//  AllStrategyViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllStrategyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AllStrategyViewModel : NSObject

-(void)getAllStrategySuccess:(void(^)(AllStrategyModel *glModel))success  Failture:(void(^)(AllStrategyModel  *glError))failture;


@end

NS_ASSUME_NONNULL_END
