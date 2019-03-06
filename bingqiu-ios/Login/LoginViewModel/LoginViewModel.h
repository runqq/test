//
//  LoginViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/9.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewModel : NSObject

@property(nonatomic , copy)NSString  *phoneNumber;
@property(nonatomic , copy)NSString  *passWordNumber;

-(void)getLoginDataSuccess:(void(^)(LoginModel *loginModel))success Failture:(void(^)(LoginModel *loginModel))failture;

@end

NS_ASSUME_NONNULL_END
