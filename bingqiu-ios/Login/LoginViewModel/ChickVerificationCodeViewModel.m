//
//  ChickVerificationCodeViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/12.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChickVerificationCodeViewModel.h"

@implementation ChickVerificationCodeViewModel


-(void)ChickVerificationCodeSuccess:(void (^)(ChickVerificationCodeModel * chickCodeModel))success Failture:(void (^)(ChickVerificationCodeModel * chickCodeModel))failture{
    
    NSString *strUrl = [interface stringByAppendingString:smsUrl];
    NSDictionary *pargma = @{
                             @"mobile":self.phoneNumber,
                             @"userType":@"GUARDIAN",
                             @"sms":self.yanZhengMaStr
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        ChickVerificationCodeModel *chickCodeModel = [ChickVerificationCodeModel yy_modelWithDictionary:responseObject];
        success(chickCodeModel);
        
    } FailureBlock:^(id errorResponseObject) {
        ChickVerificationCodeModel *chickCodeModel = [ChickVerificationCodeModel yy_modelWithDictionary:errorResponseObject];
        failture(chickCodeModel);
        
    }];
    
}


@end
