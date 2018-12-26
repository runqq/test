//
//  BiSaiListViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/14.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "BiSaiListViewModel.h"

@implementation BiSaiListViewModel

-(void)getBiSaiListWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize yearStr:(NSString *)yearss  MonthStr:(NSString  *)monthss Success:(void (^)(BiSaiListModel * biSaiModel))success Failture:(void (^)(BiSaiListModel * biSaiError))failture{
    
    NSString  *allTimeStr;
    // 拼接字符串
    if ([monthss isEqualToString:@""]) {
        
        allTimeStr = [NSString stringWithFormat:@"%@%@",yearss,monthss];
    }else{
        
        allTimeStr = [NSString stringWithFormat:@"%@-%@",yearss,monthss];
    }
    
    
    NSString *strUrl = [interface stringByAppendingString:biSaiListUrl];
    NSDictionary *pargma = @{
                             @"pageNo":pageNo,
                             @"pageSize":pageSize,
                             @"month":allTimeStr
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        
        BiSaiListModel *biSaiModel = [BiSaiListModel yy_modelWithDictionary:responseObject];
        success(biSaiModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        BiSaiListModel *biSaiError = [BiSaiListModel yy_modelWithDictionary:errorResponseObject];
        failture(biSaiError);
        
    }];
    
}

@end
