//
//  EvaluateView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//  Evaluate 评价

#import <UIKit/UIKit.h>
#import "HMTextView.h"

NS_ASSUME_NONNULL_BEGIN

@interface EvaluateView : UIView <UITextViewDelegate>

@property(nonatomic,strong)UIView *bgTextV;

@property(nonatomic,strong)UILabel    *titLab;
@property(nonatomic,strong)UIButton   *cancelBtn;
@property(nonatomic,strong)HMTextView *smallTextV;
@property(nonatomic,strong)UILabel    *placeholderLab;
@property(nonatomic,strong)UIButton   *submitBtn;
// 显示星星的view
@property(nonatomic,strong) UIView * showStar;
// 显示图片数组
@property (nonatomic, strong)NSMutableArray * myImageArray;

// 展示自定义Alert
-(void)showCustomAlertViewOnView:(UIView *)view;
// 返回自定义view
-(void)dissmissCustomAlertView;


@end

NS_ASSUME_NONNULL_END
