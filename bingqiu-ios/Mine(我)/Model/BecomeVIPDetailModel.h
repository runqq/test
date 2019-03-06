//
//  BecomeVIPDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BecomeVIPDetailModel : NSObject

@property(nonatomic,copy)NSString *name; // 商品名称
@property(nonatomic,assign)double price; // 价格
@property(nonatomic,assign)NSNumber *productId; // vipID
@property(nonatomic,assign)NSNumber *promotionId; // 促销ID
@property(nonatomic,assign)NSNumber *promotionPrice; // 折扣后价格
@property(nonatomic,assign)double aveMonthlyAmount; // 每月平均

@end

NS_ASSUME_NONNULL_END
