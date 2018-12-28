//
//  HeadView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadView : UIView

@property(nonatomic,strong)UIImageView *bgView;
@property(nonatomic,strong)UILabel *headBgLab; // 头像的白色边框
@property(nonatomic,strong)UIImageView *headImg;
@property(nonatomic,strong)UILabel *nameLab;

@property(nonatomic,strong)UITextField *textF;
@property(nonatomic,strong)UIImageView *huangGuanImg;

@property(nonatomic,strong)UIView *youKeView;

@property(nonatomic,strong)UIImageView *arrowsImg; // 箭头
@property(nonatomic,strong)UIButton *coverBtn; // 蒙层Btn


@end

NS_ASSUME_NONNULL_END
