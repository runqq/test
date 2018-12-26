//
//  ClassRecord.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ClassRecord.h"
#import "ScreenView.h"
#import "ShangKeTableViewCell.h"
#import "CourseDetailsViewController.h"
#import "LoginViewController.h"

#import "ShangKeJiLuDetailModel.h"
#import "ShangKeJiLuViewModel.h"
#import "FanKuiYuJianYi.h"
#import "ScreenTableViewCell.h"
#import "JiLuKongJieMianView.h"

@interface ClassRecord ()<UITableViewDelegate,UITableViewDataSource>
{
    int size;
    int page;
    NSNumber *sizeNum;
    NSNumber *pageNum;
    
    NSString  *yearss;
    NSString  *monthss;
}

@property(nonatomic,strong)ScreenView *screenV;
@property(nonatomic,strong)JiLuKongJieMianView *kongJieMian;

@property(nonatomic,strong)UILabel *navTitleLab;
@property(nonatomic,strong)UIButton *rightBut;
@property(nonatomic,strong)UITableView *tbv;

@property(nonatomic,strong)ShangKeJiLuDetailModel *skjlDetailModel;
@property(nonatomic,strong)ShangKeJiLuViewModel *skjlViewModel;
@property(nonatomic,strong)NSMutableArray <ShangKeJiLuDetailModel *>*skjlData;


@end

@implementation ClassRecord

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
//-(void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    NSIndexPath * indexrow = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.screenV.leftTable selectRowAtIndexPath:indexrow animated:YES scrollPosition:1];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.titleView = self.navTitleLab;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 导航右侧筛选按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.rightBut];
    // 背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
    
    // 网络解析
    [self netWorkRequest];
    
}

-(void)netWorkRequest{
    
    page = 1;
    size = 10;
    pageNum = @(page);
    sizeNum = @(size);
    
    yearss = @"";
    monthss = @"";
    
    [self getData];
}
-(void)getData{
    
    self.skjlData = [NSMutableArray array];
    
    [self.skjlViewModel getShangKeJiLuWithPageNo:pageNum PageSize:sizeNum yearStr:yearss MonthStr:monthss Success:^(ShangKeJiLuModel *  skjlModel) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
        if (skjlModel.success) {
            for (ShangKeJiLuDetailModel *detailModel in skjlModel.data) {
                [self.skjlData addObject:detailModel];
            }
            if (self.skjlData.count == 0) {
                [self.view addSubview:self.kongJieMian];
            }else{
                [self->_kongJieMian removeFromSuperview];
            }
            [self.tbv reloadData];
            
        }
        
    } Failture:^(ShangKeJiLuModel *  skjlError) {
        if ([[skjlError.message substringToIndex:5] isEqualToString:@"未登陆错误"]) {
            
            if ([User_Default objectForKey:@"myjsession"]) {
                [LoginOut OutSuccess:^(TuiChuLoginModel * tuichumm) {
                    //登录
                    LoginViewController *loginVC = [[LoginViewController alloc]initWithLoginSuccessBlock:^{
                        [self netWorkRequest];
                    }];
                    [self presentViewController:loginVC animated:YES completion:nil];
                    
                } Failture:^(TuiChuLoginModel * err_tuichumm) {
                    
                }];
                
            }else{
                
                //登录
                LoginViewController *loginVC = [[LoginViewController alloc]initWithLoginSuccessBlock:^{
                    [self netWorkRequest];
                }];
                [self presentViewController:loginVC animated:YES completion:nil];
            }
        }
    }];
}
#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 筛选按钮
-(void)rightBtn:(UIButton *)rightBtn{
    
    NSIndexPath * indexrow = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.screenV.leftTable selectRowAtIndexPath:indexrow animated:YES scrollPosition:1];
    
    [self.screenV showCustomScreenView:self.view];
}

#pragma mark --> 懒加载
-(JiLuKongJieMianView *)kongJieMian{
    if (!_kongJieMian) {
        _kongJieMian = [[JiLuKongJieMianView alloc]init];
    }
    return _kongJieMian;
}

-(UILabel *)navTitleLab{
    if (!_navTitleLab) {
        // 导航标题
        _navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _navTitleLab.text = @"上课记录";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}
-(UIButton *)rightBut{
    if (!_rightBut) {
        // 导航右侧按钮
        _rightBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBut setTitle:@"筛选" forState:UIControlStateNormal];
        [_rightBut setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
        _rightBut.titleLabel.font = BQFONT(16);
        [_rightBut addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBut;
}

-(UITableView *)tbv{
    if (!_tbv) {
        
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT) style:UITableViewStylePlain];
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        // 分割线样式
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
        
        // 下拉刷新
        _tbv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self netWorkRequest];
        }];
        
        
    }
    return _tbv;
}

#pragma mark --> 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.skjlData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShangKeTableViewCell *skCell = [ShangKeTableViewCell cellWithTableView:tableView];
    
    skCell.titlLab.text = self.skjlData[indexPath.row].courseName;
    skCell.detailLab.text = self.skjlData[indexPath.row].iceStadiumTitle;
    skCell.rightLab.text = self.skjlData[indexPath.row].consumption;
    skCell.rightDetailLab.text = self.skjlData[indexPath.row].startTime;
    
    return skCell;
    
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

// 设置表格的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CourseDetailsViewController *courseDetailsVC = [[CourseDetailsViewController alloc]init];
    UINavigationController *courseDetailsNav = [[UINavigationController alloc]initWithRootViewController:courseDetailsVC];
    courseDetailsVC.kcId = self.skjlData[indexPath.row].courseId;
    courseDetailsVC.moneyStr = self.skjlData[indexPath.row].consumption;
    [self presentViewController:courseDetailsNav animated:YES completion:nil];
    
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
    
    yearss = self.screenV.yearStr;
    monthss = self.screenV.monthStr;
    
    [self getData];
    
    [self.screenV dissmissCustomScreenView];
}
-(void)quXiaoBntnClick:(UIButton *)quXiaoBtn{
    
    [self.screenV dissmissCustomScreenView];
}

-(ShangKeJiLuDetailModel *)skjlDetailModel{
    if (!_skjlDetailModel) {
        _skjlDetailModel = [[ShangKeJiLuDetailModel alloc]init];
    }
    return _skjlDetailModel;
}
-(ShangKeJiLuViewModel *)skjlViewModel{
    if (!_skjlViewModel) {
        _skjlViewModel = [[ShangKeJiLuViewModel alloc]init];
    }
    return _skjlViewModel;
}
-(NSMutableArray<ShangKeJiLuDetailModel *> *)skjlData{
    if (!_skjlData) {
        _skjlData = [NSMutableArray array];
    }
    return _skjlData;
}



@end
