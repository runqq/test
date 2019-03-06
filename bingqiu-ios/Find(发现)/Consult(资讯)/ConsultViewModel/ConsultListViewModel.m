//
//  ConsultListViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ConsultListViewModel.h"

@implementation ConsultListViewModel


-(void)getConsultListWithPageNum:(NSNumber *)pageNo SizeNum:(NSNumber *)sizenum NewsClassify:(NSString *)newsClassify Success:(void (^)(ConsultListModel * listModel))success Failture:(void (^)(ConsultListModel * listError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:consultUrl];
    
    NSDictionary *pargram = @{
                              @"pageNo":pageNo,
                              @"pageSize":sizenum,
                              @"newsClassify":newsClassify
                              };
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargram SuccessBlock:^(id responseObject) {
        
        ConsultListModel *listModel = [ConsultListModel yy_modelWithDictionary:responseObject];
        success(listModel);
        
    } FailureBlock:^(id errorResponseObject) {
        ConsultListModel *listErr = [ConsultListModel yy_modelWithDictionary:errorResponseObject];
        failture(listErr);
        
    }];
    
}


@end
