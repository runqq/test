//
//  ShangKeJiLuViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ShangKeJiLuViewModel.h"

@implementation ShangKeJiLuViewModel

-(void)getShangKeJiLuWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize yearStr:(NSString *)yearss MonthStr:(NSString *)monthss Success:(void (^)(ShangKeJiLuModel * skjlModel))success Failture:(void (^)(ShangKeJiLuModel * skjlError))failture{
    
    NSString  *allTimeStr;
    // 拼接字符串
    if ([monthss isEqualToString:@""]) {
        
        allTimeStr = [NSString stringWithFormat:@"%@%@",yearss,monthss];
    }else{
        
        allTimeStr = [NSString stringWithFormat:@"%@-%@",yearss,monthss];
    }
    
    NSString *str = [interface stringByAppendingString:skjlUrl];
    NSDictionary *pargma = @{
                             @"pageNo":pageNo,
                             @"pageSize":pageSize,
                             @"screeningTime":allTimeStr
                             };
    [HttpTool GetHttpDataWithUrlStr:str Dic:pargma SuccessBlock:^(id responseObject) {
        
        ShangKeJiLuModel *skjlModel = [ShangKeJiLuModel yy_modelWithDictionary:responseObject];
        success(skjlModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        ShangKeJiLuModel *skjlError = [ShangKeJiLuModel yy_modelWithDictionary:errorResponseObject];
        failture(skjlError);
        
    }];
    
    
}

@end
