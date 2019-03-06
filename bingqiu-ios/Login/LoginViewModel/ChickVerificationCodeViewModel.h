//
//  ChickVerificationCodeViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/12.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChickVerificationCodeModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface ChickVerificationCodeViewModel : NSObject

@property(nonatomic , copy)NSString  *yanZhengMaStr;
@property(nonatomic , copy)NSString  *phoneNumber;

-(void)ChickVerificationCodeSuccess:(void(^)(ChickVerificationCodeModel  *chickCodeModel))success  Failture:(void(^)(ChickVerificationCodeModel  *chickCodeModel))failture;

@end

NS_ASSUME_NONNULL_END
