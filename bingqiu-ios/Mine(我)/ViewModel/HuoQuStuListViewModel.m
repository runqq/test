//
//  HuoQuStuListViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HuoQuStuListViewModel.h"

@implementation HuoQuStuListViewModel

-(void)getHuoQuStuListSuccess:(void (^)(HuoQuStuListModel * huoQuStuLisModel))success Failture:(void (^)(HuoQuStuListModel * huoQuStuLisError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:stuList];
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        HuoQuStuListModel *huoQuStuLisModel = [HuoQuStuListModel yy_modelWithDictionary:responseObject];
        success(huoQuStuLisModel);
        
    } FailureBlock:^(id errorResponseObject) {
        HuoQuStuListModel *huoQuStuLisError = [HuoQuStuListModel yy_modelWithDictionary:errorResponseObject];
        failture(huoQuStuLisError);
        
    }];
}

@end
