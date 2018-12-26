//
//  ChaKanDetailsController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/31.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChaKanDetailsController.h"
#import "LLSegmentBarVC.h"
#import "ScreenView.h"
#import "EverydayData.h"
#import "TestData.h"

@interface ChaKanDetailsController ()

@property(nonatomic,strong)LLSegmentBarVC *segmentVC;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)ScreenView *screenV;

@end

@implementation ChaKanDetailsController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
//-(void)viewDidDisappear:(BOOL)animated{
//    [super viewDidDisappear :animated];
//    self.tabBarController.tabBar.hidden = NO;
//}

- (LLSegmentBarVC *)segmentVC{
    if (!_segmentVC) {
        LLSegmentBarVC *vc = [[LLSegmentBarVC alloc]init];
        // 添加到到控制器
        [self addChildViewController:vc];
        _segmentVC = vc;
    }
    return _segmentVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 试图背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 导航右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    
    // 1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(0, 83, SCREEN_W, 35);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
    // 2 添加控制器的View
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"日常数据", @"测试数据"];
    EverydayData *everydayVC = [[EverydayData alloc]init];
    TestData *testVC = [[TestData alloc]init];
    // 3 添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[everydayVC,testVC]];
    // 4  配置基本设置  可采用链式编程模式进行设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor colorWithHexString:@"#666666"]).itemSelectColor([UIColor colorWithHexString:@"#188bf0"]).indicatorColor([UIColor colorWithHexString:@"#188bf0"]);
        // 设置字体大小
        config.itemF = BQBOLDFONT(18);
    }];
    
}
#pragma mark --> 懒加载
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setTitle:@"筛选" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
        _rightBtn.titleLabel.font = BQFONT(16);
        [_rightBtn addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
#pragma mark --> 初始化筛选试图
-(ScreenView *)screenV{
    if (!_screenV) {
        _screenV = [[ScreenView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H)];
        // 确定按钮
        [_screenV.sureBtn addTarget:self action:@selector(queDingBntnClick:) forControlEvents:UIControlEventTouchUpInside];
        // 取消按钮
        [_screenV.cancelBtn addTarget:self action:@selector(quXiaoBntnClick:) forControlEvents:UIControlEventTouchUpInside];
        _screenV.backgroundColor = [UIColor grayColor];
    }
    return _screenV;
}
#pragma mark --> 确定按钮和取消按钮点击事件
-(void)queDingBntnClick:(UIButton *)queDingBtn{
    
    self.yearss = self.screenV.yearStr;
    self.monthss = self.screenV.monthStr;
    
    
    [self.screenV dissmissCustomScreenView];
}
-(void)quXiaoBntnClick:(UIButton *)quXiaoBtn{
    [self.screenV dissmissCustomScreenView];
}

#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBtn:(UIButton *)screenBtn{
    [self.screenV showCustomScreenView:self.view];
}

@end
