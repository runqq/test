//
//  RequiredViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "RequiredViewModel.h"

@implementation RequiredViewModel

-(void)getRequiredWithPageNum:(NSNumber *)pageNo SizeNum:(NSNumber *)sizenum StrategyId:(NSNumber *)strategyId Success:(void (^)(RequiredModel * bdModel))success Failture:(void (^)(RequiredModel * bdError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:requiredUrl];
    NSDictionary *pargram = @{
                              @"pageNo":pageNo,
                              @"pageSize":sizenum,
                              @"strategyId":strategyId
                              };
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargram SuccessBlock:^(id responseObject) {
        RequiredModel *reqModel = [RequiredModel yy_modelWithDictionary:responseObject];
        success(reqModel);
    } FailureBlock:^(id errorResponseObject) {
        RequiredModel *errModel = [RequiredModel yy_modelWithDictionary:errorResponseObject];
        success(errModel);
    }];
    
}


@end
