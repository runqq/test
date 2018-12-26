//
//  MyMemberInfoViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyMemberInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyMemberInfoViewModel : NSObject

-(void)getMyMemberInfoSuccess:(void(^)(MyMemberInfoModel *infoModel))success  Failture:(void(^)(MyMemberInfoModel *infoError))failture;

@end

NS_ASSUME_NONNULL_END
