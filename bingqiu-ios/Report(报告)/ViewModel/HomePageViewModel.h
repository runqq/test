//
//  HomePageViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/13.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomePageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomePageViewModel : NSObject

-(void)getHomePageDataWithSuccess:(void(^)(HomePageModel *homePageModel))success Failture:(void(^)(HomePageModel *homePageModel))failture;

@end

NS_ASSUME_NONNULL_END
