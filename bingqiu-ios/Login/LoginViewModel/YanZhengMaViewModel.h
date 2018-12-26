//
//  YanZhengMaViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/9.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YanZhengMaModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YanZhengMaViewModel : NSObject

@property(nonatomic , copy)NSString  *phoneNumber;

-(void)getDataWithSuccess:(void(^)(YanZhengMaModel *yzmModel))success Failture:(void(^)(YanZhengMaModel *yzmError))failture;

@end

NS_ASSUME_NONNULL_END
