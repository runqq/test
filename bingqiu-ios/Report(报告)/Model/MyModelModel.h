//
//  MyModelModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyModelDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyModelModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSMutableArray <MyModelDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
