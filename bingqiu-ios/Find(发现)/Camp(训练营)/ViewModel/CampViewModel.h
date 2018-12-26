//
//  CampViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CampModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface CampViewModel : NSObject

-(void)getCampWithPageNum:(NSNumber *)page PageSize:(NSNumber *)pageSize  Success:(void(^)(CampModel *campModel))success  Failture:(void(^)(CampModel *campError))failture;

@end

NS_ASSUME_NONNULL_END
