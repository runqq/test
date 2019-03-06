//
//  ConsultViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsultModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ConsultViewModel : NSObject

-(void)getsubTitleContestWithSuccess:(void(^)(ConsultModel  *sultModel))success Failture:(void(^)(ConsultModel *consultError))failture;

@end

NS_ASSUME_NONNULL_END
