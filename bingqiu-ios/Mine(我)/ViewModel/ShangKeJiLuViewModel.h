//
//  ShangKeJiLuViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShangKeJiLuModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShangKeJiLuViewModel : NSObject

-(void)getShangKeJiLuWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize yearStr:(NSString *)yearss  MonthStr:(NSString  *)monthss Success:(void(^)(ShangKeJiLuModel *skjlModel))success  Failture:(void(^)(ShangKeJiLuModel *skjlError))failture;

@end

NS_ASSUME_NONNULL_END
