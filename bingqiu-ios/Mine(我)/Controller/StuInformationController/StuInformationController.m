//
//  StuInformationViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "StuInforController.h"
#import "ChangeStuViewController.h"

@interface StuInforController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tbv;

@end

@implementation StuInforController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 导航右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"切换学员" style:UIBarButtonItemStyleDone target:self action:@selector(rightBtn:)];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航标题
    self.navigationItem.title = @"学员资料";
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBtn:(UIButton *)lrightBtn{
    ChangeStuViewController *changeStuVC = [[ChangeStuViewController alloc]init];
    [self.navigationController pushViewController:changeStuVC animated:YES];
    
}

#pragma mark --> 懒加载
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - NAVIGATION_BAR_HEIGHT) style:UITableViewStylePlain];
        
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
        
    }
    return _tbv;
}

#pragma mark --> UITanleViewDelegate ------UItableViewDataSource
//几组
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 4;
//}
// 几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
// 设置cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 7 || section == 8) {
        return 20;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

@end
