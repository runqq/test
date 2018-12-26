//
//  ShareView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/3.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
        self.backgroundColor = [UIColor colorWithRed:0. green:0. blue:0. alpha:0.5];
        
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.lineLab];
        [self.bgView addSubview:self.cancelBtn];
        [self.bgView addSubview:self.weiXinBtn];
        [self.bgView addSubview:self.pengYouQuanBtn];
        [self.bgView addSubview:self.weiBoBtn];
        [self.bgView addSubview:self.QQkongJianBtn];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.bgView.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 43));
    }];
    [self.lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.bgView.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.cancelBtn.mas_top);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 0.5));
    }];
    [self.weiXinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(30);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/4+10, 72));
    }];
    [self.pengYouQuanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(30);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(SCREEN_W/4);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/4, 72));
    }];
    [self.weiBoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(30);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(SCREEN_W/4 * 2);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/4, 72));
    }];
    [self.QQkongJianBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(30);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(SCREEN_W/4 * 3);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W/4, 72));
    }];
    
    
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_H-155, SCREEN_W, 155)];
        _bgView.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    }
    return _bgView;
}

-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [UILabel new];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}
-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _cancelBtn.backgroundColor = [UIColor redColor];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        _cancelBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_cancelBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = BQBOLDFONT(17);
    }
    return _cancelBtn;
}
-(UIButton *)weiXinBtn{
    if (!_weiXinBtn) {
        _weiXinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        /* 获取按钮文字的宽度 获取按钮图片和文字的间距 获取图片宽度 */
        CGFloat    space = 5;// 图片和文字的间距
        NSString    * titleString = [NSString stringWithFormat:@"微信好友"];
        CGFloat    titleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
        
        UIImage    *btnImage = [UIImage imageNamed:@"weixin_share_icon"];
        CGFloat    imageWidth = btnImage.size.width;
        [_weiXinBtn setImage:btnImage forState:UIControlStateNormal];
        [_weiXinBtn setTitle:titleString forState:UIControlStateNormal];
        [_weiXinBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        _weiXinBtn.titleLabel.font = BQFONT(12);
        _weiXinBtn.titleLabel.frame = CGRectMake(0, 0, SCREEN_W/4, 72);
        
        /**需要先获取图片和文字的高度**/
        CGFloat    imageHeight = btnImage.size.height;
        CGFloat    titleHeight = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].height;
        
        [_weiXinBtn setImageEdgeInsets:UIEdgeInsetsMake(-(imageHeight*0.5 + space*0.5), titleWidth*0.5, imageHeight*0.5 + space*0.5, -titleWidth*0.5)];
        [_weiXinBtn setTitleEdgeInsets:UIEdgeInsetsMake(titleHeight*0.5 + space*0.5, -imageWidth*0.5, -(titleHeight*0.5 + space*1.3), imageWidth*0.5)];
        
    }
    return _weiXinBtn;
}
-(UIButton *)pengYouQuanBtn{
    if (!_pengYouQuanBtn) {
        _pengYouQuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
        /* 获取按钮文字的宽度 获取按钮图片和文字的间距 获取图片宽度 */
        CGFloat    space = 5;// 图片和文字的间距
        NSString    * titleString = [NSString stringWithFormat:@"朋友圈"];
        CGFloat    titleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
        
        UIImage    *btnImage = [UIImage imageNamed:@"pengyouquan_share_icon"];
        CGFloat    imageWidth = btnImage.size.width;
        [_pengYouQuanBtn setImage:btnImage forState:UIControlStateNormal];
        [_pengYouQuanBtn setTitle:titleString forState:UIControlStateNormal];
        [_pengYouQuanBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        _pengYouQuanBtn.titleLabel.font = BQFONT(12);
        _pengYouQuanBtn.titleLabel.frame = CGRectMake(0, 0, SCREEN_W/4, 72);
        
        /**需要先获取图片和文字的高度**/
        CGFloat    imageHeight = btnImage.size.height;
        CGFloat    titleHeight = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].height;
        
        [_pengYouQuanBtn setImageEdgeInsets:UIEdgeInsetsMake(-(imageHeight*0.5 + space*0.5), titleWidth*0.5, imageHeight*0.5 + space*0.5, -titleWidth*0.5)];
        [_pengYouQuanBtn setTitleEdgeInsets:UIEdgeInsetsMake(titleHeight*0.5 + space*0.5, -imageWidth*0.5, -(titleHeight*0.5 + space*1.3), imageWidth*0.5)];
    }
    return _pengYouQuanBtn;
}
-(UIButton *)weiBoBtn{
    if (!_weiBoBtn) {
        _weiBoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        /* 获取按钮文字的宽度 获取按钮图片和文字的间距 获取图片宽度 */
        CGFloat    space = 5;// 图片和文字的间距
        NSString    * titleString = [NSString stringWithFormat:@"微博"];
        CGFloat    titleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
        
        UIImage    *btnImage = [UIImage imageNamed:@"weibo_share_icon"];
        CGFloat    imageWidth = btnImage.size.width;
        [_weiBoBtn setImage:btnImage forState:UIControlStateNormal];
        [_weiBoBtn setTitle:titleString forState:UIControlStateNormal];
        [_weiBoBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        _weiBoBtn.titleLabel.font = BQFONT(12);
        _weiBoBtn.titleLabel.frame = CGRectMake(0, 0, SCREEN_W/4, 72);
        
        /**需要先获取图片和文字的高度**/
        CGFloat    imageHeight = btnImage.size.height;
        CGFloat    titleHeight = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].height;
        
        [_weiBoBtn setImageEdgeInsets:UIEdgeInsetsMake(-(imageHeight*0.5 + space*0.5), titleWidth*0.5, imageHeight*0.5 + space*0.5, -titleWidth*0.5)];
        [_weiBoBtn setTitleEdgeInsets:UIEdgeInsetsMake(titleHeight*0.5 + space*0.5, -imageWidth*0.5, -(titleHeight*0.5 + space*1.3), imageWidth*0.5)];
    }
    return _weiBoBtn;
}
-(UIButton *)QQkongJianBtn{
    if (!_QQkongJianBtn) {
        _QQkongJianBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        /* 获取按钮文字的宽度 获取按钮图片和文字的间距 获取图片宽度 */
        CGFloat    space = 5;// 图片和文字的间距
        NSString    * titleString = [NSString stringWithFormat:@"QQ空间"];
        CGFloat    titleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
        
        UIImage    *btnImage = [UIImage imageNamed:@"qq_share_icon"];
        CGFloat    imageWidth = btnImage.size.width;
        [_QQkongJianBtn setImage:btnImage forState:UIControlStateNormal];
        [_QQkongJianBtn setTitle:titleString forState:UIControlStateNormal];
        [_QQkongJianBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        _QQkongJianBtn.titleLabel.font = BQFONT(12);
        _QQkongJianBtn.titleLabel.frame = CGRectMake(0, 0, SCREEN_W/4, 72);
        
        /**需要先获取图片和文字的高度**/
        CGFloat    imageHeight = btnImage.size.height;
        CGFloat    titleHeight = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].height;
        
        [_QQkongJianBtn setImageEdgeInsets:UIEdgeInsetsMake(-(imageHeight*0.5 + space*0.5), titleWidth*0.5, imageHeight*0.5 + space*0.5, -titleWidth*0.5)];
        [_QQkongJianBtn setTitleEdgeInsets:UIEdgeInsetsMake(titleHeight*0.5 + space*0.5, -imageWidth*0.5, -(titleHeight*0.5 + space*1.3), imageWidth*0.5)];
    }
    return _QQkongJianBtn;
}

-(void)showShareAlertViewOnView:(UIView *)view{
    if (!view) {
        return;
    }
    [view addSubview:self];
    [view addSubview:self.bgView];
}
-(void)dissmissCustomAlertView{
    [self removeFromSuperview];
    [self.bgView removeFromSuperview];
}
@end
