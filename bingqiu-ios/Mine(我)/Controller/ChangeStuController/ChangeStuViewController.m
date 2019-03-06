//
//  ChangeStuViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChangeStuViewController.h"
#import "ChangeStuTableViewCell.h"
#import "RecordViewController.h"
#import "MineViewController.h"

#import "HuoQuStuListViewModel.h"
#import "HuoQuStuListDetailModel.h"

#import "QieHuanStudentModel.h"
#import "QieHuanStudentViewModel.h"

@interface ChangeStuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tbv;

@property(nonatomic,strong)HuoQuStuListViewModel *hqStuListViewModel;
@property(nonatomic,strong)HuoQuStuListDetailModel *hqStuListDetailModel;
@property(nonatomic,strong)NSMutableArray <HuoQuStuListDetailModel *>*stuListData;

@property(nonatomic,strong)QieHuanStudentModel *qieHuanModel;
@property(nonatomic,strong)QieHuanStudentViewModel *qieHuanViewModel;


@end

@implementation ChangeStuViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航标题
    UILabel  *titLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
    titLab.text = @"切换学员";
    // 字体居中
    titLab.textAlignment = NSTextAlignmentCenter;
    titLab.textColor = [UIColor colorWithHexString:@"#333333"];
    titLab.font = BQBOLDFONT(18);
    self.navigationItem.titleView = titLab;
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 网络请求
    [self newWorkRequest];
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
    
}
#pragma mark --> 自定义相应方法
-(void)goBackBtn:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)newWorkRequest{
    [self.hqStuListViewModel getHuoQuStuListSuccess:^(HuoQuStuListModel * huoQuStuListModel) {
        if (huoQuStuListModel.success) {
            for (HuoQuStuListDetailModel *detailModel in huoQuStuListModel.data) {
                [self.stuListData addObject:detailModel];
            }
        }
        [self.tbv reloadData];
    } Failture:^(HuoQuStuListModel * huoQuStuLisError) {
        
    }];
    
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
        // 背景颜色
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tbv;
}

#pragma mark --> 数据源方法
// 几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
// 几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.stuListData.count;
}
// 设置cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChangeStuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[ChangeStuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
        // 学员姓名
        cell.nameLab.text = self.stuListData[indexPath.row].name;
    
    if (self.memId == self.stuListData[indexPath.row].nameID) {
        
        [cell.rightBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
        
    }else{
        
        [cell.rightBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
    }
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ChangeStuTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.rightBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
    
    // 切换学员
    self.memId = self.stuListData[indexPath.row].nameID;
    
    [self.qieHuanViewModel getQieHuanStudentWithMemberId:self.memId Success:^(QieHuanStudentModel * changeModel) {
        if (changeModel.success) {
            [SVProgressHUD showSuccessText:@"操作成功!"];
            [SVProgressHUD dismissWithDelay:0.5];
            // 购卡记录VC
            RecordViewController *record = [[RecordViewController alloc]init];
            record.studentID = self.memId;
            
        }else{
            [self showErrorText:changeModel.message];
        }
        // 刷新表格
        [self.tbv reloadData];
        
    } Failture:^(QieHuanStudentModel * changeError) {
        
    }];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    ChangeStuTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.rightBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
}

-(HuoQuStuListViewModel *)hqStuListViewModel{
    if (!_hqStuListViewModel) {
        _hqStuListViewModel = [[HuoQuStuListViewModel alloc]init];
    }
    return _hqStuListViewModel;
}
-(HuoQuStuListDetailModel *)hqStuListDetailModel{
    if (!_hqStuListDetailModel) {
        _hqStuListDetailModel = [[HuoQuStuListDetailModel alloc]init];
    }
    return _hqStuListDetailModel;
}
-(NSMutableArray<HuoQuStuListDetailModel *> *)stuListData{
    if (!_stuListData) {
        _stuListData = [NSMutableArray array];
    }
    return _stuListData;
}
-(QieHuanStudentModel *)qieHuanModel{
    if (!_qieHuanModel) {
        _qieHuanModel = [[QieHuanStudentModel alloc]init];
    }
    return _qieHuanModel;
}
-(QieHuanStudentViewModel *)qieHuanViewModel{
    if (!_qieHuanViewModel) {
        _qieHuanViewModel = [[QieHuanStudentViewModel alloc]init];
    }
    return _qieHuanViewModel;
}

@end
