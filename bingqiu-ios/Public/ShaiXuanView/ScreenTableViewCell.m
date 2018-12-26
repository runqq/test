//
//  ScreenTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ScreenTableViewCell.h"

@implementation ScreenTableViewCell

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
    
    [self.yesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(15);
        make.right.equalTo(weakSelf.mas_right).with.offset(-24);
        make.size.mas_equalTo(CGSizeMake(18, 18));
    }];
    
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(15);
        make.right.equalTo(weakSelf.yesBtn.mas_left).with.offset(-44);
        make.size.mas_equalTo(CGSizeMake(40, 16));
    }];
}
-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [[UILabel alloc]init];
        _titLab.font = BQFONT(16);
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
