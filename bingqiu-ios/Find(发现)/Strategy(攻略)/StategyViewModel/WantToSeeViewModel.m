//
//  WantToSeeViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/2.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "WantToSeeViewModel.h"

@implementation WantToSeeViewModel

-(void)getWantToSeeSuccess:(void (^)(WantToSeeModel * wantModel))success Failture:(void (^)(WantToSeeModel * wantError))failture{

    NSString  *urlStr = [interface stringByAppendingString:wantToSeePort];
    
    [HttpTool GetHttpDataWithUrlStr:urlStr Dic:nil SuccessBlock:^(id responseObject) {
        
        WantToSeeModel *wantModel = [WantToSeeModel yy_modelWithDictionary:responseObject];
        success(wantModel);
        
    } FailureBlock:^(id errorResponseObject) {
        WantToSeeModel *errModel = [WantToSeeModel yy_modelWithDictionary:errorResponseObject];
        failture(errModel);
    }];

}

@end
