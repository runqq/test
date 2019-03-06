//
//  CampTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CampTableViewCell.h"

@implementation CampTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style
             reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headImg];
        
        [self addLayOUt];
    }
    return self;
}

- (void)addLayOUt{
    __weak typeof(self) weakself = self;
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 170));
    }];
}
-(UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [UIImageView new];
        NSString *urlStr = @"http://p5imis0yp.bkt.clouddn.com/2.PNG";
        [_headImg sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
    }
    return _headImg;
}


@end
