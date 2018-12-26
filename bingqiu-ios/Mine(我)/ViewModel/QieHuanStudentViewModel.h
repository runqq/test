//
//  QieHuanStudentViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QieHuanStudentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QieHuanStudentViewModel : NSObject

-(void)getQieHuanStudentWithMemberId:(NSNumber *)memberId Success:(void(^)(QieHuanStudentModel *changeModel))success Failture:(void(^)(QieHuanStudentModel *changeError))failture;

@end

NS_ASSUME_NONNULL_END
