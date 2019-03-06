//
//  JiangXueJInXiangQingViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiangXueJInXiangQingViewModel.h"

@implementation JiangXueJInXiangQingViewModel

-(void)getJiangXueJinXiangQingWithTitleId:(NSNumber *)titleId Success:(void (^)(JiangXueJInXiangQingModel * jxjDetailModel))success Failture:(void (^)(JiangXueJInXiangQingModel * jxjDetailError))failture{
    
    
    NSString *strUrl = [interface stringByAppendingString:jxjDetailUrl];
    NSDictionary *pargma = @{
                             @"id":titleId
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        
        JiangXueJInXiangQingModel *jxjDetailModel = [JiangXueJInXiangQingModel yy_modelWithDictionary:responseObject];
        success(jxjDetailModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        JiangXueJInXiangQingModel *jxjDetailError = [JiangXueJInXiangQingModel yy_modelWithDictionary:errorResponseObject];
        failture(jxjDetailError);
    }];
    
}

@end
