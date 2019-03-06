//
//  CampTwoTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CampTwoTableViewCell.h"

@implementation CampTwoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.dtImg];
        [self.contentView addSubview:self.contenLab];
        [self.contentView addSubview:self.countDownLab];
        [self.contentView addSubview:self.numLab];
        
        [self addLayOUt];
        
    };
    return self;
}

- (void)addLayOUt{
    __weak typeof(self) weakself = self;
    
    [self.dtImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W - 30, 200));
    }];
    [self.contenLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.dtImg.mas_bottom).with.offset(15);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.countDownLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.contenLab.mas_bottom).with.offset(5);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.contenLab.mas_bottom).with.offset(5);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
}
-(UIImageView *)dtImg{
    if (!_dtImg) {
        _dtImg = [UIImageView new];
        _dtImg.backgroundColor = [UIColor grayColor];
    }
    return _dtImg;
}
-(UILabel *)contenLab{
    if (!_contenLab) {
        _contenLab = [UILabel new];
        _contenLab.text = @"5天冰球进阶精英训练营";
        _contenLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _contenLab.font = BQBOLDFONT(17);
    }
    return _contenLab;
}

-(UILabel *)countDownLab{
    if (!_countDownLab) {
        _countDownLab = [UILabel new];
        _countDownLab.text = @"报名截止时间: 2018.10.21";
        _countDownLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _countDownLab.font = BQFONT(12);
    }
    return _countDownLab;
}

-(UILabel *)numLab{
    
    if (!_numLab) {
        _numLab = [UILabel new];
        _numLab.text = @"3819人已报名";
        _numLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _numLab.font = BQFONT(12);
        [_numLab sizeToFit];
        
    }
    return _numLab;
    
}


@end
