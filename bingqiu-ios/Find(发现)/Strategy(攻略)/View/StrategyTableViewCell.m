//
//  StrategyTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "StrategyTableViewCell.h"

@implementation StrategyTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titLab];
        [self.contentView addSubview:self.leftImg];
        [self.contentView addSubview:self.leftLab];
        [self.contentView addSubview:self.leftBtn];
        [self.contentView addSubview:self.rightImg];
        [self.contentView addSubview:self.rightLab];
        [self.contentView addSubview:self.rightBtn];
        [self addLayOUt];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    StrategyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[StrategyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

-(void)addLayOUt{
    
    __weak typeof(self) weakself = self;
    
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(24);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.leftImg);
        make.left.mas_equalTo(weakself.leftLab);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W /2 -30,140));
    }];
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab.mas_bottom).with.offset(15);
        make.left.mas_equalTo(weakself.titLab.mas_left);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/2 - 30, 110));
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.rightImg);
        make.left.mas_equalTo(weakself.rightLab);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/2 - 30, 140));
    }];
    [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakself.leftImg);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/2 - 30, 110));
    }];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.leftImg.mas_bottom).with.offset(15);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/2 - 30, 15));
    }];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        // 应遵循上左下右的原则
        make.top.equalTo(weakself.rightImg.mas_bottom).with.offset(15);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/2 - 30, 15));
        
    }];
}

-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [UILabel new];
        _titLab.text = @"你可能想看";
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQBOLDFONT(14);
        [_titLab sizeToFit];
    }
    return _titLab;
}

-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton new];
        _leftBtn.backgroundColor = [UIColor clearColor];
        _leftBtn.tag = 1001;
    }
    return _leftBtn;
}

-(UIImageView *)leftImg{
    if (!_leftImg) {
        _leftImg = [UIImageView new];
        _leftImg.userInteractionEnabled = YES;
        

    }
    return _leftImg;
}

-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton new];
        _rightBtn.backgroundColor = [UIColor clearColor];
        _rightBtn.tag = 2002;
    }
    return _rightBtn;
}

-(UIImageView *)rightImg{
    if (!_rightImg) {
        _rightImg = [UIImageView new];
        _rightImg.userInteractionEnabled = YES;
       
    }
    return _rightImg;
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [UILabel new];;
        _leftLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _leftLab.font = BQLightFONT(15);
    }
    return _leftLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = [UILabel new];
        _rightLab.font = BQLightFONT(15);
    }
    return _rightLab;
}

@end
