//
//  ReportHeadView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReportHeadView.h"

@implementation ReportHeadView


#define Start_X 0.0f               // 距离X轴的距离
#define Start_Y 118.0f             // 距离Y轴的距离
#define Width_Space 0.0f           // 横间距
#define Height_Space     20.0f     // 竖间距
#define View_Height   80.0f        // 控件的高
#define View_Width    125.0f       // 控件的宽


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.bgImg];
        
        
        NSArray  *imgArr = @[@"height_home",@"weight_home",@"bodymass_home",@"age_home",@"rate_home",@"rate_home_max"];
        self.numArr = [NSMutableArray arrayWithObjects:@"156",@"34",@"23",@"10",@"89",@"90", nil];
        NSArray  *labArr = @[@"身高(cm)",@"体重(kg)",@"身体质量指数",@"年龄",@"基础心率(bpm)",@"最高心率(bpm)"];
        
        UIView *myView;
        
        for (int i=0; i<6; i++) {
            
            NSInteger index = i % 3;
            NSInteger page = i / 3;
            myView = [[UIView alloc]init];
            // 随机色
//            UIColor * randomColor= [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
            myView.tag = i;
            myView.frame = CGRectMake(index * (SCREEN_W/3 + Width_Space) + Start_X, page * (View_Height + Height_Space)+Start_Y, SCREEN_W/3, View_Height);
            
            [self.bgImg addSubview:myView];
            
            UIImageView  *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgArr[i]] highlightedImage:[UIImage imageNamed:imgArr[i]]];
            
            [myView addSubview:img];
            
            [img mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(myView.mas_top).with.offset(0);
                make.centerX.mas_equalTo(myView.mas_centerX);
            }];
            
            UILabel  *numLab = [[UILabel alloc] init];
            // 将数据展示上去
            numLab.text = [NSString stringWithFormat:@"%@",self.numArr[i]];
            BQLog(@"展示的数据有%@",numLab.text);
            
            numLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
            numLab.font = BQBOLDFONT(22);
            [myView addSubview:numLab];
            
            [numLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(myView.mas_top).with.offset(35);
                make.centerX.mas_equalTo(myView.mas_centerX);
            }];
            
            UILabel  *wenziLab = [[UILabel alloc] init];
            wenziLab.text = [NSString stringWithFormat:@"%@",labArr[i]];
            wenziLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
            wenziLab.font = BQFONT(12);
            [myView addSubview:wenziLab];
            
            [wenziLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(myView.mas_bottom).with.offset(0);
                make.centerX.mas_equalTo(myView.mas_centerX);
            }];
            
        }
        
        [self.bgImg addSubview:self.leftBtn];
        [self.bgImg addSubview:self.titlLab];
        [self.bgImg addSubview:self.rightBtn];
        
        [self.bgImg addSubview:self.bg_medal_Btn];
        [self.bg_medal_Btn addSubview:self.medal_distance_1_Img];
        [self.bg_medal_Btn addSubview:self.medal_distance_2_Img];
        [self.bg_medal_Btn addSubview:self.myMedalLab];
        
        [self addLayOut];
        
    }
    return self;
}
-(void)addLayOut{
    
    __weak typeof(self) weakself = self;
    [self.bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(0);
        make.left.equalTo(weakself.mas_left).with.offset(0);
        make.right.equalTo(weakself.mas_right).with.offset(0);
    }];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgImg.mas_top).with.offset(STATUS_BAR_HEIGHT + 10);
        make.left.equalTo(weakself.bgImg.mas_left).with.offset(15);
    }];
    [self.titlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgImg.mas_top).with.offset(STATUS_BAR_HEIGHT + 10);
        make.centerX.mas_equalTo(weakself.bgImg.mas_centerX);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgImg.mas_top).with.offset(STATUS_BAR_HEIGHT + 10);
        make.right.equalTo(weakself.bgImg.mas_right).with.offset(-15);
    }];
    
    [self.bg_medal_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        // 判断是否是iPhoneX
        if (kDevice_Is_iPhoneX) {
            make.top.equalTo(weakself.bgImg.mas_top).with.offset(84);
            make.right.equalTo(weakself.bgImg.mas_right).with.offset(0);
            make.size.mas_equalTo(CGSizeMake(119, 32));
        }else{
            make.top.equalTo(weakself.bgImg.mas_top).with.offset(70);
            make.right.equalTo(weakself.bgImg.mas_right).with.offset(0);
            make.size.mas_equalTo(CGSizeMake(119, 32));
        }
    }];
    
    [self.medal_distance_1_Img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_medal_Btn.mas_top).with.offset(7);
        make.left.equalTo(weakself.bg_medal_Btn.mas_left).with.offset(7);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.medal_distance_2_Img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_medal_Btn.mas_top).with.offset(7);
        make.left.equalTo(weakself.medal_distance_1_Img.mas_right).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.myMedalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_medal_Btn.mas_top).with.offset(7);
        make.left.equalTo(weakself.medal_distance_2_Img.mas_right).with.offset(5);
    }];
}

-(UIImageView *)bgImg{
    if (!_bgImg) {
        _bgImg = [[UIImageView alloc]init];
        _bgImg.image = [UIImage imageNamed:@"bg_home_top"];
        _bgImg.frame = CGRectMake(0,  STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT, SCREEN_W, 320);
        // 设置用户交互
        _bgImg.userInteractionEnabled = YES;
    }
    return _bgImg;
}
-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setImage:[UIImage imageNamed:@"nav_service"] forState:UIControlStateNormal];
    }
    return _leftBtn;
}
-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [UILabel new];
        _titlLab.text = @"报告";
        _titlLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _titlLab.font = BQBOLDFONT(18);
        [_titlLab sizeToFit];
        
    }
    return _titlLab;
}
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setImage:[UIImage imageNamed:@"nav_inf_new"] forState:UIControlStateNormal];
    }
    return _rightBtn;
}

-(UIButton *)bg_medal_Btn{
    if (!_bg_medal_Btn) {
        _bg_medal_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bg_medal_Btn setImage:[UIImage imageNamed:@"bg_medal_home"] forState:UIControlStateNormal];
    }
    return _bg_medal_Btn;
}
-(UIImageView *)medal_distance_1_Img{
    if (!_medal_distance_1_Img) {
        _medal_distance_1_Img = [UIImageView new];
        _medal_distance_1_Img.image = [UIImage imageNamed:@"medal_time_1_home"];
    }
    return _medal_distance_1_Img;
}
-(UIImageView *)medal_distance_2_Img{
    if (!_medal_distance_2_Img) {
        _medal_distance_2_Img = [UIImageView new];
        _medal_distance_2_Img.image = [UIImage imageNamed:@"medal_distance_2_home"];
    }
    return _medal_distance_2_Img;
}
-(UILabel *)myMedalLab{
    if (!_myMedalLab) {
        _myMedalLab = [UILabel new];
        _myMedalLab.text = @"我的勋章";
        _myMedalLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _myMedalLab.font = BQFONT(12);
    }
    return _myMedalLab;
}

@end
