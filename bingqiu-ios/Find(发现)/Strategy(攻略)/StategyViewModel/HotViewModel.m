//
//  HotViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/5.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HotViewModel.h"

@implementation HotViewModel

-(void)getHotSuccess:(void (^)(HotModel *hotModel))success Failture:(void (^)(HotModel *hotError))failture{
    
    NSString  *urlStr = [interface stringByAppendingString:hotPort];
    [HttpTool GetHttpDataWithUrlStr:urlStr Dic:nil SuccessBlock:^(id responseObject) {
        HotModel *hot = [HotModel yy_modelWithDictionary:responseObject];
        success(hot);
        
    } FailureBlock:^(id errorResponseObject) {
        HotModel *errModel = [HotModel yy_modelWithDictionary:errorResponseObject];
        failture(errModel);
    }];
    
}

@end
