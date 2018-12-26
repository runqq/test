//
//  BecomeVIPViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BecomeVIPModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BecomeVIPViewModel : NSObject

-(void)getVIPWithDataSuccess:(void(^)(BecomeVIPModel *becomeVIPModel))success Failture:(void(^)(BecomeVIPModel *becomeVIPError))failture;

@end

NS_ASSUME_NONNULL_END
