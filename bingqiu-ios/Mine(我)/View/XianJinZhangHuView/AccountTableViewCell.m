//
//  AccountTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "AccountTableViewCell.h"

@implementation AccountTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.dateLab];
        [self.contentView addSubview:self.zhiChuLab];
        [self.contentView addSubview:self.chongZhiLab];
        [self.contentView addSubview:self.downbtn];
        
        [self createUI];
        
    }
    return self;
}

+(instancetype)cellWithTableview:(UITableView *)tableview{
    AccountTableViewCell *oneCell = [tableview dequeueReusableCellWithIdentifier:@"oneCell"];
    if (!oneCell) {
        oneCell = [[AccountTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"oneCell"];
    }
    return oneCell;
}

-(void)createUI{
    __weak typeof(self) weakSelf = self;
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(15);
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
    }];
    [self.zhiChuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-17);
    }];
    [self.chongZhiLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.zhiChuLab.mas_right).with.offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).with.offset(-17);
    }];
    [self.downbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(20);
        make.left.equalTo(weakSelf.dateLab.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(14, 8));
    }];
}

-(UILabel *)dateLab{
    if (!_dateLab) {
        _dateLab = [[UILabel alloc]init];
        _dateLab.text = @"2018年8月";
        _dateLab.font = BQBOLDFONT(16);
        _dateLab.textColor = [UIColor colorWithHexString:@"#333333"];
        [_dateLab sizeToFit];
    }
    return _dateLab;
}
-(UILabel *)zhiChuLab{
    if (!_zhiChuLab) {
        _zhiChuLab = [[UILabel alloc]init];
        _zhiChuLab.text = @"支出¥34.00";
        _zhiChuLab.font = BQFONT(14);
        _zhiChuLab.textColor = [UIColor colorWithHexString:@"#666666"];
        [_zhiChuLab sizeToFit];
    }
    return _zhiChuLab;
}
-(UILabel *)chongZhiLab{
    if (!_chongZhiLab) {
        _chongZhiLab = [[UILabel alloc]init];
        _chongZhiLab.text = @"充值¥4.00";
        _chongZhiLab.font = BQFONT(14);
        _chongZhiLab.textColor = [UIColor colorWithHexString:@"#666666"];
        [_chongZhiLab sizeToFit];
    }
    return _chongZhiLab;
}
-(UIButton *)downbtn{
    if (!_downbtn) {
        _downbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_downbtn setImage:[UIImage imageNamed:@"arrow_down_cash"] forState:UIControlStateNormal];
    }
    return _downbtn;
}

@end
