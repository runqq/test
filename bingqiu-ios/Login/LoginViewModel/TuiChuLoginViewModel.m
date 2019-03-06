//
//  TuiChuLoginViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TuiChuLoginViewModel.h"

@implementation TuiChuLoginViewModel

-(void)getTuiChuLoginSuccess:(void (^)(TuiChuLoginModel * tuiChuLoginModel))success Failture:(void (^)(TuiChuLoginModel * tuiChuLoginError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:tuiChuLoginUrl];
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        TuiChuLoginModel *tuiChuLoginModel = [TuiChuLoginModel yy_modelWithDictionary:responseObject];
        success(tuiChuLoginModel);
        
    } FailureBlock:^(id errorResponseObject) {
        TuiChuLoginModel *tuiChuLoginError = [TuiChuLoginModel yy_modelWithDictionary:errorResponseObject];
        failture(tuiChuLoginError);
    }];
    
}

@end
