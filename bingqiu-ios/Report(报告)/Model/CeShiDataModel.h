//
//  CeShiDataModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/14.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CeShiDataDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CeShiDataModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSMutableArray <CeShiDataDetailModel *>*data;


@end

NS_ASSUME_NONNULL_END
