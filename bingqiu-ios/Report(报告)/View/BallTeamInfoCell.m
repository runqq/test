//
//  BallTeamInfoCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "BallTeamInfoCell.h"

@implementation BallTeamInfoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.bgView];
        
        [self.bgView addSubview:self.ballTeamImg];
        [self.bgView addSubview:self.ballTeamLab];
        [self.bgView addSubview:self.topLab];
        [self.bgView addSubview:self.leftLab];
        [self.bgView addSubview:self.rightLab];
        
        [self.bgView addSubview:self.leftView];
        [self.leftView addSubview:self.positionImg];
        [self.leftView addSubview:self.titLeftLab];
        [self.leftView addSubview:self.subLeftLab];
        
        [self.bgView addSubview:self.midView];
        [self.midView addSubview:self.jerseyImg];
        [self.midView addSubview:self.timidLab];
        [self.midView addSubview:self.submidLab];
        
        [self.bgView addSubview:self.rightView];
        [self.rightView addSubview:self.racemunImg];
        [self.rightView addSubview:self.titlRightLab];
        [self.rightView addSubview:self.subRightLab];
        [self.bgView addSubview:self.bottomLab];
        
        
        [self.bgView addSubview:self.midLab];
        [self.bgView addSubview:self.leftBotView];
        [self.leftBotView addSubview:self.teamImg];
        [self.leftBotView addSubview:self.teamLab];
        [self.leftBotView addSubview:self.teamSubLab];
        
        [self.bgView addSubview:self.rightBotView];
        [self.rightBotView addSubview:self.clubImg];
        [self.rightBotView addSubview:self.clubLab];
        [self.rightBotView addSubview:self.clubSubLab];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.ballTeamImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(18);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(15);
    }];
    [self.ballTeamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(18);
        make.left.equalTo(weakself.ballTeamImg.mas_right).with.offset(10);
    }];
    [self.topLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(60);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.topLab.mas_bottom).with.offset(25);
        make.left.equalTo(weakself.bgView.mas_left).with.offset((SCREEN_W-30)/3);
        make.size.mas_equalTo(CGSizeMake(0.5, 50));
    }];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.topLab.mas_bottom).with.offset(25);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(((SCREEN_W-30)/3) * 2);
        make.size.mas_equalTo(CGSizeMake(0.5, 50));
    }];
    
    [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.topLab.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(115, 100));
    }];
    
    [self.positionImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.leftView.mas_top).with.offset(20);
        make.centerX.equalTo(weakself.leftView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(15, 20));
    }];
    [self.titLeftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.positionImg.mas_bottom).with.offset(9);
        make.centerX.equalTo(weakself.leftView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    [self.subLeftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLeftLab.mas_bottom).with.offset(8);
        make.centerX.equalTo(weakself.leftView.mas_centerX);
        make.height.mas_equalTo(12);
        
    }];
    [self.midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.topLab.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.leftLab.mas_right).with.offset(0);
        make.right.equalTo(weakself.rightLab.mas_left).with.offset(0);
        make.height.mas_equalTo(100);
    }];
    [self.jerseyImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.midView.mas_top).with.offset(20);
        make.centerX.equalTo(weakself.midView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(22, 20));
    }];
    [self.timidLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.jerseyImg.mas_bottom).with.offset(9);
        make.centerX.equalTo(weakself.midView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    [self.submidLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.timidLab.mas_bottom).with.offset(8);
        make.centerX.equalTo(weakself.midView.mas_centerX);
        make.height.mas_equalTo(12);
    }];
    
    // 右侧view
    [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.topLab.mas_bottom).with.offset(0);
        make.right.equalTo(weakself.bgView.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(115, 100));
    }];
    [self.racemunImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.rightView.mas_top).with.offset(20);
        make.centerX.equalTo(weakself.rightView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(22, 20));
    }];
    [self.titlRightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.racemunImg.mas_bottom).with.offset(9);
        make.centerX.equalTo(weakself.rightView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    [self.subRightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titlRightLab.mas_bottom).with.offset(8);
        make.centerX.equalTo(weakself.rightView.mas_centerX);
        make.height.mas_equalTo(12);
    }];
    [self.bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.topLab.mas_bottom).with.offset(100);
        make.centerX.mas_equalTo(weakself.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(280, 0.5));
    }];
    [self.midLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bottomLab.mas_bottom).with.offset(25);
        make.left.equalTo(weakself.bgView.mas_left).with.offset((SCREEN_W-30)/2);
        make.size.mas_equalTo(CGSizeMake(0.5, 50));
    }];
    
    // 左下view
    [self.leftBotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bottomLab.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(15);
        make.right.equalTo(weakself.midLab.mas_left).with.offset(0);
        make.height.mas_equalTo(100);
    }];
    [self.teamImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.leftBotView.mas_top).with.offset(20);
        make.centerX.equalTo(weakself.leftBotView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(22, 20));
    }];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.teamImg.mas_bottom).with.offset(9);
        make.centerX.equalTo(weakself.leftBotView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    [self.teamSubLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.teamLab.mas_bottom).with.offset(8);
        make.centerX.equalTo(weakself.leftBotView.mas_centerX);
        make.height.mas_equalTo(12);
    }];
    // 右下view
    [self.rightBotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bottomLab.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.midLab.mas_right).with.offset(0);
        make.right.equalTo(weakself.bgView.mas_right).with.offset(-15);
        make.height.mas_equalTo(100);
    }];
    [self.clubImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.rightBotView.mas_top).with.offset(20);
        make.centerX.equalTo(weakself.rightBotView.mas_centerX);
        make.size.mas_offset(CGSizeMake(22, 20));
    }];
    [self.clubLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.clubImg.mas_bottom).with.offset(8);
        make.centerX.equalTo(weakself.rightBotView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    [self.clubSubLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.clubLab.mas_bottom).with.offset(8);
        make.centerX.equalTo(weakself.rightBotView.mas_centerX);
        make.height.mas_equalTo(12);
    }];
    
}

