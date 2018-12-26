//
//  ChongZhiJinECollectionViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChongZhiJinECollectionViewCell.h"

@implementation ChongZhiJinECollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.monthLab];
        [self addSubview:self.moneyLab];
        [self addSubview:self.lab];
        
        
        [self addLayOut];
        
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.monthLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(9);
    }];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.monthLab.mas_bottom).with.offset(3);
        make.left.equalTo(weakself.mas_left).with.offset(9);
    }];
    [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.moneyLab.mas_bottom).with.offset(3);
        make.left.equalTo(weakself.mas_left).with.offset(9);
    }];
}
-(UILabel *)monthLab{
    if (!_monthLab) {
        _monthLab = [[UILabel alloc]init];
        _monthLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _moneyLab.font = BQBOLDFONT(14);
    }
    return _monthLab;
}
-(UILabel *)moneyLab{
    if (!_moneyLab) {
        _moneyLab = [[UILabel alloc]init];
        _moneyLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _moneyLab.font = BQBOLDFONT(18);
    }
    return _moneyLab;
}
-(UILabel *)lab{
    if (!_lab) {
        _lab = [[UILabel alloc]init];
        _lab.textColor = [UIColor colorWithHexString:@"#666666"];
        _lab.font = BQFONT(10);
    }
    return _lab;
}
-(void)setDetailModel:(BecomeVIPDetailModel *)detailModel{
    _detailModel = detailModel;
    _monthLab.text = _detailModel.name;
    _moneyLab.text = [NSString stringWithFormat:@"%.2f",_detailModel.price];
    _lab.text = [NSString stringWithFormat:@"%.2f",_detailModel.aveMonthlyAmount];
}
@end
