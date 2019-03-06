//
//  WantToSeeModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/2.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WantToSeeDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WantToSeeModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,strong)NSMutableArray <WantToSeeDetailModel *>*data;


@end

NS_ASSUME_NONNULL_END
