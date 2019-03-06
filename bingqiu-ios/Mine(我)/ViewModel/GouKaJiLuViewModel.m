//
//  GouKaJiLuViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "GouKaJiLuViewModel.h"

@implementation GouKaJiLuViewModel

-(void)getShangKeJiLuWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize memberId:(NSNumber *)memberId Success:(void (^)(GouKaJiLuModel * gkjlModel))success Failture:(void (^)(GouKaJiLuModel * gkjlError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:gkjlUrl];
    NSDictionary *pargma = @{
                             @"pageNo":pageNo,
                             @"pageSize":pageSize,
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        GouKaJiLuModel *gkjlModel = [GouKaJiLuModel yy_modelWithDictionary:responseObject];
        success(gkjlModel);
        
    } FailureBlock:^(id errorResponseObject) {
        GouKaJiLuModel *gkjlError = [GouKaJiLuModel yy_modelWithDictionary:errorResponseObject];
        success(gkjlError);
        
    }];
}

@end
