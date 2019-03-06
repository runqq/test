//
//  BQSmallCardViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "BQSmallCardViewModel.h"

@implementation BQSmallCardViewModel

-(void)getBQSmallCardSuccess:(void (^)(BingQiuSmallCardModel * bqModel))success Failture:(void (^)(BingQiuSmallCardModel * bqError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:bqSmallCard];
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        BingQiuSmallCardModel *bqSmallCardModel = [BingQiuSmallCardModel yy_modelWithDictionary:responseObject];
        success(bqSmallCardModel);
        
    } FailureBlock:^(id errorResponseObject) {
        BingQiuSmallCardModel *bqSmallCardError = [BingQiuSmallCardModel yy_modelWithDictionary:errorResponseObject];
        failture(bqSmallCardError);
        
    }];
    
}

@end
