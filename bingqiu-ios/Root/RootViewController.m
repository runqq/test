//
//  RootViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "RootViewController.h"
#import "ReportViewController.h" // 报告
#import "FindViewController.h"   // 发现
#import "MineViewController.h"   // 我
#import "BaseViewController.h"
#import "LoginViewController.h"  // 登录界面

@interface RootViewController ()<UITabBarControllerDelegate>

@end

@implementation RootViewController
// 设备支持方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    //上下竖屏
    return UIInterfaceOrientationMaskPortrait;
}

// 根据不同的参数创建不同的导航控制器
-(UINavigationController *)createNavWithControllerName:(NSString *)cName title:(NSString *)title imgName:(NSString *)name selectImgName:(NSString *)selName{
    // 根据类的名称的字符串得到一个类的对象
    UIViewController *vc = [[NSClassFromString(cName) alloc]init];
    // 设置标题
//    vc.title = title;
    // 实例化一个导航条
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    // 设置导航的标签栏标签
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[UIImage imageNamed:name] selectedImage:[UIImage imageNamed:selName]];
    
    return nav;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.tag = 2000;
    
    UINavigationController *reportNav = [self createNavWithControllerName:@"ReportViewController" title:@"报告" imgName:@"tab_report_nor" selectImgName:@"tab_report_sel"];
    UINavigationController *findNav = [self createNavWithControllerName:@"FindViewController" title:@"发现" imgName:@"tab_search_nor" selectImgName:@"tab_search_sel"];
    UINavigationController *mineNav = [self createNavWithControllerName:@"MineViewController" title:@"我" imgName:@"tab_my_nor" selectImgName:@"tab_my_sel"];
    self.tab = [[UITabBarController alloc]init];
    self.tab.viewControllers = @[reportNav,findNav,mineNav];
    self.tab.selectedIndex = 1;
    self.tab.delegate = self;
    [self.view addSubview:self.tab.view];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // 禁用返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{

    //这里我判断的是当前点击的tabBarItem的标题
    if ([viewController.tabBarItem.title isEqualToString:@"报告"]){
        if ([User_Default objectForKey:@"myjsession"]) {
            return YES;
            
        }else{
            LoginViewController *loginVC = [[LoginViewController alloc]init];
//            loginVC.dismissBlock = ^{
//                [self.tab setSelectedIndex:1];
//            };
            [self presentViewController:loginVC animated:YES completion:nil];
            return NO;
        }
    }
    return YES;
}


@end
