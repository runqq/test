//
//  BottomView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/5.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.serviceBtn];
        [self addSubview:self.suggestBtn];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.serviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakself.mas_centerY);
        make.left.equalTo(weakself.mas_left).with.offset(18);
        make.size.mas_equalTo(CGSizeMake(160, 45));
    }];
    [self.suggestBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakself.mas_centerY);
        make.right.equalTo(weakself.mas_right).with.offset(-18);
        make.size.mas_equalTo(CGSizeMake(160, 45));
    }];
    
}

-(UIButton *)serviceBtn{
    if (!_serviceBtn) {
        _serviceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _serviceBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        [_serviceBtn setTitle:@"电话客服" forState:UIControlStateNormal];
        [_serviceBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _serviceBtn.layer.borderWidth = 1;
        _serviceBtn.layer.borderColor = [UIColor colorWithHexString:@"#188bf0"].CGColor;
        _serviceBtn.layer.masksToBounds = YES;
        _serviceBtn.layer.cornerRadius = 5;
    }
    return _serviceBtn;
}

-(UIButton *)suggestBtn{
    if (!_suggestBtn) {
        _suggestBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _suggestBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        [_suggestBtn setTitle:@"反馈与建议" forState:UIControlStateNormal];
        [_serviceBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _suggestBtn.layer.masksToBounds = YES;
        _suggestBtn.layer.cornerRadius = 5;
    }
    return _suggestBtn;
}


@end
