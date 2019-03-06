//
//  TwoView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TwoView.h"

@implementation TwoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titLab];
        [self addSubview:self.textField];
        
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
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(345, 44));
    }];
    
}
-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [[UILabel alloc]init];
        _titLab.text = @"邀请码 (选填)";
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQFONT(16);
    }
    return _titLab;
}
-(UITextField *)textField{
    if (!_textField) {
        _textField = [UITextField new];
        _textField.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        _textField.placeholder = @"请在此输入邀请码";
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 3;
        
        UIView *zwView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 44)];
        _textField.leftView = zwView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        
    }
    return _textField;
}
@end
