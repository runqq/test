//
//  EverydayTrainModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EverydayTrainDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EverydayTrainModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,strong)NSMutableArray <EverydayTrainDetailModel *>*data;


@end

NS_ASSUME_NONNULL_END
