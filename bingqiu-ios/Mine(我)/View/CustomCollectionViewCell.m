//
//  CustomCollectionViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/2.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.photoImg];
        [self addSubview:self.titlLab];
        
    }
    return self;
}

-(UIImageView *)photoImg{
    if (!_photoImg) {
        _photoImg = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_W/4-SCREEN_W*0.08)/2, 15, SCREEN_W*0.08, SCREEN_W*0.08)];
        
    }
    return _photoImg;
}
-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_photoImg.frame)+10, SCREEN_W/4, 14)];
        _titlLab.font = BQBOLDFONT(12);
        _titlLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titlLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titlLab;
}

@end
