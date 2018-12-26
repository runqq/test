//
//  FenLeiDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FenLeiDetailModel : NSObject

@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *suitIntro;
@property(nonatomic,assign)NSNumber *readNum;

@property(nonatomic,assign)NSNumber *titleID;

@end

NS_ASSUME_NONNULL_END
