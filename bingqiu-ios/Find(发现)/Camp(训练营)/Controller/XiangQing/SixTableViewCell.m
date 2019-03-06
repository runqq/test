//
//  SixTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "SixTableViewCell.h"

@implementation SixTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titleLab];
        
        [self.contentView addSubview:self.textV];
        
//        [self.contentView addSubview:self.contentLabOne];
//        [self.contentView addSubview:self.contentLabTwo];
//        [self.contentView addSubview:self.contentLabThree];
//        [self.contentView addSubview:self.contentLabFour];
        
        [self.contentView addSubview:self.line];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    SixTableViewCell *sixCell = [tableView dequeueReusableCellWithIdentifier:@"sixCell"];
    if (!sixCell) {
        sixCell = [[SixTableViewCell alloc]init];
    }
    sixCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return sixCell;
}

- (void)addLayOut{
    
    __weak typeof(self) weakself = self;
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    
    [self.textV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titleLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W-30, 100));
    }];
    
    
//    [self.contentLabOne mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakself.titleLab.mas_bottom).with.offset(10);
//        make.left.equalTo(weakself.mas_left).with.offset(15);
//    }];
//    [self.contentLabTwo mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakself.contentLabOne.mas_bottom).with.offset(5);
//        make.left.equalTo(weakself.mas_left).with.offset(15);
//    }];
//    [self.contentLabThree mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakself.contentLabTwo.mas_bottom).with.offset(5);
//        make.left.equalTo(weakself.mas_left).with.offset(15);
//    }];
//    [self.contentLabFour mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(weakself.contentLabThree.mas_bottom).with.offset(5);
//        make.left.equalTo(weakself.mas_left).with.offset(15);
//    }];
//    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
//        make.left.equalTo(weakself.mas_left).with.offset(15);
//        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
//
//    }];
    
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"训练内容";
        _titleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLab.font = BQBOLDFONT(16);
    }
    return _titleLab;
}
-(UITextView *)textV{
    if (!_textV) {
        _textV = [UITextView new];
        _textV.text = @"1.连续五天的集结训练;\n2.现任匹兹堡企鹅队教练执教;\n3.形式新颖的课程,给每位学员都能带来有针对性的指导.";
        _textV.textColor = [UIColor colorWithHexString:@"#666666"];
        _textV.userInteractionEnabled = NO;
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10;// 字体的行间距
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:13],
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        _textV.attributedText = [[NSAttributedString alloc] initWithString:_textV.text attributes:attributes];
        
    }
    return _textV;
}
//-(UILabel *)contentLabOne{
//    if (!_contentLabOne) {
//        _contentLabOne = [UILabel new];
////        _contentLabOne.text = @"1、Powerskating";
//        _contentLabOne.textColor = [UIColor colorWithHexString:@"#666666"];
//        _contentLabOne.font = BQFONT(13);
//    }
//    return _contentLabOne;
//}
//
//-(UILabel *)contentLabTwo{
//    if (!_contentLabTwo) {
//        _contentLabTwo = [UILabel new];
////        _contentLabTwo.text = @"2、控制带球技巧";
//        _contentLabTwo.textColor = [UIColor colorWithHexString:@"#666666"];
//        _contentLabTwo.font = BQFONT(13);
//    }
//    return _contentLabTwo;
//}
//
//-(UILabel *)contentLabThree{
//    if (!_contentLabThree) {
//        _contentLabThree = [UILabel new];
////        _contentLabThree.text = @"3、多项射门技巧";
//        _contentLabThree.textColor = [UIColor colorWithHexString:@"#666666"];
//        _contentLabThree.font = BQFONT(13);
//    }
//    return _contentLabThree;
//}
//
//-(UILabel *)contentLabFour{
//    if (!_contentLabFour) {
//        _contentLabFour = [UILabel new];
////        _contentLabFour.text = @"4、顶级职业技巧";
//        _contentLabFour.textColor = [UIColor colorWithHexString:@"#666666"];
//        _contentLabFour.font = BQFONT(13);
//    }
//    return _contentLabFour;
//}

-(UILabel *)line{
    if (!_line) {
        _line = [UILabel new];
        _line.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _line;
}


@end
