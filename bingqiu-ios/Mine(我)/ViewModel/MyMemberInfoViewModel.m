//
//  MyMemberInfoViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyMemberInfoViewModel.h"

@implementation MyMemberInfoViewModel

-(void)getMyMemberInfoSuccess:(void (^)(MyMemberInfoModel * infoModel))success Failture:(void (^)(MyMemberInfoModel * infoError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:myMemberInfo];
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:nil SuccessBlock:^(id responseObject) {
        MyMemberInfoModel *infoModel = [MyMemberInfoModel yy_modelWithDictionary:responseObject];
        success(infoModel);
        
    } FailureBlock:^(id errorResponseObject) {
        MyMemberInfoModel *infoError = [MyMemberInfoModel yy_modelWithDictionary:errorResponseObject];
        failture(infoError);
        
    }];
    
}

@end
