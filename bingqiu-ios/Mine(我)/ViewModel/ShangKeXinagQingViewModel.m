//
//  ShangKeXinagQingViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ShangKeXinagQingViewModel.h"

@implementation ShangKeXinagQingViewModel

-(void)getShangKeXiangQingWithCourseId:(NSNumber *)courseId Success:(void (^)(ShangKeXiangQingModel * skxqModel))success Failture:(void (^)(ShangKeXiangQingModel * skxqError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:skxqUrl];
    NSDictionary *pargma = @{
                             @"courseId":courseId
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        ShangKeXiangQingModel *skxqModel = [ShangKeXiangQingModel yy_modelWithDictionary:responseObject];
        success(skxqModel);
        
    } FailureBlock:^(id errorResponseObject) {
        ShangKeXiangQingModel *skxqError = [ShangKeXiangQingModel yy_modelWithDictionary:errorResponseObject];
        failture(skxqError);
    
    }];
    
}

@end
