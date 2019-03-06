//
//  XunZhangViewModel.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/27.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XunZhangViewModel.h"

@implementation XunZhangViewModel

-(void)getXunZhangPhotoSuccess:(void (^)(XunZhangModel * xzModel))success Failture:(void (^)(XunZhangModel * xzError))failture{
    
    NSString  *urlStr = [interface stringByAppendingString:xunZhangStr];
    
    [HttpTool GetHttpDataWithUrlStr:urlStr Dic:nil SuccessBlock:^(id responseObject) {
        
        XunZhangModel  *xzModel = [XunZhangModel yy_modelWithDictionary:responseObject];
        success(xzModel);
        
    } FailureBlock:^(id errorResponseObject) {
        
        XunZhangModel  *xzError = [XunZhangModel yy_modelWithDictionary:errorResponseObject];
        failture(xzError);
    }];
    
}

@end
