//
//  DingDanListViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "DingDanListViewModel.h"

@implementation DingDanListViewModel

-(void)getDingDanListDataSuccess:(void (^)(DingDanList * dingDanListModel))success Failture:(void (^)(DingDanList * dingDanListError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:dingDanListUrl];
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        
        DingDanList *dingDanListModel = [DingDanList yy_modelWithDictionary:responseObject];
        success(dingDanListModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        DingDanList *dingDanListError = [DingDanList yy_modelWithDictionary:errorResponseObject];
        failture(dingDanListError);
    }];
    
}

@end
