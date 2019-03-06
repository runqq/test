//
//  MyHomePageViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyHomePageViewModel.h"

@implementation MyHomePageViewModel

-(void)getMyHomePageSuccess:(void (^)(MyHomepageModel * myHomePageModel))success Failture:(void (^)(MyHomepageModel * myHomePageError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:myHomePage];
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        MyHomepageModel *myHomePageModel = [MyHomepageModel yy_modelWithDictionary:responseObject];
        success(myHomePageModel);
        
    } FailureBlock:^(id errorResponseObject) {
        MyHomepageModel *myHomePageModelError = [MyHomepageModel yy_modelWithDictionary:errorResponseObject];
        failture(myHomePageModelError);
        
    }]; 
}

@end
