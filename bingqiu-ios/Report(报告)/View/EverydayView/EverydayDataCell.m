//
//  EverydayDataCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/31.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "EverydayDataCell.h"

@implementation EverydayDataCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.dateLab];
        [self.contentView addSubview:self.bg_list_Img];
//        [self.contentView addSubview:self.coachLab];
        
        [self.bg_list_Img addSubview:self.titleLab];
        [self.bg_list_Img addSubview:self.trainTime];
        [self.bg_list_Img addSubview:self.timeLab];
        [self.bg_list_Img addSubview:self.slideDistance];
        [self.bg_list_Img addSubview:self.meterLab];
        
        [self addLayOut];
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(30);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.right.equalTo(weakself.bg_list_Img.mas_left).with.offset(-12);
        make.height.mas_equalTo(12);
    }];
    [self.bg_list_Img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(30);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
//    [self.coachLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakself.dateLab.mas_bottom).with.offset(5);
//        make.left.mas_equalTo(weakself.dateLab);
//        make.right.mas_equalTo(weakself.dateLab);
//        make.height.mas_equalTo(20);
//    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(13);
        make.left.equalTo(weakself.bg_list_Img.mas_left).with.offset(34);
        make.right.equalTo(weakself.bg_list_Img.mas_right).with.offset(0);
        make.height.mas_equalTo(14);
        
    }];
    [self.trainTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(42);
        make.left.equalTo(weakself.bg_list_Img.mas_left).with.offset(34);
    }];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(66);
        make.left.equalTo(weakself.bg_list_Img.mas_left).with.offset(34);
    }];
    [self.slideDistance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(42);
        make.right.equalTo(weakself.bg_list_Img.mas_right).with.offset(-55);
    }];
    [self.meterLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_list_Img.mas_top).with.offset(66);
        make.left.mas_equalTo(weakself.slideDistance.mas_left);
        make.right.mas_equalTo(weakself.slideDistance.mas_right);
        make.height.mas_equalTo(14);
    }];
}
-(UILabel *)dateLab{
    if (!_dateLab) {
        _dateLab = [UILabel new];
        _dateLab.text = @"2018.07.19";
        _dateLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _dateLab.font = BQFONT(12);
        _dateLab.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLab;
}
-(UIImageView *)bg_list_Img{
    if (!_bg_list_Img) {
        _bg_list_Img = [UIImageView new];
        _bg_list_Img.image = [UIImage imageNamed:@"bg_list"];
    }
    return _bg_list_Img;
}
-(UILabel *)coachLab{
    if (!_coachLab) {
        _coachLab = [UILabel new];
        _coachLab.text = @"教练李小明";
        _coachLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _coachLab.font = BQFONT(12);
        _coachLab.backgroundColor = [UIColor colorWithHexString:@"#09c8b6"];
        _coachLab.layer.masksToBounds = YES;
        _coachLab.layer.cornerRadius = 2;
        _coachLab.textAlignment = NSTextAlignmentCenter;
    }
    return _coachLab;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"您在西三旗一号馆参加了俱乐部预测试测试测试测试";
        _titleLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titleLab.font = BQFONT(14);
    }
    return _titleLab;
}
-(UILabel *)trainTime{
    if (!_trainTime) {
        _trainTime = [UILabel new];
        _trainTime.text = @"训练时间";
        _trainTime.textColor = [UIColor colorWithHexString:@"#666666"];
        _trainTime.font = BQFONT(14);
    }
    return _trainTime;
}
-(UILabel *)slideDistance{
    if (!_slideDistance) {
        _slideDistance = [UILabel new];
        _slideDistance.text = @"滑行距离";
        _slideDistance.textColor = [UIColor colorWithHexString:@"#666666"];
        _slideDistance.font = BQFONT(14);
    }
    return _slideDistance;
}
-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = [UILabel new];
        _timeLab.text = @"17′40″";
        _timeLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _timeLab.font = BQBOLDFONT(14);
    }
    return _timeLab;
}
-(UILabel *)meterLab{
    if (!_meterLab) {
        _meterLab = [UILabel new];
        _meterLab.text = @"3000m";
        _meterLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _meterLab.font = BQBOLDFONT(14);
    }
    return _meterLab;
}
//-(void)setModel:(EverydayTrainDetailModel *)model
//{
//    _model = model;
//    if (_model) {
//        _meterLab.text = model.trainTime;
//    }
//}

@end
