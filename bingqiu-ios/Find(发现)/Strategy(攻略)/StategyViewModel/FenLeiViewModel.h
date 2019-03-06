//
//  FenLeiViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FenLeiModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FenLeiViewModel : NSObject

-(void)getFenLeiWithPageNum:( NSInteger )pageNo  SizeNum:( NSInteger)sizenum strategyType:(NSString *)strategyType Success:(void(^)(FenLeiModel *flModel))success  Failture:(void(^)(FenLeiModel *flError))failture;

@end

NS_ASSUME_NONNULL_END
