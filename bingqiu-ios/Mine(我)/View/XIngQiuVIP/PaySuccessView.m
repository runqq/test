//
//  PaySuccessView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "PaySuccessView.h"

@implementation PaySuccessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.topLine];
        [self addSubview:self.duiHaoImg];
        [self addSubview:self.placeLab];
        
        [self addLayOut];
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.duiHaoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(55);
        make.centerX.equalTo(weakself.mas_centerX);
    }];
    
    self.placeLab.preferredMaxLayoutWidth = (self.frame.size.width - 200);
    [self.placeLab setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    self.placeLab.numberOfLines = 0;
    [self.placeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.duiHaoImg.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(50);
        make.centerX.mas_equalTo(weakself.mas_centerX);
    }];
}
-(UILabel *)topLine{
    if (!_topLine) {
        _topLine = [[UILabel alloc]init];
        _topLine.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _topLine;
}
-(UIImageView *)duiHaoImg{
    if (!_duiHaoImg) {
        _duiHaoImg = [[UIImageView alloc]init];
        _duiHaoImg.image = [UIImage imageNamed:@"icon_success_pay"];
    }
    return _duiHaoImg;
}
-(UILabel *)placeLab{
    if (!_placeLab) {
        _placeLab = [[UILabel alloc]init];
        _placeLab.text = @"您已成功购买两个月的数据服务,\n请于黄港二号馆领取您的硬件设备.";
        _placeLab.textAlignment = NSTextAlignmentCenter;
        _placeLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _placeLab.font = BQFONT(14);
    }
    return _placeLab;
}

@end
