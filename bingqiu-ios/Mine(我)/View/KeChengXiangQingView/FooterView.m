//
//  FooterView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.evaluateBtn];
        [self addSubview:self.complaintBtn];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.evaluateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakself.mas_centerY);
        make.left.equalTo(weakself.mas_left).with.offset(18);
        make.size.mas_equalTo(CGSizeMake(160, 45));
    }];
    [self.complaintBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakself.mas_centerY);
        make.right.equalTo(weakself.mas_right).with.offset(-18);
        make.size.mas_equalTo(CGSizeMake(160, 45));
    }];
    
}

-(UIButton *)evaluateBtn{
    if (!_evaluateBtn) {
        _evaluateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _evaluateBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        [_evaluateBtn setTitle:@"评价本次课程" forState:UIControlStateNormal];
        [_evaluateBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _evaluateBtn.layer.borderWidth = 1;
        _evaluateBtn.layer.borderColor = [UIColor colorWithHexString:@"#188bf0"].CGColor;
        _evaluateBtn.layer.masksToBounds = YES;
        _evaluateBtn.layer.cornerRadius = 5;
    }
    return _evaluateBtn;
}

-(UIButton *)complaintBtn{
    if (!_complaintBtn) {
        _complaintBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_complaintBtn setTitle:@"投诉" forState:UIControlStateNormal];
        [_complaintBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
        _complaintBtn.layer.borderWidth = 1;
        _complaintBtn.layer.borderColor = [UIColor colorWithHexString:@"#188bf0"].CGColor;
        _complaintBtn.layer.masksToBounds = YES;
        _complaintBtn.layer.cornerRadius = 5;
    }
    return _complaintBtn;
}

@end
