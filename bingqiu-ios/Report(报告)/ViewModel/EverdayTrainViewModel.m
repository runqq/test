//
//  EverdayTrainViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "EverdayTrainViewModel.h"

@implementation EverdayTrainViewModel

-(void)getEveryDatTrainWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize yearStr:(NSString *)yearss MonthStr:(NSString *)monthss Success:(void (^)(EverydayTrainModel * everyDayTrainModel))success Failture:(void (^)(EverydayTrainModel * everyDayTrainError))failture{
 
    NSString  *allTimeStr;
    // 拼接字符串
    if ([monthss isEqualToString:@""]) {
        
        allTimeStr = [NSString stringWithFormat:@"%@%@",yearss,monthss];
    }else{
        
        allTimeStr = [NSString stringWithFormat:@"%@-%@",yearss,monthss];
    }
    NSString *str = [interface stringByAppendingString:everyDayTrainUrl];
    NSDictionary *pargma = @{
                             @"pageNo":pageNo,
                             @"pageSize":pageSize,
                             @"screeningTime":allTimeStr
                             };
    [HttpTool GetHttpDataWithUrlStr:str Dic:pargma SuccessBlock:^(id responseObject) {
        
        EverydayTrainModel *everydayModel = [EverydayTrainModel yy_modelWithDictionary:responseObject];
        success(everydayModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        EverydayTrainModel *everydayError = [EverydayTrainModel yy_modelWithDictionary:errorResponseObject];
        failture(everydayError);
        
    }];
    
}

@end
