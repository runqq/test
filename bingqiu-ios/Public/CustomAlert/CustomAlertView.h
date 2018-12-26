//
//  CustomAlertView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/25.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomAlertView : UIView

@property(nonatomic , strong)UIImageView  *bgIMg;
@property(nonatomic , strong)UILabel      *titLab;
@property(nonatomic , strong)UILabel      *tishiOneLab;
@property(nonatomic , strong)UITextField  *phoneNumTF;
@property(nonatomic , strong)UILabel      *tishiTwoLab;
@property(nonatomic , strong)UIButton     *sendBtn;
@property(nonatomic , strong)UIButton     *cancelBtn;

// 展示自定义Alert
-(void)showCustomAlertViewOnView:(UIView *)view;
// 返回自定义view
-(void)dissmissCustomAlertView;

@end

NS_ASSUME_NONNULL_END
