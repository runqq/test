//
//  ChaKanStrategyDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChaKanStrategyDetailModel : NSObject

@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *attention;
@property(nonatomic,assign)NSNumber *titleId;
@property(nonatomic,copy)NSString *suitIntro;

@end

NS_ASSUME_NONNULL_END
