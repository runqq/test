//
//  BiSaiListDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/14.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BiSaiListDetailModel : NSObject

@property(nonatomic,assign)NSNumber *team1Score;
@property(nonatomic,copy)NSString *iceTitle;
@property(nonatomic,assign)NSNumber *team2Score;
@property(nonatomic,copy)NSString *team1Name;
@property(nonatomic,assign)NSNumber *titleID;
@property(nonatomic,copy)NSString *team2Name;
@property(nonatomic,copy)NSString *startTime;

@end

NS_ASSUME_NONNULL_END
