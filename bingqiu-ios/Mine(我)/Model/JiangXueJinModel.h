//
//  JiangXueJinModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JiangXueJinDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JiangXueJinModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSMutableArray <JiangXueJinDetailModel *>*data;


@end

NS_ASSUME_NONNULL_END
