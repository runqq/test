//
//  JiaoYIXiangQingViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiaoYIXiangQingViewModel.h"

@implementation JiaoYIXiangQingViewModel

-(void)getJiaoYiXiangQingWithTitleId:(NSNumber *)titleId Success:(void (^)(JiaoYiXiangQingModel * jyxqlModel))success Failture:(void (^)(JiaoYiXiangQingModel * jyxqError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:xiangXiXinXiUrl];
    NSDictionary *pargma = @{
                             @"id":titleId
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        
        JiaoYiXiangQingModel *jyxqModel = [JiaoYiXiangQingModel yy_modelWithDictionary:responseObject];
        success(jyxqModel);
        
    } FailureBlock:^(id errorResponseObject) {
        JiaoYiXiangQingModel *jyxqError = [JiaoYiXiangQingModel yy_modelWithDictionary:errorResponseObject];
        failture(jyxqError);
    }];
    
}

@end
