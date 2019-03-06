//
//  BecomeVIPModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BecomeVIPDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BecomeVIPModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,assign)NSNumber *totalProperty;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSMutableArray <BecomeVIPDetailModel *> *data;

@end

NS_ASSUME_NONNULL_END
