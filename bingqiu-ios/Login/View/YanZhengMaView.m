//
//  YanZhengMaView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/6.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "YanZhengMaView.h"

@implementation YanZhengMaView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.bgView];
        
        [self.bgView addSubview:self.numberTF];
        [self.bgView addSubview:self.firLab];
        [self.bgView addSubview:self.mimaTF];
        [self.bgView addSubview:self.verifyBtn];
        [self.bgView addSubview:self.secLab];
        
        [self addLayOut];
        
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 84));
        
    }];
    [self.numberTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(0);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(40);
    }];
    [self.firLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.numberTF.mas_bottom).with.offset(17);
        make.centerX.equalTo(weakself.bgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W - 80, 0.5));
    }];
    
    [self.mimaTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.firLab.mas_bottom).with.offset(17);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(40);
    }];
    
    [self.verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.firLab.mas_bottom).with.offset(13);
        make.right.equalTo(weakself.bgView.mas_right).with.offset(-40);
        make.size.mas_equalTo(CGSizeMake(84, 30));
    }];
    
    [self.secLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mimaTF.mas_bottom).with.offset(17);
        make.centerX.equalTo(weakself.bgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W - 80, 0.5));
    }];
    
    
}

-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.userInteractionEnabled = YES;
//        _bgView.backgroundColor = [UIColor yellowColor];
    }
    return _bgView;
}

-(UITextField *)numberTF{
    if (!_numberTF) {
        // 电话输入框
        _numberTF = [UITextField new];
        _numberTF.textColor = [UIColor colorWithHexString:@"#333333"];
        _numberTF.font = BQFONT(16);
        _numberTF.placeholder = @"请输入11位手机号";
        _numberTF.borderStyle = UITextBorderStyleNone;
        // 调用系统键盘
        _numberTF.keyboardType = UIKeyboardTypePhonePad;
    }
    return _numberTF;
}
-(UILabel *)firLab{
    if (!_firLab) {
        _firLab = [UILabel new];
        _firLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _firLab;
}
-(UITextField *)mimaTF{
    if (!_mimaTF) {
        // 验证码输入框
        _mimaTF = [UITextField new];
        _mimaTF.textColor = [UIColor colorWithHexString:@"#333333"];
        _mimaTF.font = BQFONT(16);
        _mimaTF.placeholder = @"请输入验证码";
        _mimaTF.borderStyle = UITextBorderStyleNone;
        // 调用系统键盘
        _mimaTF.keyboardType = UIKeyboardTypePhonePad;
    }
    return _mimaTF;
}
-(UIButton *)verifyBtn{
    if (!_verifyBtn) {
        // 获取验证码按钮
        _verifyBtn = [UIButton new];
        _verifyBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        [_verifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_verifyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _verifyBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        _verifyBtn.layer.masksToBounds = YES;
        _verifyBtn.layer.cornerRadius = 15;
        
    }
    return _verifyBtn;
}
-(UILabel *)secLab{
    if (!_secLab) {
        _secLab = [UILabel new];
        _secLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _secLab;
}

@end
