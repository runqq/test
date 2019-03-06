//
//  ConsultModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsultDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConsultModel : NSObject

@property(nonatomic , assign)BOOL  success;
@property(nonatomic , assign)NSNumber  *totalProperty;
@property(nonatomic , copy)NSString *message;
@property(nonatomic , strong)NSMutableArray <ConsultDetailModel *>*data;

@end

NS_ASSUME_NONNULL_END
