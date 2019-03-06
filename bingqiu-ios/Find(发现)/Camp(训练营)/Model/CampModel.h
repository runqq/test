//
//  CampModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CampDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CampModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,strong)NSMutableArray <CampDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
