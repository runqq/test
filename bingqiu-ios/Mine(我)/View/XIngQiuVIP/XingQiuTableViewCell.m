//
//  XingQiuTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XingQiuTableViewCell.h"

@implementation XingQiuTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.bImg];
        [self.bImg addSubview:self.touXiangImg];
        [self.bImg addSubview:self.nameLab];
        [self.bImg addSubview:self.accountLab];
        [self.bImg addSubview:self.monthLab];
        [self.bImg addSubview:self.vipLab];
        [self.bImg addSubview:self.timeLab];
        
        [self createUI];
    }
    return self;
}
-(void)createUI{
    __weak typeof(self) weakSelf = self;
    [self.bImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.right.equalTo(weakSelf.mas_right);
    }];
    [self.touXiangImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(31);;
        make.left.equalTo(weakSelf.mas_left).with.offset(29);
        make.size.mas_equalTo(CGSizeMake(62, 62));
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(43);;
        make.left.equalTo(weakSelf.touXiangImg.mas_right).with.offset(10);
    }];
    [self.accountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.nameLab.mas_bottom).with.offset(10);;
        make.left.equalTo(weakSelf.touXiangImg.mas_right).with.offset(10);
    }];
    [self.monthLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(43);;
        make.left.equalTo(weakSelf.mas_left).with.offset(210);
    }];
    [self.vipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.monthLab.mas_bottom).with.offset(10);;
        make.left.equalTo(weakSelf.mas_left).with.offset(210);
    }];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.touXiangImg.mas_bottom).with.offset(37);;
        make.left.equalTo(weakSelf.mas_left).with.offset(30);
    }];
    
    
}
-(UIImageView *)bImg{
    if (!_bImg) {
        _bImg = [UIImageView new];
        _bImg.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        _bImg.image = [UIImage imageNamed:@"bg_use_xingqiuvip"];
    }
    return _bImg;
}
-(UIImageView *)touXiangImg{
    if (!_touXiangImg) {
        _touXiangImg = [UIImageView new];
        _touXiangImg.image = [UIImage imageNamed:@"photo_woman_nor"];
    }
    return _touXiangImg;
}
-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [UILabel new];
        _nameLab.text = @"张小红";
        _nameLab.font = BQFONT(16);
        _nameLab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _nameLab;
}
-(UILabel *)accountLab{
    if (!_accountLab) {
        _accountLab = [UILabel new];
        _accountLab.text = @"账户";
        _accountLab.font = BQFONT(14);
        _accountLab.textColor = [UIColor colorWithHexString:@"#666666"];
    }
    return _accountLab;
}
-(UILabel *)monthLab{
    if (!_monthLab) {
        _monthLab = [UILabel new];
        _monthLab.text = @"一个月";
        _monthLab.font = BQFONT(16);
        _monthLab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _monthLab;
}
-(UILabel *)vipLab{
    if (!_vipLab) {
        _vipLab = [UILabel new];
        _vipLab.text = @"会员套餐";
        _vipLab.font = BQFONT(14);
        _vipLab.textColor = [UIColor colorWithHexString:@"#666666"];
    }
    return _vipLab;
}
-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = [UILabel new];
        _timeLab.text = @"使用时间: 2018-12-24到2019-1-23";
        _timeLab.font = BQFONT(12);
        _timeLab.textColor = [UIColor colorWithHexString:@"#999999"];
    }
    return _timeLab;
}
@end
