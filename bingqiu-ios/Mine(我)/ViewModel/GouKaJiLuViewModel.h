//
//  GouKaJiLuViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GouKaJiLuModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GouKaJiLuViewModel : NSObject

-(void)getShangKeJiLuWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize memberId:(NSNumber *)memberId Success:(void(^)(GouKaJiLuModel *gkjlModel))success  Failture:(void(^)(GouKaJiLuModel *gkjlError))failture;

@end

NS_ASSUME_NONNULL_END
