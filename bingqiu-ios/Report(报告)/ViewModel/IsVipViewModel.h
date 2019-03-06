//
//  IsVipViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/27.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IsVipModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface IsVipViewModel : UIView

-(void)getIsVipWithSuccess:(void(^)(IsVipModel *isVipModel))success Failture:(void(^)(IsVipModel *isVipError))failture;

@end

NS_ASSUME_NONNULL_END
