//
//  QieHuanStudentViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "QieHuanStudentViewModel.h"

@implementation QieHuanStudentViewModel

-(void)getQieHuanStudentWithMemberId:(NSNumber *)memberId Success:(void (^)(QieHuanStudentModel * changeModel))success Failture:(void (^)(QieHuanStudentModel * changeError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:changeStuUrl];
    NSDictionary *pargma = @{
                             @"memberId":memberId
                             };
    [HttpTool PostHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        QieHuanStudentModel *changeModel = [QieHuanStudentModel yy_modelWithDictionary:responseObject];
        success(changeModel);
        
    } FailureBlock:^(id errorResponseObject) {
        QieHuanStudentModel *changeError = [QieHuanStudentModel yy_modelWithDictionary:errorResponseObject];
        failture(changeError);
        
    }];
    
    
}


@end
