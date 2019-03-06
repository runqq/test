//
//  HelpListModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelpListDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HelpListModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSMutableArray  <HelpListDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
