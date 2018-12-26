//
//  PasswordLoginView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/6.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "PasswordLoginView.h"

@implementation PasswordLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.bgView];
        
        [self.bgView addSubview:self.mobileTF];
        [self.bgView addSubview:self.firLab];
        [self.bgView addSubview:self.passwordTF];
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
    [self.mobileTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(0);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(40);
    }];
    [self.firLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mobileTF.mas_bottom).with.offset(17);
        make.centerX.equalTo(weakself.bgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W - 80, 0.5));
    }];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.firLab.mas_bottom).with.offset(17);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(40);
    }];
    [self.secLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.passwordTF.mas_bottom).with.offset(17);
        make.centerX.equalTo(weakself.bgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W - 80, 0.5));
    }];
}

-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

-(UITextField *)mobileTF{
    if (!_mobileTF) {
        // 电话输入框
        _mobileTF = [UITextField new];
        _mobileTF.placeholder = @"请输入11位手机号";
        _mobileTF.textColor = [UIColor colorWithHexString:@"#333333"];
        _mobileTF.font = BQFONT(16);
        _mobileTF.borderStyle = UITextBorderStyleNone;
        // 调用系统键盘
        _mobileTF.keyboardType = UIKeyboardTypePhonePad;
    }
    return _mobileTF;
}
-(UILabel *)firLab{
    if (!_firLab) {
        _firLab = [UILabel new];
        _firLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _firLab;
}
-(UITextField *)passwordTF{
    if (!_passwordTF) {
        // 密码输入框
        _passwordTF = [UITextField new];
        _passwordTF.placeholder = @"请输入密码";
        _passwordTF.secureTextEntry = YES;
        _passwordTF.textColor = [UIColor colorWithHexString:@"#333333"];
        _passwordTF.font = BQFONT(16);
        _passwordTF.borderStyle = UITextBorderStyleNone;
//        _passwordTF.hidden = YES;
    }
    return _passwordTF;
}
-(UILabel *)secLab{
    if (!_secLab) {
        _secLab = [UILabel new];
        _secLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _secLab;
}

@end
