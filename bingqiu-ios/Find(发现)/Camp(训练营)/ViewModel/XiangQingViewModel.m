//
//  XiangQingViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XiangQingViewModel.h"

@implementation XiangQingViewModel

-(void)getXiangQingWithID:(NSNumber *)campId Success:(void (^)(XiangQingModel * detailModel))success Failture:(void (^)(XiangQingModel * detailError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:xqUrl];
    NSDictionary *pargma = @{
                             @"id":campId
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        
        XiangQingModel *xqModel = [XiangQingModel yy_modelWithDictionary:responseObject];
        success(xqModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        XiangQingModel *xqError = [XiangQingModel yy_modelWithDictionary:errorResponseObject];
        failture(xqError);
        
    }];
    
}


@end
