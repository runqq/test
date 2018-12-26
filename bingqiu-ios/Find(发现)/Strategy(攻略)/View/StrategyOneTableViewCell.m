//
//  StrategyOneTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "StrategyOneTableViewCell.h"
#import "AllStraDetailModel.h"

#define Button_Width   80.0f
#define Button_Height  28.0f

@implementation StrategyOneTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.bgView];
        
        [self addLayOUt];
        
        float Start_X  = 0.0f;
        float Start_Y  = 0.0f;
        float Width_Space = 10.0f;
        
        NSString *title;
        for (int i=0; i<self.btnMarr.count; i++) {
            
            id btnValue = self.btnMarr[i];
            if ([btnValue isKindOfClass:[NSString class]]) {
                title = btnValue;
            } else {
                AllStraDetailModel *model = btnValue;
                title = model.text;
            }
            
            NSInteger  index = i% self.btnMarr.count;
            UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
            myButton.tag = i;
            
            if (IS_IPHONE_X) {
                myButton.frame = CGRectMake(index *(Button_Width + Width_Space) + Start_X, Start_Y, Button_Width, Button_Height);
                
            }else if (IS_IPHONE_6s){
                myButton.frame = CGRectMake(index *(Button_Width + Width_Space - 1) + Start_X, Start_Y, Button_Width, Button_Height);
                
            }else{
                
                myButton.frame = CGRectMake(index *(Button_Width + Width_Space + 10) + Start_X, Start_Y, Button_Width+5, Button_Height);
            }
            
            [myButton setTitle:title forState:UIControlStateNormal];
            [myButton setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
            myButton.backgroundColor = [UIColor whiteColor];
            myButton.layer.masksToBounds = YES;
            myButton.layer.cornerRadius = 14;
            myButton.layer.borderWidth = 0.5;
            myButton.layer.borderColor = [[UIColor colorWithHexString:@"#999999"]CGColor];
            myButton.titleLabel.font = BQBOLDFONT(13);
        
            if (myButton.tag == 0) {
                myButton.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
                [myButton setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
                self.firstBtn = myButton;
                
            }else{
                myButton.backgroundColor = [UIColor whiteColor];
            }
            [self.bgView addSubview:myButton];
            
            [myButton addTarget:self action:@selector(ClickedBut:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    StrategyOneTableViewCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"oneCell"];
    if (!oneCell) {
        oneCell = [[StrategyOneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"oneCell"];
    }
    oneCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return oneCell;
}

- (void)addLayOUt{
    __weak typeof(self) weakself = self;
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top).with.offset(24);
        make.left.equalTo(weakself.mas_left).with.offset(15); 
    }];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakself.titleLab.mas_bottom).with.offset(25);
            make.left.equalTo(weakself.mas_left).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(SCREEN_W - 30 , 28));
    }];
    
}

- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"全部攻略";
        [_titleLab sizeToFit];
    }
    return _titleLab;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
    }
    return _bgView;
}
-(NSMutableArray *)btnMarr{
    if (!_btnMarr) {
        _btnMarr = [NSMutableArray arrayWithObjects:@"速度",@"力量",@"姿势",@"进球" ,nil];
    }
    return _btnMarr;
}
-(void)ClickedBut:(UIButton *)sender{
    
    if (self.firstBtn) {
        self.firstBtn.backgroundColor = [UIColor whiteColor];
         [self.firstBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    }
    self.firstBtn = sender;
    self.firstBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
    [self.firstBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    
    //通过block把点击的按钮索引传递回去
    self.btnClickedBlock(self.firstBtn.tag);
    
}
@end
