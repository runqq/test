//
//  HotModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/5.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HotDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HotModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,strong)NSMutableArray <HotDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
