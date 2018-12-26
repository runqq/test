//
//  RecordViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "RecordViewController.h"
#import "JiLuKongJieMianView.h"

#import "WangLuoCuoWu.h"

#import "RecordTableViewCell.h"
#import "LoginViewController.h"

#import "GouKaJiLuDetailModel.h"
#import "GouKaJiLuViewModel.h"


@interface RecordViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int page;
    int size;
    NSNumber *pageNum;
    NSNumber *sizeNum;
}

@property(nonatomic,strong)JiLuKongJieMianView *kongJieMian;
@property(nonatomic,strong)WangLuoCuoWu *netWorkErrorView;

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UILabel  *titLab;

@property(nonatomic,strong)GouKaJiLuDetailModel *gkjlDetailModel;
@property(nonatomic,strong)GouKaJiLuViewModel *gkjlViewModel;
@property(nonatomic,strong)NSMutableArray <GouKaJiLuDetailModel *>*gkjlData;

@end

@implementation RecordViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 导航背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航标题
    self.navigationItem.titleView = self.titLab;
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
    // 背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    // 网络请求
    [self netWorkRequest];
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
    
}

-(void)netWorkRequest{
    
    page = 1;
    size = 10;
    pageNum = @(page);
    sizeNum = @(size);
    
    [self.gkjlViewModel getShangKeJiLuWithPageNo:pageNum PageSize:sizeNum memberId:self.studentID Success:^(GouKaJiLuModel * gkjlModel) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
        self.gkjlData = [NSMutableArray array];
        if (gkjlModel.success) {
            for (GouKaJiLuDetailModel *detailModel in gkjlModel.data) {
                [self.gkjlData addObject:detailModel];
            }
            if (self.gkjlData.count == 0) {
                [self.view addSubview:self.kongJieMian];
                
            }else{
                [self.kongJieMian removeFromSuperview];
            }
            [self.tbv reloadData];
        }
    } Failture:^(GouKaJiLuModel * gkjlError) {
        if ([[gkjlError.message substringFromIndex:5] isEqualToString:@"未登录错误"]) {
            [LoginOut OutSuccess:^(TuiChuLoginModel * tuichumm) {
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                [self presentViewController:loginVC animated:YES completion:nil];
            } Failture:^(TuiChuLoginModel * err_tuichumm) {
                [self.view showErrorText:err_tuichumm.message];
            }];
        }
        
    }];
    
}

#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark --> 懒加载
-(JiLuKongJieMianView *)kongJieMian{
    if (!_kongJieMian) {
        _kongJieMian = [[JiLuKongJieMianView alloc]init];
    }
    return _kongJieMian;
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"nav_back_blue"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(goBackBtn:) forControlEvents:UIControlEventTouchUpInside]; 
    }
    return _backBtn;
}
-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _titLab.text = @"购卡记录";
        _titLab.textAlignment = NSTextAlignmentCenter;
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQBOLDFONT(18);
    }
    return _titLab;
}

-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT) style:UITableViewStylePlain];
        // 分割线样式
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        _tbv.rowHeight = 223;
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

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return self.gkjlData.count;
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    
    RecordTableViewCell *recordCell = [RecordTableViewCell cellWithTableView:tableView];
    // 使用中
    if ([self.gkjlData[indexPath.row].surplusNum isEqualToNumber:@0]) {
        recordCell.stateLab.text = @"不可用";
    }else{
        recordCell.stateLab.text = self.gkjlData[indexPath.row].cardStateText;
    }
    recordCell.cardLab.text = self.gkjlData[indexPath.row].cardName;
    // 价钱
    recordCell.cardCountLab.text = [NSString stringWithFormat:@"%@",self.gkjlData[indexPath.row].price];
    // 总节数
    recordCell.knotCountLab.text = [NSString stringWithFormat:@"%@节",self.gkjlData[indexPath.row].classNum];
    // 已使用
    recordCell.usedCountLab.text = [NSString stringWithFormat:@"%@节",self.gkjlData[indexPath.row].usedClassNum];
    // 剩余
    recordCell.surplusCountLab.text = [NSString stringWithFormat:@"%@节",self.gkjlData[indexPath.row].surplusNum];
    // 卡号
    recordCell.nameLab.text = [NSString stringWithFormat:@"卡号%@",self.gkjlData[indexPath.row].cardNo];
    return recordCell;
}

-(GouKaJiLuDetailModel *)gkjlDetailModel{
    if (!_gkjlDetailModel) {
        _gkjlDetailModel = [[GouKaJiLuDetailModel alloc]init];
    }
    return _gkjlDetailModel;
}
-(GouKaJiLuViewModel *)gkjlViewModel{
    if (!_gkjlViewModel) {
        _gkjlViewModel = [[GouKaJiLuViewModel alloc]init];
    }
    return _gkjlViewModel;
}

@end
