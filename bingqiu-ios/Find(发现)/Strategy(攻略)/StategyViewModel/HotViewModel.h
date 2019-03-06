//
//  HotViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/5.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HotModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HotViewModel : NSObject

-(void)getHotSuccess:(void(^)(HotModel *hotModel))success  Failture:(void(^)(HotModel *hotError))failture;

@end

NS_ASSUME_NONNULL_END
