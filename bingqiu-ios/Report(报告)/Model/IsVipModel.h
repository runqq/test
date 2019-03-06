//
//  IsVipModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IsVipModel : NSObject

@property(nonatomic,assign)BOOL success;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,strong)NSDictionary *data;

@end

NS_ASSUME_NONNULL_END
