//
//  OneView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "OneView.h"

@implementation OneView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.photoImg];
        [self addSubview:self.nameLab];
        [self addSubview:self.subLab];
        [self addSubview:self.dateLab];
        
        [self addLayOut];
        
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.photoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.centerY.equalTo(weakself.mas_centerY);
//        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(18);
        make.left.equalTo(weakself.photoImg.mas_right).with.offset(12);
    }];
    [self.subLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.nameLab.mas_bottom).with.offset(3);
        make.left.equalTo(weakself.nameLab.mas_left);
    }];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakself.mas_centerY);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
    
}
-(UIImageView *)photoImg{
    if (!_photoImg) {
        _photoImg = [UIImageView new];
        _photoImg.image = [UIImage imageNamed:@"icon_xingqiuvip"];
    }
    return _photoImg;
}
-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.text = @"张小红";
        _nameLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _nameLab.font = BQFONT(18);
    }
    return _nameLab;
}
-(UILabel *)subLab{
    if (!_subLab) {
        _subLab = [[UILabel alloc]init];
        _subLab.text = @"当前账户";
        _subLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _subLab.font = BQFONT(14);
    }
    return _subLab;
}
-(UILabel *)dateLab{
    if (!_dateLab) {
        _dateLab = [UILabel new];
        _dateLab.text = @"2019-01-23到期";
        _dateLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _dateLab.font = BQFONT(16);
        [_dateLab sizeToFit];
    }
    return _dateLab;
        
}
@end
