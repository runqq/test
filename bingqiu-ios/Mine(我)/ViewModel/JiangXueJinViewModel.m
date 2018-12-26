//
//  JiangXueJinViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiangXueJinViewModel.h"

@implementation JiangXueJinViewModel

-(void)getJiangXueJinWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize Success:(void (^)(JiangXueJinModel * jxjModel))success Failture:(void (^)(JiangXueJinModel * jxjError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:jxjUrl];
    NSDictionary *pargma = @{
                             @"pageNo":pageNo,
                             @"pageSize":pageSize
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        JiangXueJinModel *jxjModel = [JiangXueJinModel yy_modelWithDictionary:responseObject];
        success(jxjModel);
        
    } FailureBlock:^(id errorResponseObject) {
        JiangXueJinModel *jxjError = [JiangXueJinModel yy_modelWithDictionary:errorResponseObject];
        success(jxjError);
        
    }];
    
}

@end
