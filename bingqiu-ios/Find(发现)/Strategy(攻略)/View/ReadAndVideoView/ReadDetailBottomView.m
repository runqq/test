//
//  ReadDetailBottomView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReadDetailBottomView.h"

@implementation ReadDetailBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.lineLab];
        [self addSubview:self.browseBtn];
        [self addSubview:self.browseLab];
        [self addSubview:self.dianZanBtn];
        [self addSubview:self.dianZanLab];
        [self addSubview:self.backTopBtn];
        [self addSubview:self.backTopLab];
        
        [self addLayOut];
        
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.browseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(30);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    [self.browseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.browseBtn.mas_right).with.offset(6);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    [self.dianZanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IS_IPHONE_X) {
            make.left.equalTo(weakself.mas_left).with.offset(160);
            make.centerY.equalTo(weakself.mas_centerY);
        }else if (IS_IPHONE_6s){
            make.left.equalTo(weakself.mas_left).with.offset(160);
            make.centerY.equalTo(weakself.mas_centerY);
        }
        else{
            make.left.equalTo(weakself.mas_left).with.offset(180);
            make.centerY.equalTo(weakself.mas_centerY);
        }
    }];
    [self.dianZanLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.dianZanBtn.mas_right).with.offset(6);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    [self.backTopLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).with.offset(-30);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    [self.backTopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.backTopLab.mas_left).with.offset(-6);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    
}

-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [[UILabel alloc]init];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}
-(UIButton *)browseBtn{
    if (!_browseBtn) {
        _browseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_browseBtn setImage:[UIImage imageNamed:@"read_article"] forState:UIControlStateNormal];
    }
    return _browseBtn;
}
-(UILabel *)browseLab{
    if (!_browseLab) {
        _browseLab = [[UILabel alloc]init];
        _browseLab.text = @"3928";
        _browseLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _browseLab.font = BQFONT(13);
    }
    return _browseLab;
}
- (UIButton *)dianZanBtn{
    if (!_dianZanBtn) {
        _dianZanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_dianZanBtn setImage:[UIImage imageNamed:@"snap_article_nor"] forState:UIControlStateNormal];
    }
    return _dianZanBtn;
}
-(UILabel *)dianZanLab{
    if (!_dianZanLab) {
        _dianZanLab = [[UILabel alloc]init];
        _dianZanLab.text = @"2342";
        _dianZanLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _dianZanLab.font = BQFONT(13);
    }
    return _dianZanLab;
}
-(UIButton *)backTopBtn{
    if (!_backTopBtn) {
        _backTopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 未选中状态
        [_backTopBtn setImage:[UIImage imageNamed:@"backtotop_article"] forState:UIControlStateNormal];
    }
    return _backTopBtn;
}
-(UILabel *)backTopLab{
    if (!_backTopLab) {
        _backTopLab = [[UILabel alloc]init];
        _backTopLab.text = @"返回顶部";
        _backTopLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _backTopLab.font = BQFONT(13);
    }
    return _backTopLab;
}

@end
