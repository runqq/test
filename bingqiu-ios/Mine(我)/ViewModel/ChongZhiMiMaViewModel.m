//
//  ChongZhiMiMaViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChongZhiMiMaViewModel.h"

@implementation ChongZhiMiMaViewModel

-(void)getChongZhiMiMaWithPassword:(NSString *)password Success:(void (^)(ChongZhiMiMaModel * chongZhiModel))success Failture:(void (^)(ChongZhiMiMaModel * chongZhiError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:chongZhiMiMaUrl];
    NSDictionary *pargma = @{
                             @"password":[Encryption md5:password]
                             };
    BQLog(@"重置密码的MD5加密后的密码%@",pargma);
    
    [HttpTool PostHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        ChongZhiMiMaModel *chongZhiModel = [ChongZhiMiMaModel yy_modelWithDictionary:responseObject];
        success(chongZhiModel);
        
    } FailureBlock:^(id errorResponseObject) {
        ChongZhiMiMaModel *chongZhiError = [ChongZhiMiMaModel yy_modelWithDictionary:errorResponseObject];
        failture(chongZhiError);
    }];
    
}

@end
