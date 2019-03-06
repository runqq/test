//
//  TopTableViewCell.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/14.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TopTableViewCell.h"
#import "ConsultDetailModel.h"

#define Button_Width   65.0f
#define Button_Height  30.0f

@implementation TopTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.bgView];
        [self addLayOUt];
        
        float Start_X  = 0.0f;
        float Start_Y  = 0.0f;
        float Width_Space = 28.0f;
        
        NSString *title;
        for (int i=0; i<self.btnArr.count; i++) {
            
            id btnValue = self.btnArr[i];
            if ([btnValue isKindOfClass:[NSString class]]) {
                title = btnValue;
            } else {
                ConsultDetailModel *model = btnValue;
                title = model.text;
            }
            NSInteger  index = i % self.btnArr.count;
            UIButton *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
            myButton.tag = i;
            
            if (IS_IPHONE_X) {
                myButton.frame = CGRectMake(index *(Button_Width + Width_Space) + Start_X, Start_Y, Button_Width, Button_Height);
            }else if (IS_IPHONE_6s){
                myButton.frame = CGRectMake(index *(Button_Width + Width_Space - 1) + Start_X, Start_Y, Button_Width, Button_Height);
                
            }else{
                myButton.frame = CGRectMake(index *(Button_Width + Width_Space+10) + Start_X, Start_Y, Button_Width+5, Button_Height);
            }
            // 赋值文字
            [myButton setTitle:title forState:UIControlStateNormal];
            [myButton setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
            myButton.backgroundColor = [UIColor redColor];
            myButton.layer.masksToBounds = YES;
            myButton.layer.cornerRadius = 3;
            myButton.titleLabel.font = BQBOLDFONT(15);
            
            if (myButton.tag == 0) {
                myButton.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
                [myButton setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
                self.firstBtn = myButton;
                
            }else{
                myButton.backgroundColor = [UIColor clearColor];
            }
            
            [self.bgView addSubview:myButton];
            
            [myButton addTarget:self action:@selector(ClickedBut:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

+(instancetype)cellWithTableVIew:(UITableView *)tableView{
    
    TopTableViewCell *topCell = [tableView dequeueReusableCellWithIdentifier:@"topCell"];
    if (!topCell) {
        topCell = [[TopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topCell"];
    }
    topCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return topCell;
}

-(void)addLayOUt{
    __weak typeof(self) weakself = self;
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mas_left).with.offset(15);
        make.centerY.equalTo(weakself.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W-30, 30));
    }];
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}

-(NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray arrayWithObjects:@"国内",@"NHL",@"NHL",@"CCHL", nil];
//                _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}

-(void)ClickedBut:(UIButton *)sender{
    //    BQLog(@"当前点击的按钮是%@",sender.titleLabel.text);
    if (self.firstBtn) {
        self.firstBtn.backgroundColor = [UIColor clearColor];
        [self.firstBtn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    }
    self.firstBtn = sender;
    self.firstBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
    [self.firstBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    
    //通过block把点击的按钮索引传递回去
    self.btnClickBlock(self.firstBtn.tag);
    
}

@end
