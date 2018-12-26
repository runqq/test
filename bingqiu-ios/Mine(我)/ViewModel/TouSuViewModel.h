//
//  TouSuViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TouSuModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface TouSuViewModel : NSObject

-(void)getTouSuWithCourseId:(NSNumber *)courseId TouSuType:(NSString *)complaintType TouSuContent:(NSString *)content Success:(void(^)(TouSuModel *tsModel))success Failture:(void(^)(TouSuModel *tsError))failture;

@end

NS_ASSUME_NONNULL_END
