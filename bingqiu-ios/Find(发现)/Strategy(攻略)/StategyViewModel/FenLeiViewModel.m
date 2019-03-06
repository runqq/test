//
//  FenLeiViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FenLeiViewModel.h"

@implementation FenLeiViewModel

-(void)getFenLeiWithPageNum:( NSInteger )pageNo SizeNum:( NSInteger )sizenum strategyType:(NSString *)strategyType Success:(void (^)(FenLeiModel * flModel))success Failture:(void (^)(FenLeiModel * flError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:feiLeiPort];
    NSDictionary  *pargram = @{
                               @"pageNo":@(pageNo),
                               @"pageSize":@(sizenum),
                               @"strategyType":strategyType
                               };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargram SuccessBlock:^(id responseObject) {
        FenLeiModel *fenLei = [FenLeiModel yy_modelWithDictionary:responseObject];
        success(fenLei);
    } FailureBlock:^(id errorResponseObject) {
        
        FenLeiModel *errModel = [FenLeiModel yy_modelWithDictionary:errorResponseObject];
        failture(errModel);
    }];
}

@end
