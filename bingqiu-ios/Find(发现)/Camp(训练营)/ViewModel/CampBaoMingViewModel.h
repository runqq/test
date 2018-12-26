//
//  CampBaoMingViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CampBaoMingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CampBaoMingViewModel : NSObject

-(void)getCampBaoMingWithCampId:(NSNumber *)campId Mobile:(NSString *)mobile Success:(void(^)(CampBaoMingModel *baoMingModel))success  Failture:(void(^)(CampBaoMingModel *baoMingError))failture;

@end

NS_ASSUME_NONNULL_END
