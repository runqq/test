//
//  JiangXueJinController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiangXueJinController.h"
#import "JiangXueJinTableViewCell.h"
#import "JiangXueJinXiangQingController.h"
#import "LoginViewController.h"

#import "JiangXueJinDetailModel.h"
#import "JiangXueJinViewModel.h"

#import "JiLuKongJieMianView.h"

@interface JiangXueJinController ()<UITableViewDelegate,UITableViewDataSource>
{
    int page;
    int size;
    NSNumber *pageNum;
    NSNumber *sizeNum;
}

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)JiangXueJinDetailModel *jxjDetailModel;
@property(nonatomic,strong)JiangXueJinViewModel *jxjViewModel;
@property(nonatomic,strong)NSMutableArray <JiangXueJinDetailModel *>*jxjData;

@property(nonatomic,strong)JiLuKongJieMianView *kongJieMian;

@end

@implementation JiangXueJinController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    // 导航标题
    UILabel  *titLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
    titLab.text = @"奖学金账户";
    titLab.textAlignment = NSTextAlignmentCenter;
    titLab.textColor = [UIColor colorWithHexString:@"#333333"];
    titLab.font = BQBOLDFONT(18);
    
    self.navigationItem.titleView = titLab;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    
    // 检测网络
    [self ChickStatus];
    
    
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
}
-(void)ChickStatus{
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        if (status != RealStatusNotReachable) {
            // 网络请求
            [self netWorkRequest];
        }else{
            [self showErrorText:@"网络不给力"];
        }
    }];
}
-(void)netWorkRequest{
    
    page = 1;
    size = 10;
    pageNum = @(page);
    sizeNum = @(size);
    
        [self.jxjViewModel getJiangXueJinWithPageNo:pageNum PageSize:sizeNum Success:^(JiangXueJinModel * jxjModel) {
            
            self.jxjData = [NSMutableArray array];
            
            if (jxjModel.success) {
                // 停止刷新
                [self.tbv.mj_header endRefreshing];
                for (JiangXueJinDetailModel *detailModel in jxjModel.data) {
                    [self.jxjData addObject:detailModel];
                }
                if (self.jxjData.count == 0) {
                    [self.view addSubview:self.kongJieMian];
                }else{
                    [self.kongJieMian removeFromSuperview];
                }
                [self.tbv reloadData];
            }
            
        } Failture:^(JiangXueJinModel * jxjError) {
//            [self.view showErrorText:jxjError.message];
            if ([[jxjError.message substringToIndex:5] isEqualToString:@"未登陆错误"]) {
                
                [LoginOut OutSuccess:^(TuiChuLoginModel * tuichumm) {
                    //登录
                    LoginViewController *loginVC = [[LoginViewController alloc]init];
                    [self.navigationController pushViewController:loginVC animated:YES];
//                    [self presentViewController:loginVC animated:YES completion:nil];
                    
                } Failture:^(TuiChuLoginModel * err_tuichumm) {
//                    [self.view showErrorText:err_tuichumm.message];
                }];
            }
        }];
    
}

#pragma mark --> 按钮的点击事件
-(void)goBackBtn:(UIButton *)backBtn{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark --> 懒加载
-(JiLuKongJieMianView *)kongJieMian{
    if (!_kongJieMian) {
        _kongJieMian = [[JiLuKongJieMianView alloc]init];
    }
    return _kongJieMian;
}
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
        // 判断版本号
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
         _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
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

#pragma mark --> 代理和协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.jxjData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JiangXueJinTableViewCell *jxjCell = [JiangXueJinTableViewCell cellWithTableview:tableView];
    
    if (self.jxjData[indexPath.row].name.length ) {
        jxjCell.titLab.text = [NSString stringWithFormat:@"%@",self.jxjData[indexPath.row].name];
        jxjCell.subLab.text = self.jxjData[indexPath.row].operationTime;
    }
    
    if ([self.jxjData[indexPath.row].accountRecordType isEqualToString:@"GRAINT"]) {
        jxjCell.moneyLab.text = [NSString stringWithFormat:@"+%@",self.jxjData[indexPath.row].amount];
        jxjCell.arrowsImg.hidden = YES;
        
    }else{
        
        jxjCell.moneyLab.text = [NSString stringWithFormat:@"-%@",self.jxjData[indexPath.row].amount];
        jxjCell.moneyLab.textColor = [UIColor colorWithHexString:@"#333333"];
    }
    
    return jxjCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.jxjData[indexPath.row].accountRecordType isEqualToString:@"GRAINT"]) {
        
    }else{
        JiangXueJinXiangQingController *jxjDetailVC = [[JiangXueJinXiangQingController alloc]init];
        UINavigationController *jxjDetailNav = [[UINavigationController alloc]initWithRootViewController:jxjDetailVC];
        jxjDetailVC.jiaoYiLiuShuiId = self.jxjData[indexPath.row].titleID;
        [self presentViewController:jxjDetailNav animated:YES completion:nil];
    }
    
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 72;
}

// 设置页眉高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

-(JiangXueJinDetailModel *)jxjDetailModel{
    if (!_jxjDetailModel) {
        _jxjDetailModel = [[JiangXueJinDetailModel alloc]init];
    }
    return _jxjDetailModel;
}
-(JiangXueJinViewModel *)jxjViewModel{
    if (!_jxjViewModel) {
        _jxjViewModel = [[JiangXueJinViewModel alloc]init];
    }
    return _jxjViewModel;
}
-(NSMutableArray<JiangXueJinDetailModel *> *)jxjData{
    if (!_jxjData) {
        _jxjData = [NSMutableArray array];
    }
    return _jxjData;
}
@end
