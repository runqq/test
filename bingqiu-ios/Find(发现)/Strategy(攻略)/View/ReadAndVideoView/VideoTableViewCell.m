//
//  VideoTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "VideoTableViewCell.h"

@implementation VideoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.videoBtn];
        [self.contentView addSubview:self.leftLab];
        [self.contentView addSubview:self.eyeBtn];
        [self.contentView addSubview:self.numLab];
        [self.contentView addSubview:self.dianZBtn];
        [self.contentView addSubview:self.dianZanLab];
        
        [self addLayOut];
        
    };
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    VideoTableViewCell *videoCell = [tableView dequeueReusableCellWithIdentifier:@"videoCell"];
    if (!videoCell) {
        videoCell = [[VideoTableViewCell alloc]init];
    }
    videoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return videoCell;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W-30, 180));
    }];
    [self.videoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakself.bgView.mas_centerX);
        make.centerY.mas_equalTo(weakself.bgView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(54, 54));
    }];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_bottom).with.offset(16);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.eyeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.bgView.mas_bottom).with.offset(16);
        make.right.equalTo(weakself.numLab.mas_left).with.offset(-5);
    }];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.bgView.mas_bottom).with.offset(16);
        make.right.equalTo(weakself.dianZBtn.mas_left).with.offset(-20);
    }];
    [self.dianZBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.bgView.mas_bottom).with.offset(16);
        make.right.equalTo(weakself.dianZanLab.mas_left).with.offset(-5);
    }];
    [self.dianZanLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_bottom).with.offset(16);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
    
}

-(UIImageView *)bgView{
    if (!_bgView) {
        _bgView = [UIImageView new];
        _bgView.backgroundColor = [UIColor redColor];
    }
    return _bgView;
}

-(UIButton *)videoBtn{
    if (!_videoBtn) {
        _videoBtn = [UIButton new];
        [_videoBtn setImage:[UIImage imageNamed:@"icon_broadcast_raiders"] forState:UIControlStateNormal];
    }
    return _videoBtn;
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [UILabel new];
//        _leftLab.text = @"难度:初级";
        _leftLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _leftLab.font = BQFONT(15);
    }
    return _leftLab;
}

-(UIButton *)eyeBtn{
    if (!_eyeBtn) {
        _eyeBtn = [UIButton new];
        [_eyeBtn setImage:[UIImage imageNamed:@"read_raiders"] forState:UIControlStateNormal];
    }
    return _eyeBtn;
}

-(UILabel *)numLab{
    if (!_numLab) {
        _numLab = [UILabel new];
    }
    return _numLab;
}

-(UIButton *)dianZBtn{
    if (!_dianZBtn) {
        _dianZBtn = [UIButton new];
        [_dianZBtn setImage:[UIImage imageNamed:@"snap_raiders"] forState:UIControlStateNormal];
    }
    return _dianZBtn;
}

-(UILabel *)dianZanLab{
    if (!_dianZanLab) {
        _dianZanLab = [UILabel new];
    }
    return _dianZanLab;
}

@end
