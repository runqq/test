//
//  ReadTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReadTableViewCell.h"

@implementation ReadTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.contentLab];
        [self.contentView addSubview:self.numberLab];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTbaleView:(UITableView *)tableview{
    
    ReadTableViewCell *readCell = [tableview dequeueReusableCellWithIdentifier:@"readCell"];
    if (!readCell) {
        readCell = [[ReadTableViewCell alloc]init];
    }
    readCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return readCell;
    
}

-(void)addLayOut{
    
    __weak typeof(self) weakself = self;
    
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
    }];
    
}

-(UILabel *)contentLab{
    if (!_contentLab) {
        _contentLab = [UILabel new];
        _contentLab.text = @"如何通过规范姿势来提高速度?";
        _numberLab.font = BQFONT(14);
        _numberLab.textColor = [UIColor colorWithHexString:@"#333333"];
//        _contentLab.backgroundColor = [UIColor grayColor];
    }
    return _contentLab;
}

-(UILabel *)numberLab{
    if (!_numberLab) {
        _numberLab = [UILabel new];
        _numberLab.text = @"2345人看过";
        _numberLab.font = BQFONT(12);
        _numberLab.textColor = [UIColor colorWithHexString:@"#999999"];
//        _numberLab.backgroundColor = [UIColor redColor];
    }
    return _numberLab;
}


@end
