//
//  GameRecordCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/30.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "GameRecordCell.h"

@implementation GameRecordCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.bgView];
        
        [self.bgView addSubview:self.leftImg];
        [self.bgView addSubview:self.titlLab];
        [self.bgView addSubview:self.rightBtn];
        [self.bgView addSubview:self.oneLab];
        
        [self.bgView addSubview:self.gameTimeLab];
        [self.bgView addSubview:self.gameTimeNum];
        [self.bgView addSubview:self.assistLab];
        [self.bgView addSubview:self.assistNum];
        
        
        [self.bgView addSubview:self.twoLab];
        [self.bgView addSubview:self.sumGoalNum];
        [self.bgView addSubview:self.sumGoalLab];
        [self.bgView addSubview:self.shouFaNum];
        [self.bgView addSubview:self.shouFaLab];
        [self.bgView addSubview:self.shangChangNum];
        [self.bgView addSubview:self.shangChangLab];
        
        [self.bgView addSubview:self.bottomLab];
        [self.bgView addSubview:self.growImg];
        [self.bgView addSubview:self.growLab];
        [self.bgView addSubview:self.arrowsBtn];
        
        CGFloat circleWidth = 160;
        self.bqCircle = [[BQCircleProgress alloc] initWithFrame:CGRectMake(0, 0, circleWidth, circleWidth)];
        
        self.bqCircle.center = CGPointMake(self.bgView.center.x, 130);
        [self.bgView addSubview:self.bqCircle];
        
        
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
    
    [self.gameTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(15);
        make.bottom.equalTo(weakself.sumGoalNum.mas_top).with.offset(-60);
    }];
    [self.gameTimeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(15);
        make.bottom.equalTo(weakself.sumGoalNum.mas_top).with.offset(-80);
    }];
    [self.assistLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.sumGoalNum.mas_top).with.offset(-60);
        make.right.equalTo(weakself.bgView.mas_right).with.offset(-15);
    }];
    [self.assistNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.sumGoalNum.mas_top).with.offset(-80);
        make.right.equalTo(weakself.bgView.mas_right).with.offset(-15);
    }];
    
    
    
    [self.twoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.bottomLab.mas_top).with.offset(-43);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.sumGoalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(15);
        make.bottom.equalTo(weakself.twoLab.mas_top).with.offset(-29);
    }];
    [self.sumGoalNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(15);
        make.bottom.equalTo(weakself.sumGoalLab.mas_top).with.offset(-9);
    }];
    
    [self.shouFaNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.oneLab.mas_bottom).with.offset(141);
        make.bottom.equalTo(weakself.shouFaLab.mas_top).with.offset(-9);
        make.centerX.equalTo(weakself.bgView.mas_centerX);
    }];
    [self.shouFaLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.shouFaNum.mas_bottom).with.offset(9);
        make.bottom.equalTo(weakself.twoLab.mas_top).with.offset(-29);
        make.centerX.equalTo(weakself.bgView.mas_centerX);
    }];
    
    
    [self.shangChangLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.twoLab.mas_top).with.offset(-29);
        make.right.equalTo(weakself.bgView.mas_right).with.offset(-15);
    }];
    [self.shangChangNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.shangChangLab.mas_top).with.offset(-9);
        make.right.equalTo(weakself.bgView.mas_right).with.offset(-15);
    }];
    
    
    [self.bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.bgView.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.growImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(145);
        make.bottom.equalTo(weakself.bottomLab.mas_top).with.offset(-12);
    }];
    [self.growLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.growImg.mas_right).with.offset(5);
        make.bottom.equalTo(weakself.bottomLab.mas_top).with.offset(-10);
    }];
    [self.arrowsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.bottomLab.mas_top).with.offset(-5);
        make.right.equalTo(weakself.bgView.mas_right).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
}

-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 330)];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return _bgView;
}
-(UIImageView *)leftImg{
    if (!_leftImg) {
        _leftImg = [UIImageView new];
        _leftImg.image = [UIImage imageNamed:@"game_icon_home"];
    }
    return _leftImg;
}
-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [UILabel new];
        _titlLab.text = @"比赛记录";
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

-(UILabel *)gameTimeLab{
    if (!_gameTimeLab) {
        _gameTimeLab = [UILabel new];
        _gameTimeLab.text = @"总比赛次数(次)";
        _gameTimeLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _gameTimeLab.font = BQFONT(11);
    }
    return _gameTimeLab;
}
-(UILabel *)gameTimeNum{
    if (!_gameTimeNum) {
        _gameTimeNum = [UILabel new];
        _gameTimeNum.text = @"0";
        _gameTimeNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _gameTimeNum.font = BQBOLDFONT(21);
    }
    return _gameTimeNum;
}
-(UILabel *)assistLab{
    if (!_assistLab) {
        _assistLab = [UILabel new];
        _assistLab.text = @"总助攻(次)";
        _assistLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _assistLab.font = BQFONT(11);
    }
    return _assistLab;
}
-(UILabel *)assistNum{
    if (!_assistNum) {
        _assistNum = [UILabel new];
        _assistNum.text = @"0";
        _assistNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _assistNum.font = BQBOLDFONT(21);
    }
    return _assistNum;
}

