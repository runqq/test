//
//  FanKuiYuJianYiViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FanKuiYuJianYiModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FanKuiYuJianYiViewModel : NSObject

-(void)getFanKuiYuJianYiWithRemark:(NSString *)remark Type:(NSString *)type Success:(void(^)(FanKuiYuJianYiModel *fkModel))success Failture:(void(^)(FanKuiYuJianYiModel *fkError))failture;

@end

NS_ASSUME_NONNULL_END
