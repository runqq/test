//
//  PaySuccessViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "PaySuccessViewController.h"
#import "PaySuccessView.h"
#import "XingQiuViewController.h"

@interface PaySuccessViewController ()
@property(nonatomic,strong)UILabel *navTitleLab;
@property(nonatomic,strong)PaySuccessView *paySuccessV;
@property(nonatomic,strong)UIButton *confirmBtn;

@end

@implementation PaySuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航标题
    self.navigationItem.titleView = self.navTitleLab;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    
    [self.view addSubview:self.paySuccessV];
    [self.view addSubview:self.confirmBtn];
    
}
#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --> 懒加载
-(UILabel *)navTitleLab{
    if (!_navTitleLab) {
        // 导航标题
        _navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _navTitleLab.text = @"星球VIP";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}
-(PaySuccessView *)paySuccessV{
    if (!_paySuccessV) {
        _paySuccessV = [[PaySuccessView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, 206)];
        _paySuccessV.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    }
    return _paySuccessV;
}
-(UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, self.paySuccessV.frame.size.height+80, 345, 48)];
        _confirmBtn.layer.masksToBounds = YES;
        _confirmBtn.layer.cornerRadius = 5;
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = BQFONT(18);
        _confirmBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        // 确定按钮的点击事件
        [_confirmBtn addTarget:self action:@selector(queDingBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _confirmBtn;
}
-(void)queDingBtn:(UIButton *)send{
    XingQiuViewController *xqVC = [[XingQiuViewController alloc]init];
    [self.navigationController pushViewController:xqVC animated:YES];
//    UINavigationController *xqNav = [[UINavigationController alloc]initWithRootViewController:xqVC];
//    [self presentViewController:xqNav animated:NO completion:nil];
}
@end
