//
//  JiangXueJinDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JiangXueJinDetailModel : NSObject

@property(nonatomic,copy)NSString *amount;
@property(nonatomic,copy)NSString *accountType;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *accountRecordType;
@property(nonatomic,copy)NSString *operationTime;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,assign)NSNumber *titleID;

@end

NS_ASSUME_NONNULL_END
