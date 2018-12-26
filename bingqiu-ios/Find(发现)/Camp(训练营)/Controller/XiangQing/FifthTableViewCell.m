//
//  FifthTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FifthTableViewCell.h"

@implementation FifthTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.trainSiteLab];
        [self.contentView addSubview:self.siteLab1];
        [self.contentView addSubview:self.siteLab2];
        [self.contentView addSubview:self.line];
        
        [self addLayOut];
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    FifthTableViewCell *fifCell = [tableView dequeueReusableCellWithIdentifier:@"fifCell"];
    if (!fifCell) {
        fifCell = [[FifthTableViewCell alloc]init];
        
    }
    fifCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return fifCell;
}

-(void)addLayOut{
    
    __weak typeof(self) weakself = self;
    
    [self.trainSiteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        
    }];
    
    [self.siteLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.trainSiteLab.mas_bottom).with.offset(20);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        
    }];
    
    [self.siteLab2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.siteLab1.mas_bottom).with.offset(10);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
        
    }];
    
}

-(UILabel *)trainSiteLab{
    if (!_trainSiteLab) {
        _trainSiteLab = [UILabel new];
        _trainSiteLab.text = @"训练地点";
        _trainSiteLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _trainSiteLab.font = BQBOLDFONT(16);
    }
    return _trainSiteLab;
}

-(UILabel *)siteLab1{
    if (!_siteLab1) {
        _siteLab1 = [UILabel new];
        _siteLab1.text = @"华星冰上运动中心(沙河馆)";
        _siteLab1.font = BQFONT(13);
        _siteLab1.textColor = [UIColor colorWithHexString:@"#666666"];
    }
    return _siteLab1;
}

-(UILabel *)siteLab2{
    if (!_siteLab2) {
        _siteLab2 = [UILabel new];
//        _siteLab2.text = @"北京市昌平区沙河镇民园小区对面";
        _siteLab2.textColor = [UIColor colorWithHexString:@"#666666"];
    }
    return _siteLab2;
}

-(UILabel *)line{
    if (!_line) {
        _line = [UILabel new];
        _line.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _line;
}


@end
