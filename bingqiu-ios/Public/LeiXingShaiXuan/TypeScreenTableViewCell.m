//
//  TypeScreenTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TypeScreenTableViewCell.h"

@implementation TypeScreenTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.yesBtn];
        [self addSubview:self.titLab];
        
        [self createTableViewCell];
    }
    return self;
}

-(void)createTableViewCell{
    __weak typeof(self) weakSelf = self;
    
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(200, 16));
    }];
    
    [self.yesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.right.equalTo(weakSelf.mas_right).with.offset(-24);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
}
-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [[UILabel alloc]init];
        _titLab.font = BQFONT(16);
        _titLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titLab;
}
-(UIButton *)yesBtn{
    if (!_yesBtn) {
        _yesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 未选中图片名
        [_yesBtn setBackgroundImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
    }
    return _yesBtn;
}

@end
