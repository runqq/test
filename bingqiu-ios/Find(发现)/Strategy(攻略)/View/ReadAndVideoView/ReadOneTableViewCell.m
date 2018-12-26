//
//  ReadTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReadOneTableViewCell.h"

@implementation ReadOneTableViewCell

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
    
    ReadOneTableViewCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"oneCell"];
    if (!oneCell) {
        oneCell = [[ReadOneTableViewCell alloc]init];
    
    }
    // 设置点击样式
    oneCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return oneCell;
}

-(void)setLayOut{
    
    __weak typeof(self) weakself = self;
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(3, 15));
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(18);
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
        _leftLab.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        _leftLab.layer.masksToBounds = YES;
        _leftLab.layer.cornerRadius = 1.5;
    }
    return _leftLab;
}

-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [UILabel new];
        _titLab.text = @"适合人群";
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQBOLDFONT(16);
        [_titLab sizeToFit];
    }
    return _titLab;
}

-(UITextView *)contentTV{
    if (!_contentTV) {
        _contentTV = [UITextView new];
        _contentTV.text = @"本课程适合已经有一定训练基础的冰球学院,主要用于提高速度,缺乏基础的也可以再教练指导下进行训练";
        _contentTV.font = BQFONT(14);
        _contentTV.userInteractionEnabled = NO;
    }
    return _contentTV;
}

@end
