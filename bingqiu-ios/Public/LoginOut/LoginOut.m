

//
//  LoginOut.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "LoginOut.h"

@implementation LoginOut

+(void)OutSuccess:(void(^)(TuiChuLoginModel  *tuichumm))success Failture:(void(^)(TuiChuLoginModel *err_tuichumm))failture{
    
    NSString *strUrl = [interface stringByAppendingString:tuiChuLoginUrl];
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        
        TuiChuLoginModel *tuiChuLoginModel = [TuiChuLoginModel yy_modelWithDictionary:responseObject];
        [User_Default setValue:nil forKey:@"myjsession"];
        success(tuiChuLoginModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        TuiChuLoginModel *tuiChuLoginError = [TuiChuLoginModel yy_modelWithDictionary:errorResponseObject];
        failture(tuiChuLoginError);
    }];
}

@end
