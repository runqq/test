//
//  SecTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "SecTableViewCell.h"

@implementation SecTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.classLab];
        [self.contentView addSubview:self.boultBtn];
        [self.contentView addSubview:self.textV];
        [self.contentView addSubview:self.lineLab];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    SecTableViewCell *secCell = [tableView dequeueReusableCellWithIdentifier:@"secCell"];
    if (!secCell) {
        secCell = [[SecTableViewCell alloc]init];
        
    }
    secCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return secCell;
}

- (void)addLayOut{
    
    __weak typeof(self) weakself = self;
    
    [self.classLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.boultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.textV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.classLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W-30, 100));
    }];
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
}

-(UILabel *)classLab{
    if (!_classLab) {
        _classLab = [UILabel new];
        _classLab.text = @"课程介绍";
        _classLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _classLab.font = BQBOLDFONT(16);
    }
    return _classLab;
}

-(UIButton *)boultBtn{
    if (!_boultBtn) {
        _boultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _boultBtn.backgroundColor = [UIColor redColor];
        [_boultBtn setImage:[UIImage imageNamed:@"arrow_right_black"] forState:UIControlStateNormal];
    }
    return _boultBtn;
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

-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}


@end
