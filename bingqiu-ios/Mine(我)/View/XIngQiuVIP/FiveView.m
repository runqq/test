//
//  FiveView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FiveView.h"

@implementation FiveView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.titlLab];
        [self addSubview:self.contenLab];
    }
    return self;
}
-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 200, 16)];
        _titlLab.text = @"购买需知:";
        _titlLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titlLab.font = BQFONT(16);
    }
    return _titlLab;
}
-(UILabel *)contenLab{
    if (!_contenLab) {
        _contenLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, SCREEN_W-30, 170)];
        _contenLab.text = @"1.两周、一个月为体验模式。硬件押金为3500。损坏不退还\n押金。\n2.大于等于六个月免费提供硬件服务，更换硬件收费3500\n元，硬件质保为一年。\n3.续费第二天生效。";
        _contenLab.numberOfLines = 0;
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_contenLab.text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:5];//调整行间距
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [_contenLab.text length])];
        _contenLab.attributedText = attributedString;
        
        _contenLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _contenLab.font = BQFONT(13);
    }
    return _contenLab;
}

@end
