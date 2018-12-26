//
//  HuoQuStuListViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HuoQuStuListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HuoQuStuListViewModel : NSObject

-(void)getHuoQuStuListSuccess:(void(^)(HuoQuStuListModel *huoQuStuListModel))success  Failture:(void(^)(HuoQuStuListModel *huoQuStuLisError))failture;

@end

NS_ASSUME_NONNULL_END
