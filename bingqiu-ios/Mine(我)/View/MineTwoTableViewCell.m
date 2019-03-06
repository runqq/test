//
//  MineTwoTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MineTwoTableViewCell.h"

@implementation MineTwoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.leftLab];
        [self.contentView addSubview:self.rightLab];
        [self addLayOut];
    }
    return self;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.text = @"现金余额";
        _leftLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _leftLab.font = BQBOLDFONT(16);
        [_leftLab sizeToFit];
    }
    return _leftLab;
}

-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = [UILabel new];
        _rightLab.text = @"0.00元";
        _rightLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
        _rightLab.font = BQBOLDFONT(14);
        [_rightLab sizeToFit];
    }
    return _rightLab;
}

@end
