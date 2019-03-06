//
//  RecordTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "RecordTableViewCell.h"

@implementation RecordTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self addSubview:self.bImg];
        
        [self.bImg addSubview:self.nameLab]; // BDLDKK0069
        [self.bImg addSubview:self.stateLab];// 使用中
        [self.bImg addSubview:self.cardLab]; // 冰上兴趣课卡
        [self.bImg addSubview:self.cardCountLab]; // 1000.0
        
        [self.bImg addSubview:self.knotLab]; // 总节数
        [self.bImg addSubview:self.usedLab]; // 已使用
        [self.bImg addSubview:self.surplusLab]; // 剩余
        
        [self.bImg addSubview:self.knotCountLab];
        [self.bImg addSubview:self.usedCountLab];
        [self.bImg addSubview:self.surplusCountLab];
        
        [self createUI];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableview{
    RecordTableViewCell *recordCell = [tableview dequeueReusableCellWithIdentifier:@"recordCell"];
    if (!recordCell) {
        recordCell = [[RecordTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"recordCell"];
    }
    recordCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return recordCell;
}

- (void)createUI{
    
    __weak typeof(self) weakSelf = self;
    
    [self.bImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(0);
        make.left.equalTo(weakSelf.mas_left).with.offset(0);
        make.right.equalTo(weakSelf.mas_right).with.offset(0);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(0);
    }];
    // 使用中
    [self.stateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bImg.mas_top).with.offset(21);
        make.right.equalTo(weakSelf.bImg.mas_right).with.offset(-30);
    }];
    // 冰上兴趣课卡
    [self.cardLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.bImg.mas_top).with.offset(30);
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    // 1000.0
    [self.cardCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.cardLab.mas_bottom).with.offset(4);
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    // 总节数
    [self.knotLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.cardCountLab.mas_bottom).with.offset(8);
        make.left.equalTo(weakSelf.bImg.mas_left).with.offset(30);
//        make.size.mas_equalTo(CGSizeMake(100, 13));
    }];
    // 已使用
    [self.usedLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.cardCountLab.mas_bottom).with.offset(8);
//        make.size.mas_equalTo(CGSizeMake(100, 13));
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    // 剩余
    [self.surplusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.cardCountLab.mas_bottom).with.offset(8);
        make.right.equalTo(weakSelf.bImg.mas_right).with.offset(-30);
    }];
    // 总节数对应的数字
    [self.knotCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.knotLab.mas_bottom).with.offset(5);
        make.left.equalTo(weakSelf.bImg.mas_left).with.offset(30);
    }];
    // 已使用对应的数字
    [self.usedCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.usedLab.mas_bottom).with.offset(5);
        make.centerX.equalTo(weakSelf.mas_centerX);
    }];
    // 剩余对应的数字
    [self.surplusCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.surplusLab.mas_bottom).with.offset(5);
        make.right.equalTo(weakSelf.bImg.mas_right).with.offset(-30);
    }];
    // BDLDKK0069
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.usedCountLab.mas_bottom).with.offset(30);
        make.centerX.equalTo(weakSelf.bImg.mas_centerX);
    }];
}

-(UIImageView *)bImg{
    if (!_bImg) {
        _bImg = [UIImageView new];
        _bImg.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        _bImg.image = [UIImage imageNamed:@"bg_card_qimeng"];
    }
    return _bImg;
}

-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc]init];
        _nameLab.text = @"BDLDKK0069";
        _nameLab.font = BQFONT(13);
        _nameLab.textColor = [UIColor colorWithHexString:@"#666666"];
    }
    return _nameLab;
}

-(UILabel *)stateLab{
    if (!_stateLab) {
        _stateLab = [[UILabel alloc]init];
        _stateLab.text = @"使用中";
        _stateLab.font = BQFONT(13);
    }
    return _stateLab;
}
-(UILabel *)cardLab{
    if (!_cardLab) {
        _cardLab = [[UILabel alloc]init];
        _cardLab.text = @"冰上兴趣课卡";
        _cardLab.font = BQFONT(16);
        _cardLab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _cardLab;
}

-(UILabel *)cardCountLab{
    if (!_cardCountLab) {
        _cardCountLab = [[UILabel alloc]init];
        _cardCountLab.text = @"1000.0";
        _cardCountLab.font = BQBOLDFONT(24);
        _cardCountLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
    }
    return _cardCountLab;
}
-(UILabel *)knotLab{
    if (!_knotLab) {
        _knotLab = [[UILabel alloc]init];
        _knotLab.text = @"总节数";
        _knotLab.font = BQFONT(13);
        _knotLab.textColor = [UIColor colorWithHexString:@"#999999"];
    }
    return _knotLab;
}
-(UILabel *)knotCountLab{
    if (!_knotCountLab) {
        _knotCountLab = [[UILabel alloc]init];
        _knotCountLab.text = @"12节";
        _knotCountLab.font = BQFONT(18);
        _knotCountLab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _knotCountLab;
}
-(UILabel *)usedLab{
    if (!_usedLab) {
        _usedLab = [[UILabel alloc]init];
        _usedLab.text = @"已使用";
        _usedLab.font = BQFONT(13);
        _usedLab.textColor = [UIColor colorWithHexString:@"#999999"];
    }
    return _usedLab;
}
-(UILabel *)usedCountLab{
    if (!_usedCountLab) {
        _usedCountLab = [[UILabel alloc]init];
        _usedCountLab.text = @"8节";
        _usedCountLab.font = BQFONT(18);
        _usedCountLab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _usedCountLab;
}

-(UILabel *)surplusLab{
    if (!_surplusLab) {
        _surplusLab = [[UILabel alloc]init];
        _surplusLab.text = @"剩余";
        _surplusLab.font = BQFONT(13);
        _surplusLab.textColor = [UIColor colorWithHexString:@"#999999"];
    }
    return _surplusLab;
}

-(UILabel *)surplusCountLab{
    if (!_surplusCountLab) {
        _surplusCountLab = [[UILabel alloc]init];
        _surplusCountLab.text = @"4节";
        _surplusCountLab.font = BQFONT(18);
        _surplusCountLab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _surplusCountLab;
}

@end
