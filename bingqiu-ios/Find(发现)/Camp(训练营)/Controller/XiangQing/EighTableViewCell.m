//
//  EighTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "EighTableViewCell.h"

@implementation EighTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.boultBtn];
        [self.contentView addSubview:self.attionView];
        [self.contentView addSubview:self.lineLab];
        
        [self addLayOut];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    EighTableViewCell  *eightCell = [tableView dequeueReusableCellWithIdentifier:@"eighTableViewCell"];
    if (!eightCell) {
        eightCell = [[EighTableViewCell alloc] init];
    }
    eightCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return eightCell;
    
}

-(void)addLayOut{
    
    __weak typeof(self) weakself = self;
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    
    [self.boultBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.attionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titleLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W-30, 100));
    }];
    
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"注意事项";
        _titleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        [_titleLab sizeToFit];
    }
    return _titleLab;
}

-(UIButton *)boultBtn{
    if (!_boultBtn) {
        _boultBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _boultBtn.backgroundColor = [UIColor redColor];
        [_boultBtn setImage:[UIImage imageNamed:@"arrow_right_black"] forState:UIControlStateNormal];
    }
    return _boultBtn;
}

-(UITextView *)attionView{
    if (!_attionView) {
        _attionView = [UITextView new];
        _attionView.userInteractionEnabled = NO;
        _attionView.text = @"如需意外保险,学员需自行购买.学员需自带护具装备.学\n员一旦入营需听从教练管理.学员一旦入营,非特殊情况,\n不可请假.请假视同放弃课.并不能获得结营证书.售...";
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10;// 字体的行间距
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:13],
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        _attionView.attributedText = [[NSAttributedString alloc] initWithString:_attionView.text attributes:attributes];
    }
    return _attionView;
}

-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}

@end
