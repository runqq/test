//
//  MyHomePageViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyHomepageModel.h"



NS_ASSUME_NONNULL_BEGIN

@interface MyHomePageViewModel : NSObject

-(void)getMyHomePageSuccess:(void(^)(MyHomepageModel *myHomePageModel))success  Failture:(void(^)(MyHomepageModel *myHomePageError))failture;

@end

NS_ASSUME_NONNULL_END
