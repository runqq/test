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
{
    EverydayData *everydayVC;
    TestData *testVC;
}

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
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightBtn setTitle:@"筛选" forState:UIControlStateNormal];
    [_rightBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = BQFONT(16);
    [_rightBtn addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _screenV = [[ScreenView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H)];
    // 确定按钮
    [_screenV.sureBtn addTarget:self action:@selector(queDingBntnClick:) forControlEvents:UIControlEventTouchUpInside];
    // 取消按钮
    [_screenV.cancelBtn addTarget:self action:@selector(quXiaoBntnClick:) forControlEvents:UIControlEventTouchUpInside];
    _screenV.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:self.screenV];
    
    
    // 试图背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 导航右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];
    
    everydayVC = [[EverydayData alloc]init];
    testVC = [[TestData alloc]init];
    
    everydayVC.monthss = @"";
    everydayVC.yearss = @"";
    testVC.monthss = @"";
    testVC.yearss = @"";

    // 1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(0, 83, SCREEN_W, 35);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
    // 2 添加控制器的View
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"日常数据", @"测试数据"];
    // 3 添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[everydayVC,testVC]];
    // 4  配置基本设置  可采用链式编程模式进行设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor colorWithHexString:@"#666666"]).itemSelectColor([UIColor colorWithHexString:@"#188bf0"]).indicatorColor([UIColor colorWithHexString:@"#188bf0"]);
        // 设置字体大小
        config.itemF = BQBOLDFONT(18);
    }];
    
    
    
}

#pragma mark --> 确定按钮和取消按钮点击事件
-(void)queDingBntnClick:(UIButton *)queDingBtn{
    
    everydayVC = [[EverydayData alloc]init];
    testVC = [[TestData alloc]init];
    
    everydayVC.yearss = self.screenV.yearStr;
    everydayVC.monthss = self.screenV.monthStr;
    testVC.yearss = self.screenV.yearStr;
    testVC.monthss = self.screenV.monthStr;
    
    // 1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(0, 83, SCREEN_W, 35);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
    // 2 添加控制器的View
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"日常数据", @"测试数据"];
    // 3 添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[everydayVC,testVC]];
    // 4  配置基本设置  可采用链式编程模式进行设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor colorWithHexString:@"#666666"]).itemSelectColor([UIColor colorWithHexString:@"#188bf0"]).indicatorColor([UIColor colorWithHexString:@"#188bf0"]);
        // 设置字体大小
        config.itemF = BQBOLDFONT(18);
    }];
    
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
    // 默认选中第一行
    NSIndexPath * indexrow = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.screenV.leftTable selectRowAtIndexPath:indexrow animated:YES scrollPosition:1];
    [self.screenV showCustomScreenView:self.view];
}

@end
