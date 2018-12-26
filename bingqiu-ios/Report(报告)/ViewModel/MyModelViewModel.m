//
//  MyModelViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyModelViewModel.h"

@implementation MyModelViewModel

-(void)getMyModelDataWithSuccess:(void (^)(MyModelModel * myModelModel))success Failture:(void (^)(MyModelModel * myModelError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:myMedalStr];
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        
        MyModelModel *myMedalModel = [MyModelModel yy_modelWithDictionary:responseObject];
        success(myMedalModel);
        
    } FailureBlock:^(id errorResponseObject) {
        MyModelModel *myMedalError = [MyModelModel yy_modelWithDictionary:errorResponseObject];
        failture(myMedalError);
        
    }];
    
}

@end
