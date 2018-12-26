//
//  WantToSeeViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/2.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WantToSeeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WantToSeeViewModel : NSObject

-(void)getWantToSeeSuccess:(void(^)(WantToSeeModel *wantModel))success  Failture:(void(^)(WantToSeeModel *wantError))failture;

@end

NS_ASSUME_NONNULL_END
