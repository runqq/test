//
//  CustomAlertView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/25.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CustomAlertView.h"

@implementation CustomAlertView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
        self.backgroundColor = [UIColor colorWithRed:0. green:0. blue:0. alpha:0.5];
        self.userInteractionEnabled = YES;
        self.bgIMg.center = self.center;
        [self addSubview:self.bgIMg];
        
        [self.bgIMg addSubview:self.titLab];
        [self.bgIMg addSubview:self.cancelBtn];
        [self.bgIMg addSubview:self.tishiOneLab];
        [self.bgIMg addSubview:self.phoneNumTF];
        [self.bgIMg addSubview:self.tishiTwoLab];
        [self.bgIMg addSubview:self.sendBtn];
        
        
        [self layOut];
    }
    return self;
}
-(void)layOut{
    
    __weak typeof(self)weakself = self;
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakself.bgIMg.mas_top).with.offset(15);
        make.centerX.mas_equalTo(weakself.bgIMg.mas_centerX);
    }];
    [self.tishiOneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakself.bgIMg.mas_top).with.offset(65);
        make.left.equalTo(weakself.bgIMg.mas_left).with.offset(15);
    }];
    [self.phoneNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakself.tishiOneLab.mas_bottom).with.offset(15);
        make.left.equalTo(weakself.bgIMg.mas_left).with.offset(15);
        make.right.equalTo(weakself.bgIMg.mas_right).with.offset(-15);
        make.height.mas_equalTo(44);
    }];
    [self.tishiTwoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakself.phoneNumTF.mas_bottom).with.offset(15);
        make.left.equalTo(weakself.bgIMg.mas_left).with.offset(15);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakself.bgIMg.mas_top).with.offset(15);
        make.right.equalTo(weakself.bgIMg.mas_right).with.offset(-15);
    }];
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(weakself.bgIMg.mas_bottom).with.offset(-18);
        make.centerX.mas_equalTo(weakself.bgIMg.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(140, 40));
    }];
    
}
-(UIImageView *)bgIMg{
    if (!_bgIMg) {
        _bgIMg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 345, 254)];
        _bgIMg.image = [UIImage imageNamed:@"bg_windows_camp"];
        _bgIMg.userInteractionEnabled = YES;
    }
    return _bgIMg;
}
-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [UILabel new];
        _titLab.text = @"立即报名";
        _titLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _titLab.font = BQFONT(18);
        [_titLab sizeToFit];
    }
    return _titLab;
}
-(UILabel *)tishiOneLab{
    if (!_tishiOneLab) {
        _tishiOneLab = [UILabel new];
        _tishiOneLab.text = @"请输入您的手机号";
        _tishiOneLab.font = BQFONT(16);
        _tishiOneLab.textColor = [UIColor colorWithHexString:@"#333333"];
        [_tishiOneLab sizeToFit];
    }
    return _tishiOneLab;
}
-(UITextField *)phoneNumTF{
    
    if (!_phoneNumTF) {
        _phoneNumTF = [UITextField new];
        // 点击输入手机号框弹出键盘
        _phoneNumTF.keyboardType = UIKeyboardTypePhonePad;
        _phoneNumTF.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        _phoneNumTF.textColor = [UIColor colorWithHexString:@"#666666"];
        _phoneNumTF.font = BQFONT(18);
        _phoneNumTF.layer.masksToBounds = YES;
        _phoneNumTF.layer.cornerRadius = 5;
        
        UIView  *vv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 44)];
        _phoneNumTF.leftView = vv;
        _phoneNumTF.leftViewMode = UITextFieldViewModeAlways;
        [_phoneNumTF addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _phoneNumTF;
}
-(UILabel *)tishiTwoLab{
    if (!_tishiTwoLab) {
        _tishiTwoLab = [UILabel new];
        _tishiTwoLab.text = @"*我方工作人员会在2个工作日内联系您,请耐心等待";
        _tishiTwoLab.font = BQFONT(13);
        _tishiTwoLab.textColor = [UIColor colorWithHexString:@"#666666"];
        [_tishiTwoLab sizeToFit];
    }
    return _tishiTwoLab;
}
-(UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        [_sendBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_sendBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _sendBtn.titleLabel.font = BQFONT(16);
        _sendBtn.layer.masksToBounds = YES;
        _sendBtn.layer.cornerRadius = 20;
    }
    return _sendBtn;
}

-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setImage:[UIImage imageNamed:@"close_white_window"] forState:UIControlStateNormal];
    }
    return _cancelBtn;
}

-(void)showCustomAlertViewOnView:(UIView *)view{
    if (!view) {
        return;
    }
    [view addSubview:self];
    [view addSubview:self.bgIMg];
}

-(void)dissmissCustomAlertView{
    
    [self removeFromSuperview];
    [self.bgIMg removeFromSuperview];
}
- (void)textFieldDidChange:(UITextField *)textField{
    
    if (textField.text.length >11) {
       NSString  *subStr = [textField.text substringToIndex:11];
       textField.text = subStr;
    }
}

@end