-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 265)];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return _bgView;
}
-(UIImageView *)ballTeamImg{
    if (!_ballTeamImg) {
        _ballTeamImg = [UIImageView new];
        _ballTeamImg.image = [UIImage imageNamed:@"team_icon_home"];
    }
    return _ballTeamImg;
}
-(UILabel *)ballTeamLab{
    if (!_ballTeamLab) {
        _ballTeamLab = [UILabel new];
        _ballTeamLab.text = @"球队信息";
        _ballTeamLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _ballTeamLab.font = BQBOLDFONT(16);
        [_ballTeamLab sizeToFit];
    }
    return _ballTeamLab;
}
-(UILabel *)topLab{
    if (!_topLab) {
        _topLab = [UILabel new];
        _topLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _topLab;
}
-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _leftLab;
}
-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = [UILabel new];
        _rightLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _rightLab;
}

-(UIView *)leftView{
    if (!_leftView) {
        _leftView = [UIView new];
    }
    return _leftView;
}
-(UIImageView *)positionImg{
    if (!_positionImg) {
        _positionImg = [UIImageView new];
        _positionImg.image = [UIImage imageNamed:@"position_home"];
    }
    return _positionImg;
}
-(UILabel *)titLeftLab{
    if (!_titLeftLab) {
        _titLeftLab = [UILabel new];
//        _titLeftLab.text = @"前锋";
        _titLeftLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLeftLab.font = BQBOLDFONT(16);
        _titLeftLab.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titLeftLab;
}
-(UILabel *)subLeftLab{
    if (!_subLeftLab) {
        _subLeftLab = [UILabel new];
        _subLeftLab.text = @"位置";
        _subLeftLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _subLeftLab.font = BQFONT(12);
        _subLeftLab.textAlignment = NSTextAlignmentCenter;
    }
    return _subLeftLab;
}
// 左侧view
-(UIView *)midView{
    if (!_midView) {
        _midView = [UIView new];
    }
    return _midView;
}
-(UIImageView *)jerseyImg{
    if (!_jerseyImg) {
        _jerseyImg = [UIImageView new];
        _jerseyImg.image = [UIImage imageNamed:@"jersey_home"];
    }
    return _jerseyImg;
}
-(UILabel *)timidLab{
    if (!_timidLab) {
        _timidLab = [UILabel new];
//        _timidLab.text = @"6号";
        _timidLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _timidLab.font = BQBOLDFONT(16);
        _timidLab.textAlignment = NSTextAlignmentCenter;
    }
    return _timidLab;
}
-(UILabel *)submidLab{
    if (!_submidLab) {
        _submidLab = [UILabel new];
        _submidLab.text = @"球衣号码";
        _submidLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _submidLab.font = BQFONT(12);
        _submidLab.textAlignment = NSTextAlignmentCenter;
    }
    return _submidLab;
}

// 右侧View
-(UIView *)rightView{
    if (!_rightView) {
        _rightView = [UIView new];
    }
    return _rightView;
}
-(UIImageView *)racemunImg{
    if (!_racemunImg) {
        _racemunImg = [UIImageView new];
        _racemunImg.image = [UIImage imageNamed:@"racemun_home"];
    }
    return _racemunImg;
}
-(UILabel *)titlRightLab{
    if (!_titlRightLab) {
        _titlRightLab = [UILabel new];
//        _titlRightLab.text = @"153";
        _titlRightLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titlRightLab.font = BQBOLDFONT(16);
        _titlRightLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titlRightLab;
}
-(UILabel *)subRightLab{
    if (!_subRightLab) {
        _subRightLab = [UILabel new];
        _subRightLab.text = @"累积出赛场次";
        _subRightLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _subRightLab.font = BQFONT(12);
        _subRightLab.textAlignment = NSTextAlignmentCenter;
    }
    return _subRightLab;
}
-(UILabel *)bottomLab{
    if (!_bottomLab) {
        _bottomLab = [UILabel new];
        _bottomLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _bottomLab;
}

-(UILabel *)midLab{
    if (!_midLab) {
        _midLab = [UILabel new];
        _midLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _midLab;
}
// 左下view
-(UIView *)leftBotView{
    if (!_leftBotView) {
        _leftBotView = [UIView new];
    }
    return _leftBotView;
}
-(UIImageView *)teamImg{
    if (!_teamImg) {
        _teamImg = [UIImageView new];
        _teamImg.image = [UIImage imageNamed:@"team_home"];
    }
    return _teamImg;
}
-(UILabel *)teamLab{
    if (!_teamLab) {
        _teamLab = [UILabel new];
//        _teamLab.text = @"华星国际顶尖";
        _teamLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _teamLab.font = BQBOLDFONT(16);
        _teamLab.textAlignment = NSTextAlignmentCenter;
    }
    return _teamLab;
}
-(UILabel *)teamSubLab{
    if (!_teamSubLab) {
        _teamSubLab = [UILabel new];
        _teamSubLab.text = @"球队";
        _teamSubLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _teamSubLab.font = BQFONT(12);
        _teamSubLab.textAlignment = NSTextAlignmentCenter;
    }
    return _teamSubLab;
}
// 右下view
-(UIView *)rightBotView{
    if (!_rightBotView) {
        _rightBotView = [UIView new];
    }
    return _rightBotView;
}
-(UIImageView *)clubImg{
    if (!_clubImg) {
        _clubImg = [UIImageView new];
        _clubImg.image = [UIImage imageNamed:@"club_home"];
    }
    return _clubImg;
}
-(UILabel *)clubLab{
    if (!_clubLab) {
        _clubLab = [UILabel new];
//        _clubLab.text = @"华星国际冰球";
        _clubLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _clubLab.font = BQBOLDFONT(16);
        _clubLab.textAlignment = NSTextAlignmentCenter;
    }
    return _clubLab;
}
-(UILabel *)clubSubLab{
    if (!_clubSubLab) {
        _clubSubLab = [UILabel new];
        _clubSubLab.text = @"隶属俱乐部";
        _clubSubLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _clubSubLab.font = BQFONT(12);
        _clubSubLab.textAlignment = NSTextAlignmentCenter;
    }
    return _clubSubLab;
}
@end
