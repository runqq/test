//
//  TuiChuLoginViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TuiChuLoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TuiChuLoginViewModel : NSObject

-(void)getTuiChuLoginSuccess:(void(^)(TuiChuLoginModel *tuiChuLoginModel))success Failture:(void(^)(TuiChuLoginModel *tuiChuLoginError))failture;

@end

NS_ASSUME_NONNULL_END
