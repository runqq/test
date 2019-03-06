//
//  StrategyViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/1.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StategyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StrategyViewModel : NSObject

-(void)getBannerPhotoSuccess:(void(^)(StategyModel *Mmodel))success  Failture:(void(^)(StategyModel *errorModel))failture;

@end

NS_ASSUME_NONNULL_END
