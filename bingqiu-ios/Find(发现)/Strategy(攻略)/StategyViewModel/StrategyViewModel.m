//
//  StrategyViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/1.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "StrategyViewModel.h"


@implementation StrategyViewModel

-(void)getBannerPhotoSuccess:(void (^)(StategyModel * Mmodel))success Failture:(void (^)(StategyModel *errorModel))failture{
    
    
    NSString  *urlStr = [NSString stringWithFormat:@"%@%@",interface,photoPort]; //[interface stringByAppendingString:photoPort];
    
    [HttpTool GetHttpDataWithUrlStr:urlStr Dic:nil SuccessBlock:^(id responseObject) {
    
        StategyModel  *mm = [StategyModel yy_modelWithDictionary:responseObject];
        success(mm);
        
    } FailureBlock:^(id errorResponseObject) {
        
        StategyModel  *errorMM = [StategyModel yy_modelWithDictionary:errorResponseObject];
        failture(errorMM);
    }];
}


@end
