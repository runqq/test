//
//  JiaoYiXiangQingModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JiaoYiXiangQingModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSMutableDictionary *data;

@end

NS_ASSUME_NONNULL_END
