//
//  ThirTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ThirTableViewCell.h"

@implementation ThirTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.trainTimeLab];
        [self.contentView addSubview:self.trainDateLab];
        [self.contentView addSubview:self.applyTimeLab];
        [self.contentView addSubview:self.applyDateLab];
        [self.contentView addSubview:self.lineLab];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    ThirTableViewCell *thirCell = [tableView dequeueReusableCellWithIdentifier:@"thirCell"];
    if (!thirCell) {
        thirCell = [[ThirTableViewCell alloc]init];
    }
    thirCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return thirCell;
}

- (void)addLayOut{
    
    __weak typeof(self) weakself = self;
    [self.trainTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.trainDateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.trainTimeLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.applyTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(202);
    }];
    [self.applyDateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.applyTimeLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(202);
    }];
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
}
-(UILabel *)trainTimeLab{
    if (!_trainTimeLab) {
        _trainTimeLab = [UILabel new];
        _trainTimeLab.text = @"训练时间";
    }
    return _trainTimeLab;
}
-(UILabel *)trainDateLab{
    if (!_trainDateLab) {
        _trainDateLab = [UILabel new];
        _trainDateLab.text = @"1月19日-2月2日";
        _trainDateLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _trainDateLab.font = BQFONT(13);
        [_trainDateLab sizeToFit];
    }
    return _trainDateLab;
}

-(UILabel *)applyTimeLab{
    if (!_applyTimeLab) {
        _applyTimeLab = [UILabel new];
        _applyTimeLab.text = @"报名时间";
    }
    return _applyTimeLab;
}
-(UILabel *)applyDateLab{
    if (!_applyDateLab) {
        _applyDateLab = [UILabel new];
        _applyDateLab.text = @"即日起至2月2日";
        _applyDateLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _applyDateLab.font = BQFONT(13);
        [_applyDateLab sizeToFit];
    }
    return _applyDateLab;
}
-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}




@end
