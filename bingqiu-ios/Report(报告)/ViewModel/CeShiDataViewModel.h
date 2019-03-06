//
//  CeShiDataViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/14.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CeShiDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CeShiDataViewModel : NSObject

-(void)getCeShiDataWithPageNum:(NSNumber *)pageNo pagesize:(NSNumber *)pagesizeNum yearStr:(NSString *)yearss  MonthStr:(NSString  *)monthss Success:(void(^)(CeShiDataModel *ceShiModel))success  Failture:(void(^)(CeShiDataModel *ceShiError))failture;

@end

NS_ASSUME_NONNULL_END
