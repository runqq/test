//
//  JiangXueJinXiangQing.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiangXueJinXiangQing.h"

@implementation JiangXueJinXiangQing

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.topLineLab];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.moneyLab];
        [self.contentView addSubview:self.bottomLineLab];
        
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableview{
    JiangXueJinXiangQing *jxjDetailCell = [tableview dequeueReusableCellWithIdentifier:@"jxjDetailCell"];
    if (!jxjDetailCell) {
        jxjDetailCell = [[JiangXueJinXiangQing alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"jxjDetailCell"];
    }
    return jxjDetailCell;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.topLineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.topLineLab.mas_bottom).with.offset(30);
        make.centerX.mas_equalTo(weakself.mas_centerX);
    }];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.bottomLineLab.mas_top).with.offset(-30);
        make.centerX.mas_equalTo(weakself.mas_centerX);
    }];
    [self.bottomLineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(345, 0.5));
    }];
    
}

-(UILabel *)topLineLab{
    if (!_topLineLab) {
        _topLineLab = [UILabel new];
        _topLineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _topLineLab;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"上课-冰球小课";
        _titleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLab.font = BQBOLDFONT(16);
    }
    return _titleLab;
}
-(UILabel *)moneyLab{
    if (!_moneyLab) {
        _moneyLab = [[UILabel alloc]init];
        _moneyLab.text = @"-1000.0";
        _moneyLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _moneyLab.font = BQBOLDFONT(30);
    }
    return _moneyLab;
}
-(UILabel *)bottomLineLab{
    if (!_bottomLineLab) {
        _bottomLineLab = [UILabel new];
        _bottomLineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _bottomLineLab;
}

@end
