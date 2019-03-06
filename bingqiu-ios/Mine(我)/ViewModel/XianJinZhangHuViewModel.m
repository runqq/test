//
//  XianJinZhangHuViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XianJinZhangHuViewModel.h"

@implementation XianJinZhangHuViewModel


-(void)getXianJinZhangHuWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize accountRecordType:(NSString *)accountRecordType Success:(void (^)(XianJinZhangHuModel * xjzhModel))success Failture:(void (^)(XianJinZhangHuModel * xjzhError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:xjzhUrl];
    NSDictionary *pargma = @{
                             @"pageNo":pageNo,
                             @"pageSize":pageSize,
                             @"accountRecordType":accountRecordType
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        
        XianJinZhangHuModel *xjzhModel = [XianJinZhangHuModel yy_modelWithDictionary:responseObject];
        success(xjzhModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        XianJinZhangHuModel *xjzhError = [XianJinZhangHuModel yy_modelWithDictionary:errorResponseObject];
        failture(xjzhError);
        
    }];
    
    
}

@end
