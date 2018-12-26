//
//  VideoViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoViewModel : NSObject

-(void)getVideowWithPageNum:(NSNumber *)pageNo  SizeNum:(NSNumber *)sizenum StrategyId:(NSNumber *)glId Success:(void(^)(VideoModel *videoModel))success Failture:(void(^)(VideoModel *videoError))failture;

@end

NS_ASSUME_NONNULL_END
