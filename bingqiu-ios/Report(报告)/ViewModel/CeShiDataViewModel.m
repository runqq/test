//
//  CeShiDataViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/14.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CeShiDataViewModel.h"

@implementation CeShiDataViewModel

-(void)getCeShiDataWithPageNum:(NSNumber *)pageNo pagesize:(NSNumber *)pagesizeNum yearStr:(NSString *)yearss MonthStr:(NSString *)monthss Success:(void (^)(CeShiDataModel * ceShiModel))success Failture:(void (^)(CeShiDataModel * ceShiError))failture{
    
    NSString  *allTimeStr;
    // 拼接字符串
    if ([monthss isEqualToString:@""]) {
        
        allTimeStr = [NSString stringWithFormat:@"%@%@",yearss,monthss];
    }else{
        
        allTimeStr = [NSString stringWithFormat:@"%@-%@",yearss,monthss];
    }
    NSString *strUrl = [interface stringByAppendingString:ceShiDataUrl];
    NSDictionary *pargram =@{
                             @"pageNo":pageNo,
                             @"pageSize":pagesizeNum,
                             @"screeningTime":allTimeStr
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargram SuccessBlock:^(id responseObject) {
        
        CeShiDataModel *ceshiModel = [CeShiDataModel yy_modelWithDictionary:responseObject];
        success(ceshiModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        CeShiDataModel *ceShiError = [CeShiDataModel yy_modelWithDictionary:errorResponseObject];
        failture(ceShiError);
        
    }];
    
}

@end
