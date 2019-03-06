//
//  AllStrategyViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "AllStrategyViewModel.h"

@implementation AllStrategyViewModel



-(void)getAllStrategySuccess:(void(^)(AllStrategyModel *glModel))success  Failture:(void(^)(AllStrategyModel  *glError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:allStrategy];
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        AllStrategyModel *allStrategy = [AllStrategyModel yy_modelWithDictionary:responseObject];
        success(allStrategy);
        
    } FailureBlock:^(id errorResponseObject) {
        AllStrategyModel *glError = [AllStrategyModel yy_modelWithDictionary:errorResponseObject];
        failture(glError);
    }];
    
    
}

@end
