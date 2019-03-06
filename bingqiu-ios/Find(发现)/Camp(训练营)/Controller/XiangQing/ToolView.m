//
//  FooterView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ToolView.h"

@implementation ToolView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.lineLab];
        [self addSubview:self.consultBtn];
        [self addSubview:self.applyBtn];
        [self addSubview:self.lab];
    }
    return self;
}

-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 1)];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}
// 致电咨询
-(UIButton *)consultBtn{
    if (!_consultBtn) {
        _consultBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W/2, 50)];
        [_consultBtn setTitle:@"致电咨询" forState:UIControlStateNormal];
        [_consultBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _consultBtn.titleLabel.font = BQFONT(18);
        _consultBtn.backgroundColor = [UIColor whiteColor];
    }
    return _consultBtn;
}
// 立即报名
-(UIButton *)applyBtn{
    if (!_applyBtn) {
        _applyBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_W/2, 0, SCREEN_W/2, 50)];
        [_applyBtn setTitle:@"立即报名" forState:UIControlStateNormal];
        [_applyBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _applyBtn.titleLabel.font = BQFONT(18);
        _applyBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
    }
    return _applyBtn;
}

-(UILabel *)lab{
    if (!_lab) {
        _lab = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_W-200)/2, 0, 200, 50)];
        _lab.hidden = YES;
        _lab.text = @"已结束";
        _lab.textAlignment = NSTextAlignmentCenter;
        _lab.font = BQFONT(18);
        _lab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _lab;
}


@end
