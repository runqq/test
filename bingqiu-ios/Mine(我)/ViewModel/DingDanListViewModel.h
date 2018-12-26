//
//  DingDanListViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DingDanList.h"

NS_ASSUME_NONNULL_BEGIN

@interface DingDanListViewModel : NSObject

-(void)getDingDanListDataSuccess:(void(^)(DingDanList *dingDanListModel))success Failture:(void(^)(DingDanList *dingDanListError))failture;

@end

NS_ASSUME_NONNULL_END
