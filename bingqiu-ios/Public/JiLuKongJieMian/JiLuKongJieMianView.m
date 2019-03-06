//
//  JiLuKongJieMianView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiLuKongJieMianView.h"

@implementation JiLuKongJieMianView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - NAVIGATION_BAR_HEIGHT);
        self.backgroundColor = [UIColor colorWithHexString:@"#f8f8f8"];
        
        [self addSubview:self.titleLab];
        
        [self addLayOut];
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(weakself.mas_centerX);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"暂时没有相关记录";
        _titleLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titleLab.font = BQFONT(16);
    }
    return _titleLab;
}
-(void)showCustomView:(UIView *)view{
    if (!view) {
        return;
    }
    [view addSubview:self];
}

@end
