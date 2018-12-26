//
//  FourTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FourTableViewCell.h"

@implementation FourTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.amHour];
        [self.contentView addSubview:self.amTime1];
        [self.contentView addSubview:self.amTime2];
        [self.contentView addSubview:self.pmHour];
        [self.contentView addSubview:self.pmTime1];
        [self.contentView addSubview:self.pmTime2];
        [self.contentView addSubview:self.line];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    FourTableViewCell *fourCell = [tableView dequeueReusableCellWithIdentifier:@"fourCell"];
    if (!fourCell) {
        fourCell = [[FourTableViewCell alloc]init];
    }
    fourCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return fourCell;
}

- (void)addLayOut{
    
    __weak typeof(self) weakself = self;
    
    [self.amHour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.amTime1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.amHour.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    
    [self.amTime2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.amTime1.mas_bottom).with.offset(5);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    
    [self.pmHour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.amTime2.mas_bottom).with.offset(30);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    
    [self.pmTime1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.pmHour.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.pmTime2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.pmTime1.mas_bottom).with.offset(5);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
        
    }];
}
-(UILabel *)amHour{
    if (!_amHour) {
        _amHour = [UILabel new];
        _amHour.text = @"上午课时";
        _amHour.textColor = [UIColor colorWithHexString:@"#333333"];
        _amHour.font = BQBOLDFONT(16);
    }
    return _amHour;
}
-(UILabel *)amTime1{
    if (!_amTime1) {
        _amTime1 = [UILabel new];
        _amTime1.text = @"09:00~10:30 A组冰上&B组陆地";
        _amTime1.textColor = [UIColor colorWithHexString:@"#333333"];
        _amTime1.font = BQFONT(13);
        [_amTime1 sizeToFit];
    }
    return _amTime1;
}
-(UILabel *)amTime2{
    if (!_amTime2) {
        _amTime2 = [UILabel new];
        _amTime2.text = @"10:30~12:00 B组冰上&A组陆地";
        _amTime2.textColor = [UIColor colorWithHexString:@"#333333"];
        _amTime2.font = BQFONT(13);
        [_amTime2 sizeToFit];
    }
    return _amTime2;
}
-(UILabel *)pmHour{
    if (!_pmHour) {
        _pmHour = [UILabel new];
        _pmHour.text = @"下午课时";
        _pmHour.textColor = [UIColor colorWithHexString:@"#333333"];
        _pmHour.font = BQBOLDFONT(16);
    }
    return _pmHour;
}

-(UILabel *)pmTime1{
    if (!_pmTime1) {
        _pmTime1 = [UILabel new];
        _pmTime1.text = @"14:00~15:30 A组冰上&B组陆地";
        _pmTime1.textColor = [UIColor colorWithHexString:@"#333333"];
        _pmTime1.font = BQFONT(13);
        [_pmTime1 sizeToFit];
    }
    return _pmTime1;
}
-(UILabel *)pmTime2{
    if (!_pmTime2) {
        _pmTime2 = [UILabel new];
        _pmTime2.text = @"16:00~17:30 B组冰上&A组陆地";
        _pmTime2.textColor = [UIColor colorWithHexString:@"#333333"];
        _pmTime2.font = BQFONT(13);
        [_pmTime2 sizeToFit];
    }
    return _pmTime2;
}
-(UILabel *)line{
    if (!_line) {
        _line = [UILabel new];
        _line.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _line;
}
@end
