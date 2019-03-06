//
//  XiangQingViewController.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XiangQingViewController : UIViewController

@property(nonatomic,assign)NSNumber *ids;
@property(nonatomic,assign)NSNumber *campId; // 训练营报名需要传递的训练营id
@property(nonatomic,copy)NSString   *campMobile; // 训练营报名需要传递的手机号
@property(nonatomic,copy)NSString *endStr; // 用来接收是否已经结束报名

@property(nonatomic,strong)NSString *numberStr;


@end

NS_ASSUME_NONNULL_END
