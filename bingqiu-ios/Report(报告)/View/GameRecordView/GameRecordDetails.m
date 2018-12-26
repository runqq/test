//
//  GameRecordDetails.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/30.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "GameRecordDetails.h"

@implementation GameRecordDetails

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.timeLab];
        [self.contentView addSubview:self.bg_list_Img];
        [self.contentView addSubview:self.titlLab];
        [self.contentView addSubview:self.firTeam];
        [self.contentView addSubview:self.firNum];
        [self.contentView addSubview:self.secTeam];
        [self.contentView addSubview:self.secNum];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(30);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.right.equalTo(weakself.bg_list_Img.mas_left).with.offset(-12);
        make.height.mas_equalTo(12);
    }];
    [self.bg_list_Img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(30);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
    [self.titlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(13);
        make.left.equalTo(weakself.bg_list_Img.mas_left).with.offset(34);
    }];
    [self.firTeam mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(42);
        make.left.equalTo(weakself.bg_list_Img.mas_left).with.offset(34);
    }];
    [self.firNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(42);
        make.right.equalTo(weakself.bg_list_Img.mas_right).with.offset(-20);
    }];
    [self.secTeam mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(66);
        make.left.equalTo(weakself.bg_list_Img.mas_left).with.offset(34);
    }];
    [self.secNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(66);
        make.right.equalTo(weakself.bg_list_Img.mas_right).with.offset(-20);
        make.size.mas_equalTo(CGSizeMake(50, 14));
    }];
}

-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = [UILabel new];
        _timeLab.text = @"2018.07.19";
        _timeLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _timeLab.font = BQFONT(12);
        _timeLab.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLab;
}
-(UIImageView *)bg_list_Img{
    if (!_bg_list_Img) {
        _bg_list_Img = [UIImageView new];
        _bg_list_Img.image = [UIImage imageNamed:@"bg_list"];
    }
    return _bg_list_Img;
}
-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [UILabel new];
        _titlLab.text = @"您在黄港二号馆参加了一场比赛";
        _titlLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titlLab.font = BQFONT(14);
        
    }
    return _titlLab;
}
-(UILabel *)firTeam{
    if (!_firTeam) {
        _firTeam = [UILabel new];
        _firTeam.text = @"华星U14红队";
        _firTeam.textColor = [UIColor colorWithHexString:@"#333333"];
        _firTeam.font = BQFONT(14);
    }
    return _firTeam;
}
-(UILabel *)firNum{
    if (!_firNum) {
        _firNum = [UILabel new];
        _firNum.text = @"11";
        _firNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _firNum.font = BQBOLDFONT(14);
    }
    return _firNum;
}
-(UILabel *)secTeam{
    if (!_secTeam) {
        _secTeam = [UILabel new];
        _secTeam.text = @"韩国槿明U14红队";
        _secTeam.textColor = [UIColor colorWithHexString:@"#333333"];
        _secTeam.font = BQFONT(14);
    }
    return _secTeam;
}
-(UILabel *)secNum{
    if (!_secNum) {
        _secNum = [UILabel new];
        _secNum.text = @"3";
        _secNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _secNum.font = BQBOLDFONT(14);
        _secNum.textAlignment = NSTextAlignmentRight;
    }
    return _secNum;
}


@end
