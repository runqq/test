//
//  EverdayTrainViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EverydayTrainModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EverdayTrainViewModel : NSObject

-(void)getEveryDatTrainWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize yearStr:(NSString *)yearss  MonthStr:(NSString  *)monthss Success:(void(^)(EverydayTrainModel *everyDayTrainModel))success  Failture:(void(^)(EverydayTrainModel *everyDayTrainError))failture;

@end

NS_ASSUME_NONNULL_END
