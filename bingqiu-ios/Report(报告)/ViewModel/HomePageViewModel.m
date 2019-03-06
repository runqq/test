//
//  HomePageViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HomePageViewModel.h"

@implementation HomePageViewModel

-(void)getHomePageDataWithSuccess:(void (^)(HomePageModel * homePageModel))success Failture:(void (^)(HomePageModel * homePageModel))failture{
    
    NSString *strUrl = [interface stringByAppendingString:homePageUrl];
//    BQLog(@"网址为:%@",strUrl);
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        
        HomePageModel *homePageModel = [HomePageModel yy_modelWithDictionary:responseObject];
        success(homePageModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        HomePageModel *errorhomePageModel = [HomePageModel yy_modelWithDictionary:errorResponseObject];
        failture(errorhomePageModel);
        
    }];
    
}

@end
