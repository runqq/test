//
//  JiangXueJinViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JiangXueJinModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JiangXueJinViewModel : NSObject

-(void)getJiangXueJinWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize Success:(void(^)(JiangXueJinModel *jxjModel))success  Failture:(void(^)(JiangXueJinModel *jxjError))failture;

@end

NS_ASSUME_NONNULL_END
