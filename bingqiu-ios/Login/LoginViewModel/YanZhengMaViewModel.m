//
//  YanZhengMaViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/9.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "YanZhengMaViewModel.h"

@implementation YanZhengMaViewModel

-(void)getDataWithSuccess:(void (^)(YanZhengMaModel * yzmModel))success Failture:(void (^)(YanZhengMaModel * yzmError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:yzmUrl];
    
    NSDictionary *pargma = @{
                             @"mobile":self.phoneNumber,
                             @"userType":@"GUARDIAN"
                             };
//    BQLog(@"传递的参数有:%@",pargma);
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        YanZhengMaModel *yzmModel = [YanZhengMaModel yy_modelWithDictionary:responseObject];
        success(yzmModel);
        
    } FailureBlock:^(id errorResponseObject) {
        YanZhengMaModel *yzmErr = [YanZhengMaModel yy_modelWithDictionary:errorResponseObject];
        failture(yzmErr);
        
    }];
    
}


@end
