//
//  StuInformationCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "StuInformationCell.h"

@implementation StuInformationCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.titLab];
        [self addSubview:self.detailImg];
        [self addSubview:self.headImg];
        
        [self createTableViewCell];
    }
    return self;
}

-(void)createTableViewCell{
    __weak typeof(self) weakSelf = self;
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
        
    }];
    [self.detailImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).with.offset(-15);
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
    }];
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.detailImg.mas_left).with.offset(-15);
        make.centerY.mas_equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(62, 62));
    }];
}
-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [[UILabel alloc]init];
        _titLab.text = @"更换头像";
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQBOLDFONT(16);
        [_titLab sizeToFit];
    }
    return _titLab;
}
-(UIImageView *)detailImg{
    if (!_detailImg) {
        _detailImg = [[UIImageView alloc]init];
        _detailImg.image = [UIImage imageNamed:@"arrow_right_black"];
    }
    return _detailImg;
}
-(UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [[UIImageView alloc]init];
        _headImg.userInteractionEnabled = YES;
        _headImg.layer.masksToBounds = YES;
        _headImg.layer.cornerRadius = 31;
    }
    return _headImg;
}

@end
