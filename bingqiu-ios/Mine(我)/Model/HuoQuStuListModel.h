//
//  HuoQuStuListModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HuoQuStuListDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HuoQuStuListModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,strong)NSMutableArray <HuoQuStuListDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
