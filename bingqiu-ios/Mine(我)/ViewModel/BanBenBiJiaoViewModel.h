//
//  BanBenBiJiaoViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BanBeBiJiaoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BanBenBiJiaoViewModel : NSObject

-(void)getBanBenBiJiaoWithVersion:(NSNumber *)version Success:(void(^)(BanBeBiJiaoModel *banBenModel))success Failture:(void(^)(BanBeBiJiaoModel *banBenError))failture;


@end

NS_ASSUME_NONNULL_END
