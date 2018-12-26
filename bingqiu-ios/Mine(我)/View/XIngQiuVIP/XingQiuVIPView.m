//
//  XingQiuVIPView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XingQiuVIPView.h"

@implementation XingQiuVIPView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.leftLab];
        [self addSubview:self.rightBtn];
        [self addSubview:self.dateBtn];
        
        [self addLayOut];
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.mas_centerY);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(68, 26));
    }];
    [self.dateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.mas_centerY);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
}
-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [[UILabel alloc]init];
        _leftLab.text = @"星球VIP";
        _leftLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _leftLab.font = BQBOLDFONT(16);
    }
    return _leftLab;
}
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc]init];
        _rightBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        _rightBtn.layer.masksToBounds = YES;
        _rightBtn.layer.cornerRadius = 3;
        [_rightBtn setTitle:@"立即开通" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = BQFONT(12);
    }
    return _rightBtn;
}
-(UIButton *)dateBtn{
    if (!_dateBtn) {
        _dateBtn = [[UIButton alloc]init];
        _dateBtn.hidden = YES;
        _dateBtn.layer.masksToBounds = YES;
        _dateBtn.layer.cornerRadius = 3;
        [_dateBtn setTitle:@"2018-12-23到期" forState:UIControlStateNormal];
        [_dateBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
        _dateBtn.titleLabel.font = BQFONT(16);
        [_dateBtn sizeToFit];
    }
    return _dateBtn;
}
@end
