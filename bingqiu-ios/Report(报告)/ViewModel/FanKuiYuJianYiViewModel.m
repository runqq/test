//
//  FanKuiYuJianYiViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FanKuiYuJianYiViewModel.h"

@implementation FanKuiYuJianYiViewModel

-(void)getFanKuiYuJianYiWithRemark:(NSString *)remark Type:(NSString *)type Success:(void (^)(FanKuiYuJianYiModel * fkModel))success Failture:(void (^)(FanKuiYuJianYiModel * fkError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:fanKuiYuJianYiUrl];
    NSDictionary *pargma = @{
                             @"remark":remark,
                             @"type":type
                             };
    [HttpTool PostHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        FanKuiYuJianYiModel *fkModel = [FanKuiYuJianYiModel yy_modelWithDictionary:responseObject];
        success(fkModel);
    } FailureBlock:^(id errorResponseObject) {
        FanKuiYuJianYiModel *fkError = [FanKuiYuJianYiModel yy_modelWithDictionary:errorResponseObject];
        failture(fkError);
    }];
    
}

@end
