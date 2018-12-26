//
//  HeadView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HeadView.h"

@implementation HeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.bgView];
        
        [self.bgView addSubview:self.headBgLab];
        [self.headBgLab addSubview:self.headImg];
        
        [self.bgView addSubview:self.nameLab];
        [self.bgView addSubview:self.textF];
        [self.bgView addSubview:self.huangGuanImg];
//        [self.bgView addSubview:self.bgBtn];
        [self.bgView addSubview:self.arrowsImg];
        [self.bgView addSubview:self.coverBtn];
        [self addLayOut];
        
    }
    return self;
}

- (void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.right.equalTo(weakself.mas_right).with.offset(0);
    }];
    [self.headBgLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(25);
        make.bottom.equalTo(weakself.bgView.mas_bottom).with.offset(-25);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.headBgLab.mas_top).with.offset(3);
        make.left.equalTo(weakself.headBgLab.mas_left).with.offset(3);
        make.bottom.equalTo(weakself.headBgLab.mas_bottom).with.offset(-3);
        make.right.equalTo(weakself.headBgLab.mas_right).with.offset(-3);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.headImg.mas_top).with.offset(10);
        make.left.equalTo(weakself.headImg.mas_right).with.offset(12);
    }];
    [self.textF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.nameLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.headImg.mas_right).with.offset(12);
        // make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
//    [self.bgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakself.nameLab.mas_bottom).with.offset(10);
//        make.left.equalTo(weakself.headImg.mas_right).with.offset(12);
//      // make.size.mas_equalTo(CGSizeMake(100, 40));
//    }];
    [self.arrowsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(-50);
        make.right.equalTo(weakself.mas_right).with.offset(-25);
        make.size.mas_equalTo(CGSizeMake(13, 22));
    }];
    // 蒙层按钮
    [self.coverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.bgView.mas_bottom).with.offset(-15);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, weakself.bgView.frame.size.height - 100));
    }];
}
-(UIImageView *)bgView{
    if (!_bgView) {
        _bgView = [UIImageView new];
        _bgView.frame = CGRectMake(0,  STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT, SCREEN_W, 180);
        _bgView.image = [UIImage imageNamed:@"bg_my_top"];
        // 设置用户交互
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}
// 头像的白色边框
-(UILabel *)headBgLab{
    if (!_headBgLab) {
        _headBgLab = [[UILabel alloc]init];
        _headBgLab.backgroundColor = [UIColor whiteColor];
        _headBgLab.layer.masksToBounds = YES;
        _headBgLab.layer.cornerRadius = 35;
    }
    return _headBgLab;
}
- (UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [UIImageView new];
        _headImg.image = [UIImage imageNamed:@"photo_tourist_nor"];
        _headImg.layer.masksToBounds = YES;
        _headImg.layer.cornerRadius = 32;
    }
    return _headImg;
}

-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [UILabel new];
        _nameLab.text = @"未登录";
        _nameLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _nameLab.font = BQBOLDFONT(18);
    }
    return _nameLab;
}

-(UITextField *)textF{
    if (!_textF) {
        _textF = [UITextField new];
        _textF.text = @" 游客";
        _textF.textColor = [UIColor whiteColor];
        _textF.font = BQFONT(12);
        _textF.backgroundColor = [UIColor colorWithHexString:@"#1a93da"];
        _textF.layer.masksToBounds = YES;
        _textF.layer.cornerRadius = 5;
        _textF.leftViewMode = UITextFieldViewModeAlways;
        _textF.leftView = self.huangGuanImg;
        [_textF sizeToFit];
        
    }
    return _textF;
}
-(UIImageView *)huangGuanImg{
    if (!_huangGuanImg) {
        _huangGuanImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 18, 15)];
        _huangGuanImg.image = [UIImage imageNamed:@"vip_my_icon_tourist"];
    }
    return _huangGuanImg;
}

-(UIButton *)bgBtn{
    if (!_bgBtn) {
        
        _bgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _bgBtn.backgroundColor = [UIColor colorWithHexString:@"#1a93da"];
        _bgBtn.layer.masksToBounds = YES;
        _bgBtn.layer.cornerRadius = 10;
        _bgBtn.layer.cornerRadius = 8;
        [_bgBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -2, 0, 0)];
        [_bgBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 1, 0, 0)];
//        [_bgBtn setContentEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
        _bgBtn.titleLabel.font = BQFONT(18);
        [_bgBtn setImage:[UIImage imageNamed:@"vip_my_icon_tourist"] forState:UIControlStateNormal];
        [_bgBtn setTitle:@"游客" forState:UIControlStateNormal];
        _bgBtn.titleLabel.font = BQFONT(12);
//        [_bgBtn.titleLabel sizeToFit];
//        [_bgBtn setTitle:self.crownLab.text forState:UIControlStateNormal];
        [_bgBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -10)];
        [_bgBtn setTitleEdgeInsets:UIEdgeInsetsMake(-5, 10, 0, 0)];
//        _bgBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _bgBtn;
}

-(UIImageView *)arrowsImg{
    if (!_arrowsImg) {
        _arrowsImg = [UIImageView new];
        _arrowsImg.image = [UIImage imageNamed:@"arrow_right_white_myphoto"];
    }
    return _arrowsImg;
}

-(UIButton *)coverBtn{
    if (!_coverBtn) {
        _coverBtn = [UIButton new];
        _coverBtn.backgroundColor = [UIColor clearColor];
    }
    return _coverBtn;
}


@end
