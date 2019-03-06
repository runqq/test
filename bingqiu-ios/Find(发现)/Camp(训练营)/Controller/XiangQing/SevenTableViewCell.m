//
//  SevenTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "SevenTableViewCell.h"

@implementation SevenTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.telLab];
        [self.contentView addSubview:self.numLab];
        [self.contentView addSubview:self.line];
        
        [self addLayOut];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    SevenTableViewCell *sevenCell = [tableView dequeueReusableCellWithIdentifier:@"sevenCell"];
    if (!sevenCell) {
        sevenCell = [[SevenTableViewCell alloc]init];
    }
    return sevenCell;
}

- (void)addLayOut{
    
    __weak typeof(self) weakself = self;
    
    [self.telLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.telLab.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
}

-(UILabel *)telLab{
    if (!_telLab) {
        _telLab = [UILabel new];
        _telLab.text = @"咨询电话";
        _telLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _telLab.font = BQBOLDFONT(16);
    }
    return _telLab;
}

-(UILabel *)numLab{
    if (!_numLab) {
        _numLab = [UILabel new];
        _numLab.text = @"189-1125-1607";
        _numLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _numLab.font = BQFONT(13);
    }
    return _numLab;
}

-(UILabel *)line{
    if (!_line) {
        _line = [UILabel new];
        _line.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _line;
}

@end
