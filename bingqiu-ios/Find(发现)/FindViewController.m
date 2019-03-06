//
//  FindViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "FindViewController.h"

#import "LLSegmentBarVC.h"
#import "Consult(资讯)/Controller/InformationViewController.h"
#import "Camp(训练营)/Controller/CampViewController.h"
#import "Strategy(攻略)/Controller/StrategyViewController.h"

@interface FindViewController ()
@property (nonatomic,weak) LLSegmentBarVC * segmentVC;
@end

@implementation FindViewController
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
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:YES];
    
    // 1 设置segmentBar的frame
    self.segmentVC.segmentBar.frame = CGRectMake(0, 0, SCREEN_W, 42);
    self.navigationItem.titleView = self.segmentVC.segmentBar;
    // 2 添加控制器的View
    self.segmentVC.view.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H);
    [self.view addSubview:self.segmentVC.view];
    NSArray *items = @[@"攻略", @"训练营", @"资讯"];
    StrategyViewController *strategy = [[StrategyViewController alloc] init];
    CampViewController *camp = [[CampViewController alloc] init];
    InformationViewController *consult = [[InformationViewController alloc] init];
    // 3 添加标题数组和控住器数组
    [self.segmentVC setUpWithItems:items childVCs:@[strategy,camp,consult]];
    // 4  配置基本设置  可采用链式编程模式进行设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor colorWithHexString:@"#666666"]).itemSelectColor([UIColor colorWithHexString:@"#188bf0"]).indicatorColor([UIColor colorWithHexString:@"#188bf0"]);
        // 设置字体大小
        config.itemF = BQBOLDFONT(18);
    }];
}

@end
