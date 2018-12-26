//
//  CampBaoMingViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CampBaoMingViewModel.h"

@implementation CampBaoMingViewModel

-(void)getCampBaoMingWithCampId:(NSNumber *)campId Mobile:(NSString *)mobile Success:(void (^)(CampBaoMingModel * baoMingModel))success Failture:(void (^)(CampBaoMingModel * baoMingError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:baoMingUrl];
    NSDictionary *pargma = @{
                             @"id":campId,
                             @"mobile":mobile
                             };
    [HttpTool PostHttpDataWithUrlStr:strUrl Dic:pargma SuccessBlock:^(id responseObject) {
        CampBaoMingModel *baoMingModel = [CampBaoMingModel yy_modelWithDictionary:responseObject];
        success(baoMingModel);
        
    } FailureBlock:^(id errorResponseObject) {
        CampBaoMingModel *baoMingError = [CampBaoMingModel yy_modelWithDictionary:errorResponseObject];
        failture(baoMingError);
        
    }];
    
}

@end
