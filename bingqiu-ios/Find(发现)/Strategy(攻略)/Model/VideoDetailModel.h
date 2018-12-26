//
//  VideoDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoDetailModel : NSObject

@property(nonatomic,copy)NSString   *videoPath;
@property(nonatomic,assign)NSNumber *readNum;
@property(nonatomic,copy)NSString   *photo;

@property(nonatomic,assign)NSNumber *titleID;

@property(nonatomic,copy)NSString   *title;
@property(nonatomic,assign)NSNumber *upNum;
@property(nonatomic,copy)NSString   *videoGradeText;
@property(nonatomic,assign)NSNumber *isPraise;


@end

NS_ASSUME_NONNULL_END
