//
//  BQSmallCardViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BingQiuSmallCardModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface BQSmallCardViewModel : NSObject

-(void)getBQSmallCardSuccess:(void(^)(BingQiuSmallCardModel *bqModel))success  Failture:(void(^)(BingQiuSmallCardModel *bqError))failture;

@end

NS_ASSUME_NONNULL_END
