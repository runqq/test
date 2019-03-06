//
//  BanBenBiJiaoViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "BanBenBiJiaoViewModel.h"

@implementation BanBenBiJiaoViewModel

-(void)getBanBenBiJiaoWithVersion:(NSNumber *)version Success:(void (^)(BanBeBiJiaoModel * banBenModel))success Failture:(void (^)(BanBeBiJiaoModel * banBenError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:banBenBiJiaoUrl];
    NSDictionary *pargma = @{
                             @"version":version
                             };
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        BanBeBiJiaoModel *banBenModel = [BanBeBiJiaoModel yy_modelWithDictionary:responseObject];
        success(banBenModel);
        
    } FailureBlock:^(id errorResponseObject) {
        BanBeBiJiaoModel *banBenError = [BanBeBiJiaoModel yy_modelWithDictionary:errorResponseObject];
        failture(banBenError);
        
    }];
    
}

@end
