//
//  ReadThreeTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReadThreeTableViewCell.h"

@implementation ReadThreeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.readBtn];
        [self.contentView addSubview:self.separatorLab];
        [self.contentView addSubview:self.videoBtn];
        [self.contentView addSubview:self.readLineLab];
        [self.contentView addSubview:self.videoLineLab];
        [self.contentView addSubview:self.lineLab];
        
        [self addLayOut];
        
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    ReadThreeTableViewCell *threeCell = [tableView dequeueReusableCellWithIdentifier:@"threeCell"];
    if (!threeCell) {
        threeCell = [[ReadThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"threeCell"];
    }
    return threeCell;
}

-(void)addLayOut{
    
    __weak typeof(self) weakself = self;
    [self.readBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.size.mas_equalTo(CGSizeMake((SCREEN_W-30)/2-10, 49));
    }];
    [self.readLineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(-1);
        make.centerX.equalTo(weakself.readBtn.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(50, 1));
    }];
    [self.videoLineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom).with.offset(-1);
        make.centerX.equalTo(weakself.videoBtn.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(50, 1));
    }];
    [self.separatorLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(15);
        make.left.equalTo(weakself.readBtn.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(1, 20));
    }];
    [self.videoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.right.equalTo(weakself.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake((SCREEN_W-30)/2-10, 49));
    }];
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.bottom.equalTo(weakself.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
}

-(UIButton *)readBtn{
    if (!_readBtn) {
        _readBtn = [UIButton new];
        [_readBtn setTitle:@"必读" forState:UIControlStateNormal];
        _readBtn.titleLabel.font = BQBOLDFONT(16);
        [_readBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
        [_readBtn addTarget:self action:@selector(mastReadBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _readBtn;
}

-(UILabel *)readLineLab{
    if (!_readLineLab) {
        _readLineLab = [UILabel new];
        _readLineLab.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
    }
    return _readLineLab;
}

-(UILabel *)separatorLab{
    if (!_separatorLab) {
        _separatorLab = [UILabel new];
        _separatorLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _separatorLab;
}

-(UIButton *)videoBtn{
    if (!_videoBtn) {
        _videoBtn = [UIButton new];
        [_videoBtn setTitle:@"视频" forState:UIControlStateNormal];
        _videoBtn.titleLabel.font = BQBOLDFONT(16);
        [_videoBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
        [_videoBtn addTarget:self action:@selector(Click_VideoBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _videoBtn;
}

-(UILabel *)videoLineLab{
    if (!_videoLineLab) {
        _videoLineLab = [UILabel new];
        _videoLineLab.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        _videoLineLab.hidden = YES;
    }
    return _videoLineLab;
}

-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}
-(void)mastReadBtn:(UIButton *)sender{
    
    if (self.btnClickedBlock) {
        self.btnClickedBlock(YES);
    }
    self.readLineLab.hidden = NO;
    self.videoLineLab.hidden = YES;
    [self.readBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
    [self.videoBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    
}
-(void)Click_VideoBtn:(UIButton *)videoBtnSender{
    if (self.btnClickedBlock) {
        self.btnClickedBlock(NO);
    }
    
    self.readLineLab.hidden = YES;
    self.videoLineLab.hidden = NO;
    [self.readBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    [self.videoBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
    

}
@end
