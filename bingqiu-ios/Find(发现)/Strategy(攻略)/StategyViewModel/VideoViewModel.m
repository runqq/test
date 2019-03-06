//
//  VideoViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "VideoViewModel.h"

@implementation VideoViewModel

-(void)getVideowWithPageNum:(NSNumber *)pageNo SizeNum:(NSNumber *)sizenum StrategyId:(NSNumber *)glId Success:(void (^)(VideoModel * videoModel))success Failture:(void (^)(VideoModel * videoError))failture{
    
    NSString *strUrl = [interface stringByAppendingString:videoUrl];
    
    NSDictionary *pargram = @{
                              @"pageNo":pageNo,
                              @"pageSize":sizenum,
                              @"strategyId":glId
                              };
    
    [HttpTool GetHttpDataWithUrlStr:strUrl Dic:pargram SuccessBlock:^(id responseObject) {
        VideoModel *video = [VideoModel yy_modelWithDictionary:responseObject];
        success(video);
        
    } FailureBlock:^(id errorResponseObject) {
        VideoModel *errorModel = [VideoModel yy_modelWithDictionary:errorResponseObject];
        failture(errorModel);
    }];
    
}



@end
