//
//  FirstTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titLab1];
        [self.contentView addSubview:self.titLab2];
        [self.contentView addSubview:self.titLab3];
        [self.contentView addSubview:self.numLab1];
        [self.contentView addSubview:self.numLab2];
        [self.contentView addSubview:self.numLab3];
        
        [self addLayOut];
        
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    FirstTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
    if (!firstCell) {
        firstCell = [[FirstTableViewCell alloc]init];
    }
    firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return firstCell;
}

- (void)addLayOut{
    
    __weak typeof(self) weakself = self;
    
    [self.numLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab1.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake((SCREEN_W - 30)/3, 24));
    }];
    
    [self.numLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab2.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset((SCREEN_W - 30)/3);
        make.size.mas_equalTo(CGSizeMake((SCREEN_W - 30)/3, 24));
    }];
    
    [self.numLab3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab3.mas_bottom).with.offset(10);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake((SCREEN_W - 30)/3, 24));
    }];
    
    
}

-(UILabel *)titLab1{
    if (!_titLab1) {
        _titLab1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, (SCREEN_W-30)/3, 11)];
        _titLab1.text = @"总时长";
        _titLab1.font = BQFONT(12);
        _titLab1.textAlignment = NSTextAlignmentLeft;
        _titLab1.textColor = [UIColor colorWithHexString:@"#333333"];
        
    }
    return _titLab1;
}

-(UILabel *)titLab2{
    if (!_titLab2) {
        _titLab2 = [[UILabel alloc]initWithFrame:CGRectMake(((SCREEN_W-30)/3), 15, (SCREEN_W-30)/3, 11)];
        _titLab2.text = @"日均";
        _titLab2.font = BQFONT(12);
        _titLab2.textAlignment = NSTextAlignmentCenter;
        _titLab2.textColor = [UIColor colorWithHexString:@"#333333"];
        
    }
    return _titLab2;
}

-(UILabel *)titLab3{
    if (!_titLab3) {
        _titLab3 = [[UILabel alloc]initWithFrame:CGRectMake(((SCREEN_W-30)/3) *2, 15, (SCREEN_W-30)/3, 11)];
        _titLab3.text = @"售价";
        _titLab3.font = BQFONT(12);
        _titLab3.textAlignment = NSTextAlignmentRight;
        _titLab3.textColor = [UIColor colorWithHexString:@"#333333"];
        
    }
    return _titLab3;
}

-(UILabel *)numLab1{
    if (!_numLab1) {
        _numLab1 = [UILabel new];
        _numLab1.text = @"0天";
        _numLab1.font = BQFONT(24);
        _numLab1.textAlignment = NSTextAlignmentLeft;
    }
    return _numLab1;
}
-(UILabel *)numLab2{
    if (!_numLab2) {
        _numLab2 = [UILabel new];
        _numLab2.text = @"0小时";
        _numLab2.font = BQFONT(24);
        _numLab2.textAlignment = NSTextAlignmentCenter;
        
    }
    return _numLab2;
}
-(UILabel *)numLab3{
    if (!_numLab3) {
        _numLab3 = [UILabel new];
        _numLab3.text = @"0元";
        _numLab3.font = BQFONT(24);
        _numLab3.textAlignment = NSTextAlignmentRight;
    }
    return _numLab3;
}
@end
