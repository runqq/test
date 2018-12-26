//
//  HeaderView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/25.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.goBackBtn];
        [self addSubview:self.titlLab];
        [self addSubview:self.cupImg]; // 奖杯imageView
        [self addSubview:self.zhuLab];
        [self addSubview:self.fuLab];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    
    __weak typeof(self) weakself = self;
    [self.goBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(32);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.bottom.mas_equalTo(weakself.titlLab.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.titlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(32);
        make.centerX.mas_equalTo(weakself.mas_centerX);
    }];
    [self.cupImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(74);
        make.left.equalTo(weakself.mas_left).with.offset(20);
    }];
    [self.zhuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(98);
        make.left.mas_equalTo(weakself.cupImg.mas_right).with.offset(31);
    }];
    [self.fuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.cupImg.mas_right).with.offset(32);
        make.bottom.mas_equalTo(weakself.cupImg.mas_bottom);
    }];
    
}

-(UIButton *)goBackBtn{
    if (!_goBackBtn) {
        _goBackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goBackBtn setImage:[UIImage imageNamed:@"nav_back_white"] forState:UIControlStateNormal];
    }
    return _goBackBtn;
}
-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [UILabel new];
        _titlLab.text = @"我的勋章";
        _titlLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _titlLab.font = BQBOLDFONT(20);
        [_titlLab sizeToFit];
    }
    return _titlLab;
}
-(UIImageView *)cupImg{
    if (!_cupImg) {
        _cupImg = [[UIImageView alloc]init];
        _cupImg.image = [UIImage imageNamed:@"medal_top_photo"];
    }
    return _cupImg;
}
-(UILabel *)zhuLab{
    if (!_zhuLab) {
        _zhuLab = [UILabel new];
        _zhuLab.text = @"已获得3个勋章";
        _zhuLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _zhuLab.font = BQBOLDFONT(20);
        [_zhuLab sizeToFit];
    }
    return _zhuLab;
}
-(UILabel *)fuLab{
    if (!_fuLab) {
        _fuLab = [UILabel new];
        _fuLab.text = @"马上运动起来,解锁你的第4块勋章";
        _fuLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _fuLab.font = BQFONT(14);
        [_fuLab sizeToFit];
    }
    return _fuLab;
}

@end
