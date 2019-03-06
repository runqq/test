//
//  ConsultListModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConsultListModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,strong)NSMutableArray <ListDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
