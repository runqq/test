//
//  XingQiuView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XingQiuView.h"

@implementation XingQiuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.topLine];
        [self addSubview:self.leftImg];
        [self addSubview:self.leftLab];
        [self addSubview:self.rightImg];
        [self addSubview:self.rightLab];
        [self addSubview:self.rightBtn];
        [self addSubview:self.bottomLine];
        
        [self addLayOut];
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.centerY.equalTo(weakself.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.leftImg.mas_right).with.offset(12);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.centerY.equalTo(weakself.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(10, 14));
    }];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.rightImg.mas_left).with.offset(-10);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).with.offset(-10);
        make.centerY.equalTo(weakself.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    
}
-(UILabel *)topLine{
    if (!_topLine) {
        _topLine = [[UILabel alloc]init];
        _topLine.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _topLine;
}
-(UIImageView *)leftImg{
    if (!_leftImg) {
        _leftImg = [[UIImageView alloc]init];
        _leftImg.image = [UIImage imageNamed:@"icon_renewal_xingqiuvip"];
    }
    return _leftImg;
}
-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.text = @"星球VIP续费";
        _leftLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _leftLab.font = BQFONT(16);
        _leftLab.userInteractionEnabled = YES;
    }
    return _leftLab;
}
-(UIImageView *)rightImg{
    if (!_rightImg) {
        _rightImg = [[UIImageView alloc]init];
        _rightImg.image = [UIImage imageNamed:@"arrow_right_black"];
    }
    return _rightImg;
}
-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = [UILabel new];
        _rightLab.text = @"数据改变生活";
        _rightLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _rightLab.font = BQFONT(14);
        _rightLab.userInteractionEnabled = YES;
    }
    return _rightLab;
}
- (UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _rightBtn;
}
-(UILabel *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UILabel alloc]init];
        _bottomLine.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _bottomLine;
}

@end
