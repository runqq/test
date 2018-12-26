//
//  WangLuoCuoWu.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WangLuoCuoWu : UIView

@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *refreshBtn;

// 展示自定义View
-(void)showCustomNetWorkErrorView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
