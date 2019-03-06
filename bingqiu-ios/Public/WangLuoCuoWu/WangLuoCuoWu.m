//
//  WangLuoCuoWu.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "WangLuoCuoWu.h"

@implementation WangLuoCuoWu

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - NAVIGATION_BAR_HEIGHT);
        self.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8"];
        
        [self addSubview:self.img];
        [self addSubview:self.titleLab];
        [self addSubview:self.refreshBtn];
        
        [self addLayOut];
        
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(180);
        make.centerX.equalTo(weakself.mas_centerX);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.img.mas_bottom).with.offset(20);
        make.centerX.equalTo(weakself.mas_centerX);
    }];
    [self.refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titleLab.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakself.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(61, 32));
    }];
    
    
}
-(UIImageView *)img{
    if (!_img) {
        _img = [[UIImageView alloc]init];
        _img.image = [UIImage imageNamed:@"icon_networkerror"];
    }
    return _img;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"网络正在开小差";
        _titleLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titleLab.font = BQFONT(14);
        [_titleLab sizeToFit];
    }
    return _titleLab;
}
-(UIButton *)refreshBtn{
    if (!_refreshBtn) {
        _refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_refreshBtn setTitle:@"点击刷新" forState:UIControlStateNormal];
        _refreshBtn.titleLabel.font = BQFONT(14);
        [_refreshBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
        _refreshBtn.layer.masksToBounds = YES;
        _refreshBtn.layer.cornerRadius = 3;
        _refreshBtn.layer.borderWidth = 0.5;
        _refreshBtn.layer.borderColor = [UIColor colorWithHexString:@"#188bf0"].CGColor;
    }
    return _refreshBtn;
}
-(void)showCustomNetWorkErrorView:(UIView *)view{
    if (!view) {
        return;
    }
    [view addSubview:self];
}
@end
