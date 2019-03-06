//
//  BiDuAndVideoKongJieMian.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "BiDuAndVideoKongJieMian.h"

@implementation BiDuAndVideoKongJieMian

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, SCREEN_H-220, SCREEN_W, 240);
        self.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
        
        [self addSubview:self.img];
        [self addSubview:self.titleLab];
        
        [self addLayOut];
        
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(45);
        make.centerX.equalTo(weakself.mas_centerX);
    }];
    
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(45);
        make.right.equalTo(weakself.titleLab.mas_left).with.offset(-10);
    }];
    
}
-(UIImageView *)img{
    if (!_img) {
        _img = [[UIImageView alloc]init];
        _img.image = [UIImage imageNamed:@"icon_article_empty"];
    }
    return _img;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
        _titleLab.text = @"暂时没有相关文章";
        _titleLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titleLab.font = BQFONT(16);
        [_titleLab sizeToFit];
    }
    return _titleLab;
}
-(void)showCustomBiDuAndVideoKongJieMianView:(UIView *)view{
    if (!view) {
        return;
    }
    [view addSubview:self];
}

@end