-(UILabel *)twoLab{
    if (!_twoLab) {
        _twoLab = [UILabel new];
        _twoLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _twoLab;
}
-(UILabel *)sumGoalNum{
    if (!_sumGoalNum) {
        _sumGoalNum = [UILabel new];
        _sumGoalNum.text = @"0";
        _sumGoalNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _sumGoalNum.font = BQBOLDFONT(21);
    }
    return _sumGoalNum;
}
-(UILabel *)sumGoalLab{
    if (!_sumGoalLab) {
        _sumGoalLab = [UILabel new];
        _sumGoalLab.text = @"总得分";
        _sumGoalLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _sumGoalLab.font = BQFONT(11);
    }
    return _sumGoalLab;
}
-(UILabel *)shouFaNum{
    if (!_shouFaNum) {
        _shouFaNum = [UILabel new];
        _shouFaNum.text = @"0";
        _shouFaNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _shouFaNum.font = BQBOLDFONT(21);
    }
    return _shouFaNum;
}
-(UILabel *)shouFaLab{
    if (!_shouFaLab) {
        _shouFaLab = [UILabel new];
        _shouFaLab.text = @"总受罚时间(分钟)";
        _shouFaLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _shouFaLab.font = BQFONT(11);
    }
    return _shouFaLab;
}
-(UILabel *)shangChangNum{
    if (!_shangChangNum) {
        _shangChangNum = [UILabel new];
        _shangChangNum.text = @"0";
        _shangChangNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _shangChangNum.font = BQBOLDFONT(21);
    }
    return _shangChangNum;
}
-(UILabel *)shangChangLab{
    if (!_shangChangLab) {
        _shangChangLab = [UILabel new];
        _shangChangLab.text = @"总上场时间(分钟)";
        _shangChangLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _shangChangLab.font = BQFONT(11);
    }
    return _shangChangLab;
}

-(UILabel *)bottomLab{
    if (!_bottomLab) {
        _bottomLab = [UILabel new];
        _bottomLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _bottomLab;
}

//-(ZZGradientProgress *)circle2{
//    if (!_circle2) {
//        
//        CGFloat xCrack = SCREEN_W/3.0-5;
//        CGFloat yCrack = self.bgView.frame.origin.y+70;
//        CGFloat itemWidth = 130;
//        
//        //2.半径自定义、两端圆角、不显示文本、显示背景线条、渐变颜色两端固定
//        _circle2 = [[ZZGradientProgress alloc] initWithFrame:CGRectMake(xCrack, yCrack, itemWidth, itemWidth) startColor:[UIColor colorWithHexString:@"#aa7af4"] endColor:[UIColor colorWithHexString:@"#ff6262"] startAngle:-70 reduceAngle:0 strokeWidth:10];
//        //        _circle2 = [[ZZGradientProgress alloc] initWithFrame:CGRectMake(xCrack*2+itemWidth, yCrack, itemWidth, itemWidth) startColor:[UIColor purpleColor] endColor:[UIColor redColor] startAngle:-90 reduceAngle:0 strokeWidth:10];
//        // 试图的背景颜色
//        //        _circle2.backgroundColor = [UIColor colorWithRed:180/255.0 green:230/255.0 blue:222/255.0 alpha:1];
//        _circle2.radius = 65;
//        _circle2.roundStyle = YES;
//        _circle2.showProgressText = NO;
//        _circle2.showPathBack = YES;
//        _circle2.pathBackColor = [UIColor lightGrayColor];
//        _circle2.colorGradient = NO;
//        _circle2.progress = 0.6;
//        
//    }
//    return _circle2;
//}
//
//-(UILabel *)huaXingJuLiLab{
//    if (!_huaXingJuLiLab) {
//        _huaXingJuLiLab = [[UILabel alloc]initWithFrame:CGRectMake(self.circle2.frame.size.width/2-40, self.circle2.frame.size.height/2+10, 80, 11)];
//        _huaXingJuLiLab.text = @"总进球(个)";
//        _huaXingJuLiLab.textAlignment = NSTextAlignmentCenter;
//        //        [_huaXingJuLiLab sizeToFit];
//        //        [_huaXingJuLiLab setCenter:CGPointMake(CGRectGetMidX(self.circle2.frame), CGRectGetMaxY(self.circle2.frame))];
//        _huaXingJuLiLab.textColor = [UIColor colorWithHexString:@"#666666"];
//        _huaXingJuLiLab.font = BQFONT(11);
//    }
//    return _huaXingJuLiLab;
//}
//-(UILabel *)huaXingJuLiNum{
//    if (!_huaXingJuLiNum) {
//        _huaXingJuLiNum = [[UILabel alloc]initWithFrame:CGRectMake(self.circle2.frame.size.width/2-40, self.circle2.frame.size.height/2-15, 80, 22)];
//        _huaXingJuLiNum.text = @"34";
//        _huaXingJuLiNum.textAlignment = NSTextAlignmentCenter;
//        _huaXingJuLiNum.font = BQBOLDFONT(22);
//        _huaXingJuLiNum.textColor = [UIColor colorWithHexString:@"#188bf0"];
//    }
//    return _huaXingJuLiNum;
//}

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
