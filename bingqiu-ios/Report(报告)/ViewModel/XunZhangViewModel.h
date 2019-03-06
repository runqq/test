//
//  XunZhangViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/27.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XunZhangModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XunZhangViewModel : NSObject

-(void)getXunZhangPhotoSuccess:(void(^)(XunZhangModel *xzModel))success  Failture:(void(^)(XunZhangModel *xzError))failture;

@end

NS_ASSUME_NONNULL_END
