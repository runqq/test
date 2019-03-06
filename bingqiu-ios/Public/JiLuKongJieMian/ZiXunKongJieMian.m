//
//  ZiXunKongJieMian.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ZiXunKongJieMian.h"

@implementation ZiXunKongJieMian

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, NAVIGATION_BAR_HEIGHT + 44, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT - 44);
        self.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
        
        [self addSubview:self.img];
        [self addSubview:self.titleLab];
        
        [self addLayOut];
        
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(40);
        make.centerX.equalTo(weakself.mas_centerX);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.img.mas_bottom).with.offset(10);
        make.centerX.equalTo(weakself.mas_centerX);
    }];
    
    
}
-(UIImageView *)img{
    if (!_img) {
        _img = [[UIImageView alloc]init];
        _img.image = [UIImage imageNamed:@"icon_information_empty"];
    }
    return _img;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"暂时没有相关资讯";
        _titleLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titleLab.font = BQFONT(16);
        [_titleLab sizeToFit];
    }
    return _titleLab;
}
-(void)showCustomZiXunKongJieMianView:(UIView *)view{
    if (!view) {
        return;
    }
    [view addSubview:self];
}

@end
