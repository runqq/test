//
//  FanKuiYuJianYiView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/5.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FanKuiYuJianYiView.h"

@implementation FanKuiYuJianYiView

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.rightBtn];
        [self.contentView addSubview:self.topline];
        [self.contentView addSubview:self.bottomline];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.topline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);;
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.centerY.mas_equalTo(weakself.mas_centerY);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.centerY.mas_equalTo(weakself.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    [self.bottomline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    
}
-(UILabel *)topline{
    if (!_topline) {
        _topline = [UILabel new];
        _topline.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _topline;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLab.font = BQFONT(16);
        [_titleLab sizeToFit];
    }
    return _titleLab;
}
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setBackgroundImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
    }
    return _rightBtn;
}
-(UILabel *)bottomline{
    if (!_bottomline) {
        _bottomline = [UILabel new];
        _bottomline.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _bottomline;
}

@end
