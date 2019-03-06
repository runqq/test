//
//  YanZhengMaView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/6.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YanZhengMaView : UIView

@property(nonatomic,strong)UIView *bgView;

@property(nonatomic,strong)UITextField  *numberTF;
@property(nonatomic,strong)UILabel      *firLab;
@property(nonatomic,strong)UITextField  *mimaTF;
@property(nonatomic,strong)UIButton     *verifyBtn;
@property(nonatomic,strong)UILabel      *secLab;

@end

NS_ASSUME_NONNULL_END
