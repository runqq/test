//
//  ReportTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReportTableViewCell.h"

@implementation ReportTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.bgView];
        
        [self.bgView addSubview:self.leftImg];
        [self.bgView addSubview:self.titlLab];
        [self.bgView addSubview:self.rightBtn];
        [self.bgView addSubview:self.oneLab];
        
        [self.bgView addSubview:self.twoLab];
        [self.bgView addSubview:self.leftNum];
        [self.bgView addSubview:self.timeLab];
        [self.bgView addSubview:self.rightNum];
        [self.bgView addSubview:self.minuteLab];
        
        [self.bgView addSubview:self.threeLab];
        [self.bgView addSubview:self.growImg];
        [self.bgView addSubview:self.growLab];
        [self.bgView addSubview:self.arrowsBtn];
        
        
        CGFloat circleWidth = 160;
        self._circle = [[XLCircleProgress alloc] initWithFrame:CGRectMake(0, 0, circleWidth, circleWidth)];
        self._circle.center = CGPointMake(self.bgView.center.x, 145);
          [self.bgView addSubview:self._circle];
        
        [self addLayOut];
        
    }
    return self;
    
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(18);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(15);
    }];
    [self.titlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(18);
        make.left.equalTo(weakself.leftImg.mas_right).with.offset(10);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(18);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
    [self.oneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(60);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.twoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.oneLab.mas_bottom).with.offset(162);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.leftNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.bottom.equalTo(weakself.twoLab.mas_top).with.offset(-80);
    }];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.bottom.equalTo(weakself.twoLab.mas_top).with.offset(-60);
    }];
    [self.rightNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.twoLab.mas_top).with.offset(-80);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
    [self.minuteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.twoLab.mas_top).with.offset(-60);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
    [self.threeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.bgView.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.growImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(145);
        make.bottom.equalTo(weakself.threeLab.mas_top).with.offset(-12);
    }];
    [self.growLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.growImg.mas_right).with.offset(5);
        make.bottom.equalTo(weakself.threeLab.mas_top).with.offset(-10);
    }];
    [self.arrowsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.threeLab.mas_bottom).with.offset(-5);
        make.right.equalTo(weakself.bgView.mas_right).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 265)];
//        _bgView.backgroundColor = [UIColor redColor];
    }
    return _bgView;
}
-(UIImageView *)leftImg{
    if (!_leftImg) {
        _leftImg = [UIImageView new];
        _leftImg.image = [UIImage imageNamed:@"training_icon_home"];
    }
    return _leftImg;
}
-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [UILabel new];
        _titlLab.text = @"训练数据";
        _titlLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titlLab.font = BQBOLDFONT(16);
        [_titlLab sizeToFit];
    }
    return _titlLab;
}

-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(0, 0, 80, 14);
        [_rightBtn setTitle:@"查看详情" forState:UIControlStateNormal];
        [_rightBtn setImage:[UIImage imageNamed:@"arrow_right_black"]  forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = BQFONT(14);
        [_rightBtn setImageEdgeInsets:UIEdgeInsetsMake(0, _rightBtn.frame.size.width - _rightBtn.frame.origin.x - _rightBtn.imageView.frame.size.width , 0, 0)];
        [_rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -(_rightBtn.frame.size.width - _rightBtn.imageView.frame.size.width ), 0, 5)];
        _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _rightBtn;
}
-(UILabel *)oneLab{
    if (!_oneLab) {
        _oneLab = [UILabel new];
        _oneLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _oneLab;
}
-(UILabel *)twoLab{
    if (!_twoLab) {
        _twoLab = [UILabel new];
        _twoLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _twoLab;
}
-(UILabel *)leftNum{
    if (!_leftNum) {
        _leftNum = [UILabel new];
        _leftNum.text = @"0";
        _leftNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _leftNum.font = BQBOLDFONT(21);
    }
    return _leftNum;
}
-(UILabel *)timeLab{
    if (!_timeLab) {
        _timeLab = [UILabel new];
        _timeLab.text = @"总训练次数(次)";
        _timeLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _timeLab.font = BQFONT(11);
    }
    return _timeLab;
}
-(UILabel *)rightNum{
    if (!_rightNum) {
        _rightNum = [UILabel new];
        _rightNum.text = @"0";
        _rightNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _rightNum.font = BQBOLDFONT(21);
    }
    return _rightNum;
}
-(UILabel *)minuteLab{
    if (!_minuteLab) {
        _minuteLab = [UILabel new];
        _minuteLab.text = @"总上冰时间(分钟)";
        _minuteLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _minuteLab.font = BQFONT(11);
    }
    return _minuteLab;
}

-(UILabel *)threeLab{
    if (!_threeLab) {
        _threeLab = [UILabel new];
        _threeLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _threeLab;
}
-(UIImageView *)growImg{
    if (!_growImg) {
        _growImg = [UIImageView new];
        _growImg.image = [UIImage imageNamed:@"grow_icon_home"];
    }
    return _growImg;
}
-(UILabel *)growLab{
    if (!_growLab) {
        _growLab = [UILabel new];
        _growLab.text = @"成长轨迹";
        _growLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _growLab.font = BQBOLDFONT(14);
    }
    return _growLab;
}
-(UIButton *)arrowsBtn{
    if (!_arrowsBtn) {
        _arrowsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_arrowsBtn setImage:[UIImage imageNamed:@"arrow_right_black"] forState:UIControlStateNormal];
    }
    return _arrowsBtn;
}


@end
