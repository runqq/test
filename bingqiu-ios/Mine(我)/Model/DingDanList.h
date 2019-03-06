//
//  DingDanList.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DingDanDetailList.h"

NS_ASSUME_NONNULL_BEGIN

@interface DingDanList : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSMutableArray <DingDanDetailList *>*data;

@end

NS_ASSUME_NONNULL_END
