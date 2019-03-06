//
//  InformationTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "InformationTableViewCell.h"

@implementation InformationTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.imageV];
        [self addSubview:self.titleLabel];
        [self addSubview:self.readImage];
        [self addSubview:self.readLabel];
        [self addSubview:self.zanImage];
        [self addSubview:self.zanLabel];
        [self addSubview:self.bottomLine];
        
        [self createUI];
    }
    return self;
}

+ (instancetype)cellWithTableVIew:(UITableView *)tableView{
    
    InformationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstTableViewCell"];
    if (!cell) {
        cell = [[InformationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FirstTableViewCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(void)createUI{
    __weak typeof(self) weakSelf = self;
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(15);
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(114, 74));
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).with.offset(15);
        make.left.equalTo(weakSelf.imageV.mas_right).with.offset(15);
        make.right.equalTo(weakSelf.mas_right).with.offset(-15);
        
    }];
    
    [self.zanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.imageV.mas_bottom);
        make.right.equalTo(weakSelf.mas_right).with.offset(-15);
    }];
    
    [self.zanImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.imageV.mas_bottom).with.offset(0);
        make.right.equalTo(weakSelf.zanLabel.mas_left).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
    
    [self.readLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.imageV.mas_bottom);
        make.right.equalTo(weakSelf.zanImage.mas_left).with.offset(-20);
        
    }];
    
    [self.readImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.imageV.mas_bottom);
        make.right.equalTo(weakSelf.readLabel.mas_left).with.offset(-5);
        make.size.mas_equalTo(CGSizeMake(18, 12));
    }];
    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).with.offset(15);
        make.bottom.equalTo(weakSelf.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W - 30, 0.5));
    }];
    
}

-(UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [UIImageView new];
        _imageV.backgroundColor = [UIColor redColor];
    }
    return _imageV;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = BQBOLDFONT(16);
        _titleLabel.preferredMaxLayoutWidth = 240;
        [_titleLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"冰球进校园2018北京市中小学生校际冰球联赛闭幕";
    }
    return _titleLabel;
}

-(UIImageView *)readImage{
    if (!_readImage) {
        _readImage = [UIImageView new];
        _readImage.image = [UIImage imageNamed:@"read_raiders"];
    }
    return _readImage;
}

-(UILabel *)readLabel{
    if (!_readLabel) {
        _readLabel = [UILabel new];
        _readLabel.font = [UIFont systemFontOfSize:12];
        _readLabel.text = @"3928";
    }
    return _readLabel;
}

-(UIImageView *)zanImage{
    if (!_zanImage) {
        _zanImage = [UIImageView new];
        _zanImage.image = [UIImage imageNamed:@"snap_raiders"];
    }
    return _zanImage;
}

-(UILabel *)zanLabel{
    if (!_zanLabel) {
        _zanLabel = [UILabel new];
        _zanLabel.font = [UIFont systemFontOfSize:12];
        _zanLabel.text = @"2342";
    }
    return _zanLabel;
}
-(UILabel *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UILabel alloc]init];
        _bottomLine.textAlignment = NSTextAlignmentCenter;
        _bottomLine.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _bottomLine;
}



@end
