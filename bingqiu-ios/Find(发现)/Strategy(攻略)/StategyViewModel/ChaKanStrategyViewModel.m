//
//  ChaKanStrategyViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChaKanStrategyViewModel.h"

@implementation ChaKanStrategyViewModel

-(void)getChaKanStrategyWithStrategyId:(NSNumber *)strategyid Success:(void (^)(ChaKanStrategyModel * chaKanStrategyModel))success Failture:(void (^)(ChaKanStrategyModel * chaKanStrategyError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:chaKanGongLueUrl];
    NSDictionary *pargma = @{
                             @"id":strategyid
                             };
    [HttpTool PostHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        ChaKanStrategyModel *chaKanStrategyModel = [ChaKanStrategyModel yy_modelWithDictionary:responseObject];
        success(chaKanStrategyModel);
        
    } FailureBlock:^(id errorResponseObject) {
        ChaKanStrategyModel *chaKanStrategyError = [ChaKanStrategyModel yy_modelWithDictionary:errorResponseObject];
        failture(chaKanStrategyError);
        
    }];
    
}

@end
