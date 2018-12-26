//
//  XianJinZhangHuModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XianJinZhangHuDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XianJinZhangHuModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSMutableArray <XianJinZhangHuDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
