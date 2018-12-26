//
//  GouKaJiLuDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GouKaJiLuDetailModel : NSObject

@property(nonatomic,copy)NSString *cardName;
@property(nonatomic,assign)NSNumber *usedClassNum;
@property(nonatomic,assign)NSNumber *classNum;
@property(nonatomic,copy)NSString *cardNo;
@property(nonatomic,assign)NSNumber *price;
@property(nonatomic,copy)NSString *buyTime;
@property(nonatomic,copy)NSString *cardTypeText;
@property(nonatomic,copy)NSString *cardStateText;
@property(nonatomic,assign)NSNumber *surplusNum;

@end

NS_ASSUME_NONNULL_END
