//
//  ChangeStuTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChangeStuTableViewCell.h"

@implementation ChangeStuTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.nameLab];
        [self.contentView addSubview:self.rightBtn];
        [self.contentView addSubview:self.lineLab];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);;
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 1));
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.centerY.mas_equalTo(weakself.mas_centerY);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.centerY.mas_equalTo(weakself.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
}
-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}
-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [UILabel new];
        _nameLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _nameLab.font = BQBOLDFONT(16);
        [_nameLab sizeToFit];
    }
    return _nameLab;
}
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
//        [_rightBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateSelected];
    }
    return _rightBtn;
}
@end
