//
//  MineThreeTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MineThreeTableViewCell.h"

@implementation MineThreeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.leftLab];
        [self.contentView addSubview:self.leftNumLab];
        [self.contentView addSubview:self.leftLineLab];
        [self.contentView addSubview:self.middleLab];
        [self.contentView addSubview:self.middleNumLab];
        [self.contentView addSubview:self.rightLineLab];
        [self.contentView addSubview:self.rightLab];
        [self.contentView addSubview:self.rightNumLab];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWitTableView:(UITableView *)tableview{
    
    MineThreeTableViewCell *threeCell = [tableview dequeueReusableCellWithIdentifier:@"threeCell"];
    if (!threeCell) {
        threeCell = [[MineThreeTableViewCell alloc]init];
    }
    threeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return threeCell;
    
}

- (void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(15);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(50);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.right.equalTo(weakself.leftLineLab.mas_left).with.offset(0);
        make.height.mas_equalTo(14);
    }];
    [self.leftNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.leftLab.mas_bottom).with.offset(10);
        make.left.mas_equalTo(weakself.leftLab);
        make.right.mas_equalTo(weakself.leftLab);
    }];
    [self.leftLineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(44);
        make.left.equalTo(weakself.mas_left).with.offset(SCREEN_W/3);
        make.size.mas_equalTo(CGSizeMake(0.5, 45));
    }];
    [self.middleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(50);
        make.left.equalTo(weakself.leftLineLab.mas_right).with.offset(0);
        make.right.equalTo(weakself.rightLineLab.mas_left).with.offset(0);
        make.height.mas_equalTo(14);
    }];
    [self.middleNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.middleLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.middleLab);
        make.right.equalTo(weakself.middleLab);
    }];
    [self.rightLineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(44);
        make.left.equalTo(weakself.mas_left).with.offset((SCREEN_W/3)*2);
        make.size.mas_equalTo(CGSizeMake(0.5, 45));
    }];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(47);
        make.left.mas_equalTo(weakself.rightLineLab.mas_right).with.offset(0);
        make.right.equalTo(weakself.mas_right).with.offset(0);
    }];
    [self.rightNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.rightLab.mas_bottom).with.offset(8);
        make.left.equalTo(weakself.rightLab);
        make.right.equalTo(weakself.rightLab);
    }];
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"奖学金";
        _titleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLab.font = BQBOLDFONT(16);
        [_titleLab sizeToFit];
        
    }
    return _titleLab;
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.text = @"合计(元)";
        _leftLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _leftLab.font = BQFONT(14);
        _leftLab.textAlignment = NSTextAlignmentCenter;
    }
    return _leftLab;
}

-(UILabel *)leftNumLab{
    if (!_leftNumLab) {
        _leftNumLab = [UILabel new];
        _leftNumLab.text = @"0.00";
        _leftNumLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _leftNumLab.font = BQBOLDFONT(14);
        _leftNumLab.textAlignment = NSTextAlignmentCenter;
    }
    return _leftNumLab;
}

-(UILabel *)leftLineLab{
    if (!_leftLineLab) {
        _leftLineLab = [UILabel new];
        _leftLineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _leftLineLab;
}

-(UILabel *)middleLab{
    if (!_middleLab) {
        _middleLab = [UILabel new];
        _middleLab.text = @"已用(元)";
        _middleLab.textAlignment = NSTextAlignmentCenter;
        _middleLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _middleLab.font = BQFONT(14);
    }
    return _middleLab;
}

-(UILabel *)middleNumLab{
    if (!_middleNumLab) {
        _middleNumLab = [UILabel new];
        _middleNumLab.text = @"0.00";
        _middleNumLab.textAlignment = NSTextAlignmentCenter;
        _middleNumLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _middleNumLab.font = BQBOLDFONT(14);
    }
    return _middleNumLab;
}

-(UILabel *)rightLineLab{
    if (!_rightLineLab) {
        _rightLineLab = [UILabel new];
        _rightLineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _rightLineLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = [UILabel new];
        _rightLab.text = @"可用(元)";
        _rightLab.textAlignment = NSTextAlignmentCenter;
        _rightLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _rightLab.font = BQFONT(14);
        
    }
    return _rightLab;
}

-(UILabel *)rightNumLab{
    if (!_rightNumLab) {
        _rightNumLab = [UILabel new];
        _rightNumLab.text = @"0.00";
        _rightNumLab.textAlignment = NSTextAlignmentCenter;
        _rightNumLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _rightNumLab.font = BQBOLDFONT(14);
        
    }
    return _rightNumLab;
}


@end
