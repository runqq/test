//
//  PasswordLoginView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/6.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PasswordLoginView : UIView

@property(nonatomic,strong)UIView *passwordView;

@property(nonatomic,strong)UIView *bgView;

@property(nonatomic,strong)UITextField  *mobileTF;
@property(nonatomic,strong)UILabel      *firLab;
@property(nonatomic,strong)UITextField  *passwordTF;
@property(nonatomic,strong)UILabel      *secLab;

@end

NS_ASSUME_NONNULL_END
