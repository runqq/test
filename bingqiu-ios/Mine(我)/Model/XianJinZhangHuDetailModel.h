//
//  XianJinZhangHuDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HuiZongListDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XianJinZhangHuDetailModel : NSObject

@property(nonatomic,copy)NSString *dateGrouping;
@property(nonatomic,strong)NSMutableArray <HuiZongListDetailModel *>*accountRecords;
@property(nonatomic,copy)NSString *income;

@end

NS_ASSUME_NONNULL_END
