//
//  HelpListViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelpListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HelpListViewModel : NSObject

-(void)getHelpListWithSuccess:(void(^)(HelpListModel *helpListModel))success Failture:(void(^)(HelpListModel *helpListError))failture;

@end

NS_ASSUME_NONNULL_END

