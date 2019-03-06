//
//  KeChengXiangQing.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "KeChengXiangQing.h"

@implementation KeChengXiangQing

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.topLineLab];
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.bottomLineLab];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableview{
    KeChengXiangQing *oneCell = [tableview dequeueReusableCellWithIdentifier:@"oneCell"];
    if (!oneCell) {
        oneCell = [[KeChengXiangQing alloc]init];
    }
    return oneCell;
}

- (void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.topLineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakself.mas_centerX);
        make.centerY.mas_equalTo(weakself.mas_centerY);
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
        _titleLab.text = @"冰球大课";
        _titleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLab.font = BQBOLDFONT(30);
    }
    return _titleLab;
}
-(UILabel *)bottomLineLab{
    if (!_bottomLineLab) {
        _bottomLineLab = [UILabel new];
        _bottomLineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _bottomLineLab;
}
@end
