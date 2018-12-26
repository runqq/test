//
//  LoginOut.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TuiChuLoginModel.h"

NS_ASSUME_NONNULL_BEGIN


@interface LoginOut : NSObject

+(void)OutSuccess:(void(^)(TuiChuLoginModel  *tuichumm))success Failture:(void(^)(TuiChuLoginModel *err_tuichumm))failture;

@end

NS_ASSUME_NONNULL_END
