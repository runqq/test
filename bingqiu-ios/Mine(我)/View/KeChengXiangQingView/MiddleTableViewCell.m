//
//  MiddleTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MiddleTableViewCell.h"

@implementation MiddleTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.zLabel];
        [self.contentView addSubview:self.fLabel];
        
        [self createUI];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableview{
    MiddleTableViewCell *twoCell = [tableview dequeueReusableCellWithIdentifier:@"twoCell"];
    if (!twoCell) {
        twoCell = [[MiddleTableViewCell alloc]init];
    }
    return twoCell;
}

- (void)createUI{
    
    __weak typeof(self) weakSelf = self;
    [self.zLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(25);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(80, 14));
    }];
    [self.fLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.zLabel.mas_right).with.offset(27);
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(300, 14));
    }];
    
}

-(UILabel *)zLabel{
    if (!_zLabel) {
        _zLabel = [[UILabel alloc]init];
        _zLabel.text = @"上课时间";
        _zLabel.textColor = [UIColor colorWithHexString:@"#888888"];
        _zLabel.font = BQFONT(14);
    }
    return _zLabel;
}

-(UILabel *)fLabel{
    if (!_fLabel) {
        _fLabel = [[UILabel alloc]init];
//        _fLabel.text = @"2018年7月17日 13:00:02-14:00:02";
        _fLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _fLabel.font = BQFONT(14);
    }
    
    return _fLabel;
}



@end
