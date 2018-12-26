//
//  ReadTwoTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReadTwoTableViewCell.h"

@implementation ReadTwoTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.leftLab];
        [self.contentView addSubview:self.titLab];
        [self.contentView addSubview:self.contentTV];
        
        [self setLayOut];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    ReadTwoTableViewCell *twoCell = [tableView dequeueReusableCellWithIdentifier:@"twoCell"];
    if (!twoCell) {
        twoCell = [[ReadTwoTableViewCell alloc]init];
    }
    // 设置点击样式
    twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return twoCell;
}

-(void)setLayOut{
    
    __weak typeof(self) weakself = self;
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(3, 15));
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(8);
        make.left.equalTo(weakself.leftLab.mas_right).with.offset(10);
    }];
    [self.contentTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab.mas_bottom).with.offset(5);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W-30, 50));
    }];
    
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [UILabel new];
        _leftLab.backgroundColor = [UIColor colorWithHexString:@"#fc5d5d"];
        _leftLab.layer.masksToBounds = YES;
        _leftLab.layer.cornerRadius = 1.5;
    }
    return _leftLab;
}

-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [UILabel new];
        _titLab.text = @"注意事项";
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQBOLDFONT(16);
        [_titLab sizeToFit];
    }
    return _titLab;
}

-(UITextView *)contentTV{
    if (!_contentTV) {
        _contentTV = [UITextView new];
        _contentTV.userInteractionEnabled = NO;
        _contentTV.text = @"练习是要佩戴正规头盔护具等,如果感到任何疼痛和不适请立即停止";
        _contentTV.font = BQFONT(14);
//        _contentTV.backgroundColor = [UIColor greenColor];
        
    }
    return _contentTV;
}

@end
