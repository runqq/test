//
//  ShangKeXinagQingViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShangKeXiangQingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShangKeXinagQingViewModel : NSObject

-(void)getShangKeXiangQingWithCourseId:(NSNumber *)courseId Success:(void(^)(ShangKeXiangQingModel *skxqModel))success  Failture:(void(^)(ShangKeXiangQingModel *skxqError))failture;


@end

NS_ASSUME_NONNULL_END
