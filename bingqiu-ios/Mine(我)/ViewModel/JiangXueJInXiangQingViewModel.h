//
//  JiangXueJInXiangQingViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JiangXueJInXiangQingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JiangXueJInXiangQingViewModel : NSObject


-(void)getJiangXueJinXiangQingWithTitleId:(NSNumber *)titleId Success:(void(^)(JiangXueJInXiangQingModel *jxjDetailModel))success  Failture:(void(^)(JiangXueJInXiangQingModel *jxjDetailError))failture;

@end

NS_ASSUME_NONNULL_END
