//
//  LeftTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "LeftTableViewCell.h"

@implementation LeftTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.photoImg];
        [self addSubview:self.titleLab];
        [self addSubview:self.arrowsBtn];
        [self addSubview:self.bottomLine];
        
        [self addLayOut];
        
        
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.photoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(15);
        make.left.equalTo(weakself.mas_left).with.offset(36);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.photoImg.mas_bottom).with.offset(4);
        make.centerX.equalTo(weakself.mas_centerX);
    }];
    [self.arrowsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titleLab.mas_bottom).with.offset(4);
        make.centerX.equalTo(weakself.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(14, 8));
        
    }];    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(95, 0.5));
    }];
    
}
-(UIImageView *)photoImg{
    if (!_photoImg) {
        _photoImg = [[UIImageView alloc]init];
    }
    return _photoImg;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc]init];
    }
    return _titleLab;
}
-(UIButton *)arrowsBtn{
    if (!_arrowsBtn) {
        _arrowsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _arrowsBtn;
}
-(UILabel *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UILabel alloc]init];
        _bottomLine.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _bottomLine;
}


@end
