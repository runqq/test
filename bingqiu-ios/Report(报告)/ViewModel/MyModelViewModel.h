//
//  MyModelViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyModelModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyModelViewModel : NSObject

-(void)getMyModelDataWithSuccess:(void(^)(MyModelModel *myModelModel))success Failture:(void(^)(MyModelModel *myModelError))failture;

@end

NS_ASSUME_NONNULL_END
