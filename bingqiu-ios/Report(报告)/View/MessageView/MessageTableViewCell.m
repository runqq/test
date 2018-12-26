//
//  MessageTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/30.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.photoImg];
        [self.contentView addSubview:self.titlLab];
        [self.contentView addSubview:self.subLab];
        [self.contentView addSubview:self.dateLab];
        
        [self addLayOut];
        
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.photoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(13);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(48, 48));
    }];
    [self.titlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(17);
        make.left.equalTo(weakself.photoImg.mas_right).with.offset(15);
    }];
    [self.subLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titlLab.mas_bottom).with.offset(5);
        make.left.equalTo(weakself.photoImg.mas_right).with.offset(15);
//        make.bottom.equalTo(weakself.mas_bottom).with.offset(-17);
    }];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(19);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
}

-(UIImageView *)photoImg{
    if (!_photoImg) {
        _photoImg = [UIImageView new];
        _photoImg.image = [UIImage imageNamed:@"system_mes_icon"];
    }
    return _photoImg;
}
-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [UILabel new];
        _titlLab.text = @"系统";
        _titlLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titlLab.font = BQFONT(16);
    }
    return _titlLab;
}
-(UILabel *)subLab{
    if (!_subLab) {
        _subLab = [UILabel new];
        _subLab.text = @"您7月15号的训练数据出炉了,不来看看自己...";
        _subLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _subLab.font = BQFONT(14);
        [_subLab sizeToFit];
    }
    return _subLab;
}
-(UILabel *)dateLab{
    if (!_dateLab) {
        _dateLab = [UILabel new];
        _dateLab.text = @"2018.07.19";
        _dateLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _dateLab.font = BQFONT(14);
    }
    return _dateLab;
}

@end
