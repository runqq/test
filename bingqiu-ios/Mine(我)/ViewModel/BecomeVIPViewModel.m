//
//  BecomeVIPViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "BecomeVIPViewModel.h"

@implementation BecomeVIPViewModel

-(void)getVIPWithDataSuccess:(void (^)(BecomeVIPModel * becomeVIPModel))success Failture:(void (^)(BecomeVIPModel * becomeVIPError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:becomeVIPUrl];
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        BecomeVIPModel *becomeVIPModel = [BecomeVIPModel yy_modelWithDictionary:responseObject];
        success(becomeVIPModel);
        
    } FailureBlock:^(id errorResponseObject) {
        BecomeVIPModel *becomeVIPError = [BecomeVIPModel yy_modelWithDictionary:errorResponseObject];
        failture(becomeVIPError);
    }];
    
}

@end
