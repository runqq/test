//
//  TouSuViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TouSuViewModel.h"

@implementation TouSuViewModel

-(void)getTouSuWithCourseId:(NSNumber *)courseId TouSuType:(NSString *)complaintType TouSuContent:(NSString *)content Success:(void (^)(TouSuModel * tsModel))success Failture:(void (^)(TouSuModel * tsError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:touSuUrl];
    
    NSDictionary *pargma = @{
                             @"id":courseId,
                             @"complaintType":complaintType,
                             @"content":content
                             };
    
    [HttpTool PostHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        TouSuModel *tsModel = [TouSuModel yy_modelWithDictionary:responseObject];
        success(tsModel);
        
    } FailureBlock:^(id errorResponseObject) {
        TouSuModel *tsError = [TouSuModel yy_modelWithDictionary:errorResponseObject];
        failture(tsError);
        
    }];
    
}

@end
