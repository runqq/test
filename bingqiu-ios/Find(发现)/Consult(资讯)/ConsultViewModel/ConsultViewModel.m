//
//  ConsultViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ConsultViewModel.h"

@implementation ConsultViewModel

-(void)getsubTitleContestWithSuccess:(void (^)(ConsultModel * sultModel))success Failture:(void (^)(ConsultModel * consultError))failture{
    
    NSString *urlStr = [interface stringByAppendingString:consultPort];
    
    [HttpTool GetHttpDataWithUrlStr:urlStr Dic:nil SuccessBlock:^(id responseObject) {
        ConsultModel   *sultModel = [ConsultModel yy_modelWithDictionary:responseObject];
        success(sultModel);
        
    } FailureBlock:^(id errorResponseObject) {
        ConsultModel   *errorModel = [ConsultModel yy_modelWithDictionary:errorResponseObject];
        success(errorModel);
    }];
    
}

@end
