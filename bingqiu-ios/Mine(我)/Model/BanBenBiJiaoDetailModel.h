//
//  BanBenBiJiaoDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BanBenBiJiaoDetailModel : NSObject

@property(nonatomic,copy)NSString *createTime;
@property(nonatomic,copy)NSString *appId;
@property(nonatomic,copy)NSString *downloadUrl;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *osType;
@property(nonatomic,copy)NSString *remark;

@property(nonatomic,assign)NSNumber *bbId;
@property(nonatomic,assign)NSNumber *version;

@end

NS_ASSUME_NONNULL_END
