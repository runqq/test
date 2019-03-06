//
//  BiSaiListViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/14.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BiSaiListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BiSaiListViewModel : NSObject

-(void)getBiSaiListWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize yearStr:(NSString *)yearss  MonthStr:(NSString  *)monthss Success:(void(^)(BiSaiListModel *biSaiModel))success  Failture:(void(^)(BiSaiListModel *biSaiError))failture;

@end

NS_ASSUME_NONNULL_END
