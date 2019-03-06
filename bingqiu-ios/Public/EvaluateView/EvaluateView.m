//
//  EvaluateView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "EvaluateView.h"

#import "RatingBar.h"
@implementation EvaluateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
        self.backgroundColor = [UIColor colorWithRed:0. green:0. blue:0. alpha:0.5];
        self.bgTextV.center = self.center;
        
        [self addSubview:self.bgTextV];
        
        [self.bgTextV addSubview:self.titLab];
        [self.bgTextV addSubview:self.cancelBtn];
        // 添加星星的view
        [self.bgTextV addSubview:self.showStar];
        
        [self.bgTextV addSubview:self.smallTextV];
        [self.bgTextV addSubview:self.submitBtn];
        
        [self addLayOut];
    }
    return self;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgTextV.mas_top).with.offset(15);
        make.left.equalTo(weakself.bgTextV.mas_left).with.offset(15);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgTextV.mas_top).with.offset(15);
        make.right.equalTo(weakself.bgTextV.mas_right).with.offset(-15);
    }];
    [self.showStar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titLab.mas_bottom).with.offset(15);
        make.left.equalTo(weakself.bgTextV.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 41));
    }];
    [self.smallTextV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.showStar.mas_bottom).with.offset(18);
        make.centerX.equalTo(weakself.bgTextV.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(self->_bgTextV.frame.size.width-30, 119));
        
    }];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.smallTextV.mas_bottom).with.offset(30);
        make.centerX.mas_equalTo(weakself.bgTextV.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(140, 40));
    }];
    
}
-(UIView *)showStar{
    if (!_showStar) {
        _showStar = [[UIView alloc] init];
        
        self.myImageArray = [[NSMutableArray alloc] init];
        UIImageView *imageView;
        for (int i = 0; i < 5; i++) {
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_evaluatewindow_nor"]];
            //        imageView.backgroundColor = [UIColor redColor];
            imageView.frame = CGRectMake(_showStar.bounds.origin.x+((i+0.6)*35), _showStar.bounds.origin.y, 35, 35);
            [_showStar addSubview:imageView];
            [_myImageArray addObject:imageView];
        }
    }
    return _showStar;
}
#pragma mark -- 点击的坐标
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:_showStar];
    UIImageView *im;
    
    for(int i = 0; i < 5 ; i++){
        im = _myImageArray[i];
//        NSLog(@"_myImageArray[%i] = (%f,%f)",i,im.frame.origin.x,im.frame.origin.y);
        if ((touchPoint.x > 0)&&(touchPoint.x < 200)&&(touchPoint.y > 0)&&(touchPoint.y < 35)) {

            if (im.frame.origin.x > touchPoint.x) {
                im.image =[UIImage imageNamed:@"icon_evaluatewindow_nor"];
            }else{
                im.image =[UIImage imageNamed:@"icon_evaluatewindow_sel"];
            }
        }
        
    }
}
//#pragma mark - 滑动的坐标
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:_showStar];
    UIImageView *im ;
    for(int i = 0;i < 5 ; i++){
        im = _myImageArray[i];
//        NSLog(@"_myImageArray[%i] = (%f,%f)",i,im.frame.origin.x,im.frame.origin.y);
        if ((touchPoint.x > 0)&&(touchPoint.x < 210)&&(touchPoint.y > 0)&&(touchPoint.y < 35)) {
            if (im.frame.origin.x > touchPoint.x) {
                im.image =[UIImage imageNamed:@"icon_evaluatewindow_nor"];
            }else{
                im.image =[UIImage imageNamed:@"icon_evaluatewindow_sel"];
            }
        }
    }
}
-(UIView *)bgTextV{
    if (!_bgTextV) {
        _bgTextV = [[UIView alloc] initWithFrame:CGRectMake(15, 0, SCREEN_W - 30, 303)];
        _bgTextV.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        _bgTextV.layer.masksToBounds = YES;
        _bgTextV.layer.cornerRadius = 15;
    }
    return _bgTextV;
}

-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [UILabel new];
        _titLab.text = @"如何评价本次课程";
        _titLab.font = BQFONT(16);
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _titLab;
}
-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setImage:[UIImage imageNamed:@"close_black_window"] forState:UIControlStateNormal];
    }
    return _cancelBtn;
}
-(HMTextView *)smallTextV{
    if (!_smallTextV) {
        _smallTextV = [[HMTextView alloc]init];
        _smallTextV.backgroundColor = [UIColor redColor];
        _smallTextV.placeholder = @"可以再这里表达你对教练的喜爱哟!";
        _smallTextV.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        _smallTextV.layer.masksToBounds = YES;
        _smallTextV.layer.cornerRadius = 5;
        _smallTextV.font = BQFONT(15);
        _smallTextV.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _smallTextV;
}
-(UILabel *)placeholderLab{
    if (!_placeholderLab) {
        _placeholderLab = [UILabel new];
        _placeholderLab.text = @"可以再这里表达你对教练的喜爱哟!";
        _placeholderLab.font = BQFONT(15);
        _placeholderLab.textColor = [UIColor colorWithHexString:@"#999999"];
        [_placeholderLab sizeToFit];
    }
    return _placeholderLab;
}
-(UIButton *)submitBtn{
    if (!_submitBtn) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _submitBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        [_submitBtn setTitle:@"提交" forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = BQFONT(16);
        _submitBtn.layer.masksToBounds = YES;
        _submitBtn.layer.cornerRadius = 20;
        
    }
    return _submitBtn;
}
-(void)showCustomAlertViewOnView:(UIView *)view{
    if (!view) {
        return;
    }
    [view addSubview:self];
}
-(void)dissmissCustomAlertView{
    [self removeFromSuperview];
}


@end
