//
//  ShareView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/3.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShareView : UIView

@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,strong)UIButton *cancelBtn;

@property(nonatomic,strong)UIButton *weiXinBtn;
@property(nonatomic,strong)UIButton *pengYouQuanBtn;
@property(nonatomic,strong)UIButton *weiBoBtn;
@property(nonatomic,strong)UIButton *QQkongJianBtn;

// 展示自定义Alert
-(void)showShareAlertViewOnView:(UIView *)view;
// 返回自定义view
-(void)dissmissCustomAlertView;

@end

NS_ASSUME_NONNULL_END
