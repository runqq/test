//
//  ClassInfoDetailViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ClassInfoDetailViewController.h"

@interface ClassInfoDetailViewController ()

@property(nonatomic , strong)UIView       *bgView;
@property(nonatomic , strong)UILabel      *titLab;
@property(nonatomic , strong)UIButton     *cancelBtn;
@property(nonatomic , strong)UITextView   *detailTV;

@end

@implementation ClassInfoDetailViewController
// 即将展示
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addUI];
    [self addAction];
}

-(void)addUI{
    
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.titLab];
    [self.bgView addSubview:self.detailTV];
    [self.bgView addSubview:self.cancelBtn];
}
-(void)addAction{
    
    [self.cancelBtn addTarget:self action:@selector(dissMissCurrentVC) forControlEvents:UIControlEventTouchUpInside
     ];
    
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 63, SCREEN_W - 30, 18)];
        _titLab.text = @"课程介绍";
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQFONT(18);
    }
    return _titLab;
}
-(UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(SCREEN_W - 34, 42, 19, 19);
        [_cancelBtn setImage:[UIImage imageNamed:@"close_black_window"] forState:UIControlStateNormal];
        
    }
    return _cancelBtn;
}
-(UITextView *)detailTV{
    if (!_detailTV) {
        
        _detailTV = [[UITextView alloc] initWithFrame:CGRectMake(15, self.titLab.frame.origin.y + self.titLab.frame.size.height + 20 , SCREEN_W - 30, SCREEN_H - (self.titLab.frame.origin.y + self.titLab.frame.size.height + 40))];
        _detailTV.textColor = [UIColor colorWithHexString:@"#666666"];
        _detailTV.userInteractionEnabled = NO;
        
        _detailTV.text = @"1.连续五天的集结训练;\n2.现任匹兹堡企鹅队教练执教;\n3.形式新颖的课程,给每位学员都能带来有针对性的指导.\n4.入营学员都将得到一件本次训练营纪念营服,以及入\n营礼包.说不定还能得到来自匹兹堡企鹅队教练惊喜\n礼物.\n5.完成营期所有内容学习,颁发结营证书.";
//        _detailTV.text = self.classInfoStr;
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 18;// 字体的行间距
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:13],
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        _detailTV.attributedText = [[NSAttributedString alloc] initWithString:_detailTV.text attributes:attributes];

        
    }
    return _detailTV;
}

-(void)dissMissCurrentVC{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
