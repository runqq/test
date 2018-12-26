//
//  JiaoYIXiangQingViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JiaoYiXiangQingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JiaoYIXiangQingViewModel : NSObject

-(void)getJiaoYiXiangQingWithTitleId:(NSNumber *)titleId Success:(void(^)(JiaoYiXiangQingModel *jyxqlModel))success  Failture:(void(^)(JiaoYiXiangQingModel *jyxqError))failture;

@end

NS_ASSUME_NONNULL_END
