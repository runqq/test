//
//  LoginViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/9.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

-(void)getLoginDataSuccess:(void (^)(LoginModel * loginModel))success Failture:(void (^)(LoginModel * loginModel))failture{
    NSString  *urlStr = [interface stringByAppendingString:loginUrl];
    NSDictionary *pargram = @{
                          @"mobile":self.phoneNumber,
                          @"password":[Encryption md5:self.passWordNumber],// 加密后的密码 e10adc3949ba59abbe56e057f20f883e
                          @"userType":@"GUARDIAN"
                              };
//    BQLog(@"手机号：%@,加密后密码：%@",pargram[@"mobile"],pargram[@"password"])
    [HttpTool GetHttpDataWithUrlStr:urlStr Dic:pargram SuccessBlock:^(id responseObject) {
        
        LoginModel *loginModel = [LoginModel yy_modelWithDictionary:responseObject];
        success(loginModel);
    } FailureBlock:^(id errorResponseObject) {
        
        LoginModel *loginModel = [LoginModel yy_modelWithDictionary:errorResponseObject];
        failture(loginModel);
    }];
}

@end
