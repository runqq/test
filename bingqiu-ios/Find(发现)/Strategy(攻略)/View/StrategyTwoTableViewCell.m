//
//  StrategyTwoTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "StrategyTwoTableViewCell.h"

@implementation StrategyTwoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self.contentView addSubview:self.leftImg];
        [self.contentView addSubview:self.zhuLab];
        [self.contentView addSubview:self.fuLab];
        [self.contentView addSubview:self.eyeBtn];
        [self.contentView addSubview:self.numLab];
        [self.contentView addSubview:self.lineLab];
        
        [self addLayOUt];
    }
    return self;
    
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    StrategyTwoTableViewCell *twoCell = [tableView dequeueReusableCellWithIdentifier:@"twoCell"];
    if (!twoCell) {
        twoCell = [[StrategyTwoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"twoCell"];
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return twoCell;
}

- (void)addLayOUt{
    __weak typeof(self) weakself = self;
    
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(24);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(140, 110));
    }];
    [self.zhuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.leftImg.mas_top).with.offset(10);
        make.left.equalTo(weakself.leftImg.mas_right).with.offset(15);
    }];
    [self.fuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.zhuLab.mas_bottom).with.offset(16);
        make.left.equalTo(weakself.leftImg.mas_right).with.offset(15);
         make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
    [self.eyeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.numLab.mas_left).with.offset(-5);
        make.centerY.mas_equalTo(weakself.numLab.mas_centerY);
    }];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakself.leftImg.mas_bottom);
        make.right.equalTo(weakself.mas_right).with.offset(-25);
    }];
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.leftImg.mas_bottom).with.offset(16);
        make.left.equalTo(weakself.mas_left).with.offset(30);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W - 60, 1));
    }];
    
}
- (UIImageView *)leftImg{
    if (!_leftImg) {
        _leftImg = [UIImageView new];
        NSString *tpStr = @"http://img0.imgtn.bdimg.com/it/u=800905747,358759079&fm=26&gp=0.jpg";
        [_leftImg sd_setImageWithURL:[NSURL URLWithString:tpStr]];
    }
    return _leftImg;
}
- (UILabel *)zhuLab{
    if (!_zhuLab) {
        _zhuLab = [UILabel new];
        _zhuLab.text = @"天下武功唯快不破";
        _zhuLab.font = BQBOLDFONT(15);
        _zhuLab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _zhuLab;
}
- (UILabel *)fuLab{
    if (!_fuLab) {
        _fuLab = [UILabel new];
        _fuLab.text = @"适合已经有一定训练基测试测试测试测试测试测试测试测试ssssss";
        _fuLab.font = BQFONT(13);
        _fuLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _fuLab.preferredMaxLayoutWidth = (self.contentView.frame.size.width - 5 * 2);
        [_fuLab setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        _fuLab.numberOfLines = 0;
    }
    return _fuLab;
}
- (UIButton *)eyeBtn{
    if (!_eyeBtn) {
        _eyeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_eyeBtn setImage:[UIImage imageNamed:@"read_raiders"] forState:UIControlStateNormal];
        [_eyeBtn setImage:[UIImage imageNamed:@"read_raiders"] forState:UIControlStateHighlighted];
    }
    return _eyeBtn;
}
- (UILabel *)numLab{
    if (!_numLab) {
        _numLab = [UILabel new];
        _numLab.text = @"392131";
        _numLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _numLab.font = BQFONT(12);
        [_numLab sizeToFit];
    }
    return _numLab;
}
-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}

@end
