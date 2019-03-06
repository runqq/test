//
//  CampViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CampViewModel.h"

@implementation CampViewModel

-(void)getCampWithPageNum:(NSNumber *)page PageSize:(NSNumber *)pageSize Success:(void (^)(CampModel * _Nonnull))success Failture:(void (^)(CampModel * _Nonnull))failture{
    
    NSString *strUrl =   [NSString stringWithFormat:@"%@%@",interface,campUrl];
    // [interface stringByAppendingString:campUrl];
    NSDictionary *pargame = @{
                              @"pageNo":page,
                              @"pageSize":pageSize
                              };
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargame SuccessBlock:^(id responseObject) {
        CampModel *campM = [CampModel yy_modelWithDictionary:responseObject];
        success(campM);
        
    } FailureBlock:^(id errorResponseObject) {
        CampModel *error = [CampModel yy_modelWithDictionary:errorResponseObject];
        failture(error);
        
    }];
    
}

@end
