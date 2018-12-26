//
//  TopView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/6.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TopView.h"

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.topView];
        [self.topView addSubview:self.titlelab];
        [self.topView addSubview:self.line];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 55));
    }];
    [self.titlelab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.topView.mas_left).with.offset(15);
        make.centerY.equalTo(weakself.topView.mas_centerY);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.topView.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.topView.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    
}
-(UIView *)topView{
    if (!_topView) {
        _topView = [UIView new];
        _topView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    }
    return _topView;
}
-(UILabel *)titlelab{
    if (!_titlelab) {
        _titlelab = [UILabel new];
        _titlelab.text = @"常见问题";
        _titlelab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titlelab.font = BQBOLDFONT(16);
    }
    return _titlelab;
}
-(UILabel *)line{
    if (!_line) {
        _line = [UILabel new];
        _line.backgroundColor = [UIColor colorWithHexString:@"e2e2e2"];
    }
    return _line;
}
@end
