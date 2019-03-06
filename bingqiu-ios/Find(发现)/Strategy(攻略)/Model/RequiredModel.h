//
//  RequiredModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequiredDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RequiredModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,strong)NSMutableArray <RequiredDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
