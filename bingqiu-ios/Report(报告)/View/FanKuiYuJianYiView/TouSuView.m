//
//  TouSuView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/5.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TouSuView.h"

@implementation TouSuView

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.textV];
        [self.textV addSubview:self.contentLab];
        [self.textV addSubview:self.ziShuLab];
        
        [self addLayOut];
        
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.textV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 150));
    }];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.ziShuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(-10);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(60, 14));
    }];
    
}

-(UITextView *)textV{
    if (!_textV) {
        _textV = [[UITextView alloc]init];
        _textV.font = BQFONT(16);
        _textV.textColor = [UIColor colorWithHexString:@"#333333"];
        _textV.delegate = self;
        
    }
    return _textV;
}
-(UILabel *)contentLab{
    if (!_contentLab) {
        _contentLab = [UILabel new];
        _contentLab.text = @"请在此输入你的投诉内容";
        _contentLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _contentLab.font = BQFONT(16);
    }
    return _contentLab;
}
-(UILabel *)ziShuLab{
    if (!_ziShuLab) {
        _ziShuLab = [UILabel new];
        _ziShuLab.text =@"0/100";
        _ziShuLab.textAlignment = NSTextAlignmentRight;
        _ziShuLab.font = BQFONT(14);
        _ziShuLab.textColor = [UIColor colorWithHexString:@"#999999"];
    }
    return _ziShuLab;
}

// 当有文字输入的时候,占位文字消失,否则显示占位文字
-(void)textViewDidChange:(UITextView *)textView{
    if (self.textV.text.length == 0) {
        self.contentLab.hidden = NO;
    }else{
        self.contentLab.hidden = YES;
    }
    self.ziShuLab.text = [NSString stringWithFormat:@"%lu/100",self.textV.text.length];
    // 字数限制操作
    if (self.textV.text.length >= 100) {
        self.textV.text = [self.textV.text substringToIndex:100];
        self.ziShuLab.text = @"100/100";
    }
}

@end
