//
//  XiangQingViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XiangQingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XiangQingViewModel : NSObject

-(void)getXiangQingWithID:(NSNumber *)campId Success:(void(^)(XiangQingModel *detailModel))success  Failture:(void(^)(XiangQingModel *detailError))failture;

@end

NS_ASSUME_NONNULL_END
