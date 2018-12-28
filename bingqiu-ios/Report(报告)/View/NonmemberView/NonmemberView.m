//
//  NonmemberView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/27.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "NonmemberView.h"

@implementation NonmemberView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT);
        self.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        
        [self addSubview:self.navLab];
        [self addSubview:self.nonmemberImg];
        [self addSubview:self.titleLab];
        [self addSubview:self.placeholderLab];
        
        [self addLayOut];
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.nonmemberImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(NAVIGATION_BAR_HEIGHT+30);
        make.left.equalTo(weakself.mas_left).with.offset(132);
        make.size.mas_equalTo(CGSizeMake(222, 216));
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(NAVIGATION_BAR_HEIGHT+274);
        make.centerX.equalTo(weakself.mas_centerX);
    }];
    [self.placeholderLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(NAVIGATION_BAR_HEIGHT+306);
        make.left.equalTo(weakself.mas_left).with.offset(70);
        make.size.mas_equalTo(CGSizeMake(264, 50));
    }];
}
-(UILabel *)navLab{
    if (!_navLab) {
        _navLab = [[UILabel alloc]init];
        _navLab.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        _navLab.text = @"报告";
        
        _navLab.font = BQBOLDFONT(18);
    }
    return _navLab;
}
-(UIImageView *)nonmemberImg{
    if (!_nonmemberImg) {
        _nonmemberImg = [[UIImageView alloc]init];
        _nonmemberImg.image = [UIImage imageNamed:@"picture_report_nonmember"];
    }
    return _nonmemberImg;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"对不起，您暂未拥有此权限";
        _titleLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titleLab.font = BQBOLDFONT(18);
    }
    return _titleLab;
}
-(UILabel *)placeholderLab{
    if (!_placeholderLab) {
        _placeholderLab = [UILabel new];
        _placeholderLab.text = @"请点击星球VIP登记办理会员";
        _placeholderLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _placeholderLab.font = BQBOLDFONT(16);
        _placeholderLab.preferredMaxLayoutWidth = (self.frame.size.width - 5 * 2);
        [_placeholderLab setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        _placeholderLab.numberOfLines = 0;
    }
    return _placeholderLab;
}

@end
