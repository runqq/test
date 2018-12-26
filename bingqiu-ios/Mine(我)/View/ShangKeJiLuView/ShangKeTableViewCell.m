//
//  ShangKeTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ShangKeTableViewCell.h"

@implementation ShangKeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titlLab];
        [self.contentView addSubview:self.detailLab];
        [self.contentView addSubview:self.rightLab];
        [self.contentView addSubview:self.rightDetailLab];
        [self.contentView addSubview:self.rightBtn];
        [self.contentView addSubview:self.lineLab];
        
        [self addLayOut];
        
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableview{
    
    ShangKeTableViewCell *skCell = [tableview dequeueReusableCellWithIdentifier:@"skCell"];
    if (!skCell) {
        skCell = [[ShangKeTableViewCell alloc]init];
    }
    skCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return skCell;
    
}

-(void)addLayOut{
    
    __weak typeof(self) weakself = self;
    
    [self.titlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(15);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titlLab.mas_bottom).with.offset(8);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.right.equalTo(weakself.rightDetailLab.mas_left).with.offset(-5);
        make.height.mas_equalTo(13);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.centerY.mas_equalTo(weakself.mas_centerY);
    }];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(15);
        make.right.equalTo(weakself.rightBtn.mas_left).with.offset(-11);
    }];
    [self.rightDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.rightLab.mas_bottom).with.offset(8);
        make.right.equalTo(weakself.rightBtn.mas_left).with.offset(-11);
        make.size.mas_equalTo(CGSizeMake(150, 13));
    }];
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    
}

-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [UILabel new];
        _titlLab.text = @"冰球大课";
        _titlLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titlLab.font = BQFONT(16);
        
        [_titlLab sizeToFit];
    }
    return _titlLab;
}
-(UILabel *)detailLab{
    if (!_detailLab) {
        _detailLab = [UILabel new];
        _detailLab.text = @"西三旗一号馆";
        _detailLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _detailLab.font = BQFONT(13);
    }
    return _detailLab;
}
-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = [UILabel new];
        _rightLab.text = @"-340.0";
        _rightLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _rightLab.font = BQFONT(16);
        [_rightLab sizeToFit];
        
    }
    return _rightLab;
}
-(UILabel *)rightDetailLab{
    if (!_rightDetailLab) {
        _rightDetailLab = [UILabel new];
        _rightDetailLab.text = @"2018-07-12 15:30";
        _rightDetailLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _rightDetailLab.font = BQFONT(13);
        _rightDetailLab.textAlignment = NSTextAlignmentRight;
    }
    return _rightDetailLab;
}
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setImage:[UIImage imageNamed:@"arrow_right_black"] forState:UIControlStateNormal];
    }
    return _rightBtn;
}
-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
    
}
@end
