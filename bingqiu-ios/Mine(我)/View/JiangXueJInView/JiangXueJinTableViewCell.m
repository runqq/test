//
//  JiangXueJinTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiangXueJinTableViewCell.h"

@implementation JiangXueJinTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titLab];
        [self.contentView addSubview:self.subLab];
        [self.contentView addSubview:self.lineLab];
        [self.contentView addSubview:self.arrowsImg];
        [self.contentView addSubview:self.moneyLab];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTableview:(UITableView *)tableview{
    
    JiangXueJinTableViewCell *jxjCell = [tableview dequeueReusableCellWithIdentifier:@"jxjCell"];
    if (!jxjCell) {
        jxjCell = [[JiangXueJinTableViewCell alloc]init];
    }
    jxjCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return jxjCell;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(18);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.subLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab.mas_bottom).with.offset(5);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(150, 13));
    }];
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 1));
    }];
    [self.arrowsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.centerY.mas_equalTo(weakself.mas_centerY);
    }];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.arrowsImg.mas_left).with.offset(-12);
        make.centerY.mas_equalTo(weakself.mas_centerY);
    }];
    
}

-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [UILabel new];
//        _titLab.text = @"发放";
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQBOLDFONT(16);
        [_titLab sizeToFit];
    }
    return _titLab;
}
-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}
-(UILabel *)subLab{
    if (!_subLab) {
        _subLab = [UILabel new];
//        _subLab.text = @"2018-07-12 08:52:12";
        _subLab.font = BQFONT(13);
//        [_subLab sizeToFit];
    }
    return _subLab;
}
-(UILabel *)moneyLab{
    if (!_moneyLab) {
        _moneyLab = [UILabel new];
        _moneyLab.text = @"+1000.00";
        _moneyLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _moneyLab.font = BQBOLDFONT(20);
    }
    return _moneyLab;
}
-(UIImageView *)arrowsImg{
    if (!_arrowsImg) {
        _arrowsImg = [UIImageView new];
        _arrowsImg.image = [UIImage imageNamed:@"arrow_right_black"];
    }
    return _arrowsImg;
}

@end
