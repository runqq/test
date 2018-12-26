//
//  HelpListViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HelpListViewModel.h"

@implementation HelpListViewModel

-(void)getHelpListWithSuccess:(void (^)(HelpListModel *helpListModel))success Failture:(void (^)(HelpListModel * helpListError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:helpListUrl];
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        HelpListModel *helpListModel = [HelpListModel yy_modelWithDictionary:responseObject];
        success(helpListModel);
        
    } FailureBlock:^(id errorResponseObject) {
        HelpListModel *helpListError = [HelpListModel yy_modelWithDictionary:errorResponseObject];
        failture(helpListError);
        
    }];
    
    
}

@end
