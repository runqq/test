//
//  IsVipViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/27.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "IsVipViewModel.h"

@implementation IsVipViewModel

-(void)getIsVipWithSuccess:(void (^)(IsVipModel * isVipModel))success Failture:(void (^)(IsVipModel * isVipError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:isVipStr];
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        
        IsVipModel *isVipModel = [IsVipModel yy_modelWithDictionary:responseObject];
        success(isVipModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        IsVipModel *isVipError = [IsVipModel yy_modelWithDictionary:errorResponseObject];
        failture(isVipError);
        
    }];
    
}


@end
