//
//  RightTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/6.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "RightTableViewCell.h"

@implementation RightTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.bottomLine];
        [self.contentView addSubview:self.titleLab];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTableVIew:(UITableView *)tableView{
        RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[RightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom);
        make.right.equalTo(weakself.mas_right).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(280, 0.5));
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.centerY.equalTo(weakself.mas_centerY);
    }];
}

-(UILabel *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [UILabel new];
        _bottomLine.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _bottomLine;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titleLab.font = BQFONT(14);
    }
    return _titleLab;
}

@end
