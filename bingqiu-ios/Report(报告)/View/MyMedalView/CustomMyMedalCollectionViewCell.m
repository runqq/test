//
//  CustomMyMedalCollectionViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CustomMyMedalCollectionViewCell.h"

@implementation CustomMyMedalCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.bigImg];
        [self addSubview:self.zhuLab];
        [self addSubview:self.smallImg];
        [self addSubview:self.fuLab];
     
//        [self addLayOut];
        
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.bigImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset((SCREEN_W/3-70)/2);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    [self.smallImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bigImg.mas_bottom).with.offset(5);
        make.left.equalTo(weakself.mas_left).with.offset((SCREEN_W/3-45)/2);
        make.size.mas_equalTo(CGSizeMake(45, 12));
    }];
    [self.zhuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.smallImg.mas_bottom).with.offset(8);
        make.left.equalTo(weakself.mas_left).with.offset((SCREEN_W/3-100)/2);
        make.size.mas_equalTo(CGSizeMake(100, 16));
    }];
    [self.fuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.zhuLab.mas_bottom).with.offset(8);
        make.left.equalTo(weakself.mas_left).with.offset((SCREEN_W/3-100)/2);
        make.size.mas_equalTo(CGSizeMake(100, 10));
    }];
}
-(UIImageView *)bigImg{
    if (!_bigImg) {
        _bigImg = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_W/3-70)/2, 20, 70, 70)];
    }
    return _bigImg;
}
-(UIImageView *)smallImg{
    if (!_smallImg) {
        _smallImg = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_W/3-45)/2, 95, 45, 12)];
    }
    return _smallImg;
}
-(UILabel *)zhuLab{
    if (!_zhuLab) {
        _zhuLab = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_W/3-100)/2, 120, 100, 20)];
        _zhuLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _zhuLab.textAlignment = NSTextAlignmentCenter;
        _zhuLab.font = BQFONT(16);
    }
    return _zhuLab;
}
-(UILabel *)fuLab{
    if (!_fuLab) {
        _fuLab = [UILabel new];
        _fuLab = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_W/3-100)/2, 145, 100, 15)];
        _fuLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _fuLab.textAlignment = NSTextAlignmentCenter;
        _fuLab.font = BQFONT(10);
    }
    return _fuLab;
}
@end
