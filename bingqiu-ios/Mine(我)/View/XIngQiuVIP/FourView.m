//
//  FourView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FourView.h"

@implementation FourView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titLab];
        [self addSubview:self.zfbImg];
        [self addSubview:self.zfbLab];
        [self addSubview:self.zfbBtn];
        [self addSubview:self.lineLab];
        [self addSubview:self.wxImg];
        [self addSubview:self.wxLab];
        [self addSubview:self.wxBtn];
        
        [self addLayOut];
        
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(17);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.zfbImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab.mas_bottom).with.offset(15);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.zfbLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab.mas_bottom).with.offset(13);
        make.left.equalTo(weakself.zfbImg.mas_right).with.offset(10);
    }];
    [self.zfbBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.lineLab.mas_top).with.offset(-5);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.zfbImg.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.wxImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.lineLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.wxLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.lineLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.wxImg.mas_right).with.offset(10);
    }];
    [self.wxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.lineLab.mas_bottom).with.offset(5);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    
}
-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [UILabel new];
        _titLab.text = @"请选择支付渠道";
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQFONT(16);
    }
    return _titLab;
}
-(UIImageView *)zfbImg{
    if (!_zfbImg) {
        _zfbImg = [UIImageView new];
        _zfbImg.image = [UIImage imageNamed:@"icon_pay_zhifubao"];
    }
    return _zfbImg;
}
-(UILabel *)zfbLab{
    if (!_zfbLab) {
        _zfbLab = [UILabel new];
        _zfbLab.text = @"支付宝支付";
        _zfbLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _zfbLab.font = BQFONT(16);
    }
    return _zfbLab;
}
-(UIButton *)zfbBtn{
    if (!_zfbBtn) {
        _zfbBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _zfbBtn.selected = YES;
        [_zfbBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
        [_zfbBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateSelected];
        [_zfbBtn addTarget:self action:@selector(zfbBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _zfbBtn;
}
-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}
-(UIImageView *)wxImg{
    if (!_wxImg) {
        _wxImg = [UIImageView new];
        _wxImg.image = [UIImage imageNamed:@"icon_pay_weixin"];
    }
    return _wxImg;
}
-(UILabel *)wxLab{
    if (!_wxLab) {
        _wxLab = [UILabel new];
        _wxLab.text = @"微信支付";
        _wxLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _wxLab.font = BQFONT(16);
    }
    return _wxLab;
}
-(UIButton *)wxBtn{
    if (!_wxBtn) {
        _wxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
 
        [_wxBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateSelected];
        [_wxBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
        [_wxBtn addTarget:self action:@selector(wxBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _wxBtn;
}

-(void)zfbBtnClick:(UIButton *)zfbSend{
    
    if (!self.zfbBtn.selected) {
        [self.zfbBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
        [self.wxBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
        self.zfbBtn.selected =YES;
        self.wxBtn.selected =NO;
    }
    
}
-(void)wxBtnClick:(UIButton *)wxSend{
    if (!self.wxBtn.selected) {
        self.zfbBtn.selected =NO;
        self.wxBtn.selected =YES;
        [self.wxBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
        [self.zfbBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
       
    }
}

@end
