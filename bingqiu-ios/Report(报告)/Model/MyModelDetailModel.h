//
//  MyModelDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyModelDetailModel : NSObject

@property(nonatomic,strong)NSMutableArray <DetailModel *> *distanceList;
@property(nonatomic,strong)NSMutableArray <DetailModel *> *secondsList;
@property(nonatomic,copy)NSString *medalType;
@property(nonatomic,copy)NSString *medalTypeText;

@end

NS_ASSUME_NONNULL_END
