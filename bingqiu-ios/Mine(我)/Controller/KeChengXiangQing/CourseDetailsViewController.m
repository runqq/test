//
//  CourseDetailsViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CourseDetailsViewController.h"
#import "KeChengXiangQing.h"
#import "MiddleTableViewCell.h"
#import "FooterView.h"
#import "EvaluateView.h"
#import "TouSuViewController.h"

#import "ShangKeXiangQingModel.h"
#import "ShangKeXiangQingDetailModel.h"
#import "ShangKeXinagQingViewModel.h"

@interface CourseDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UILabel *navTitleLab;
@property(nonatomic,strong)UIButton *rightBut;

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)FooterView *footV;
@property(nonatomic,strong)EvaluateView *evaluateV;

@property(nonatomic,strong)ShangKeXiangQingModel *classDetailModel;
@property(nonatomic,strong)ShangKeXiangQingDetailModel *classXQDetailModel;
@property(nonatomic,strong)ShangKeXinagQingViewModel *classDetailViewModel;


@end

@implementation CourseDetailsViewController

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
    
    self.navigationItem.titleView = self.navTitleLab;

    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self netWorkRequest];
    
    [self.view addSubview:self.tbv];
    [self.view addSubview:self.footV];
    
}

-(void)netWorkRequest{
    
    [self.classDetailViewModel getShangKeXiangQingWithCourseId:self.kcId Success:^(ShangKeXiangQingModel * skxqModel) {
        
        self.classXQDetailModel.secondCoach = skxqModel.data[@"secondCoach"];
        self.classXQDetailModel.firstCoach = skxqModel.data[@"firstCoach"];
        self.classXQDetailModel.iceStadium = skxqModel.data[@"iceStadium"];
        self.classXQDetailModel.name = skxqModel.data[@"name"];
        self.classXQDetailModel.startTime = skxqModel.data[@"startTime"];
        self.classXQDetailModel.endTime = skxqModel.data[@"endTime"];
        self.classXQDetailModel.titleId = skxqModel.data[@"id"];
        self.classXQDetailModel.courseTime = skxqModel.data[@"courseTime"];
        self.classXQDetailModel.courseLength = skxqModel.data[@"courseLength"];
        
        [self.tbv reloadData];
        
    } Failture:^(ShangKeXiangQingModel * skxqError) {
        
    }];
    
}

#pragma mark --> 懒加载
-(UILabel *)navTitleLab{
    if (!_navTitleLab) {
        // 导航标题
        _navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _navTitleLab.text = @"课程详情";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}

-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - NAVIGATION_BAR_HEIGHT) style:UITableViewStyleGrouped];
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        
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

-(FooterView *)footV{
    if (!_footV) {
        _footV = [[FooterView alloc]initWithFrame:CGRectMake(0, SCREEN_H-75, SCREEN_W, 75)];
        // 评价本次课程按钮
        [_footV.evaluateBtn addTarget:self action:@selector(evalueteBtn:) forControlEvents:UIControlEventTouchUpInside];
        // 投诉按钮
        [_footV.complaintBtn addTarget:self action:@selector(complainBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _footV;
}

#pragma mark --> 代理和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        KeChengXiangQing *oneCell = [KeChengXiangQing cellWithTableView:tableView];
        oneCell.titleLab.text = self.classXQDetailModel.name;
        oneCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return oneCell;
        
    }else if (indexPath.section == 1){
        
        MiddleTableViewCell *twoCell = [MiddleTableViewCell cellWithTableView:tableView];
        twoCell.fLabel.text = self.classXQDetailModel.courseTime;
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return twoCell;
        
    }else if (indexPath.section == 2){
        
        MiddleTableViewCell *twoCell = [MiddleTableViewCell cellWithTableView:tableView];
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        twoCell.zLabel.text = @"课程时间";
        
        if (self.classXQDetailModel.courseLength != nil) {
            twoCell.fLabel.text = [NSString stringWithFormat:@"%@分钟",self.classXQDetailModel.courseLength];
        }else{
            twoCell.fLabel.text = @"";
        }
        
        return twoCell;
        
    }else if (indexPath.section == 3){
    
        MiddleTableViewCell *twoCell = [MiddleTableViewCell cellWithTableView:tableView];
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        twoCell.zLabel.text = @"教练";
        twoCell.fLabel.text = self.classXQDetailModel.firstCoach;
        return twoCell;
        
    }else if (indexPath.section == 4){
        
        MiddleTableViewCell *twoCell = [MiddleTableViewCell cellWithTableView:tableView];
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        twoCell.zLabel.text = @"球场";
        twoCell.fLabel.text = self.classXQDetailModel.iceStadium;
        return twoCell;
        
    }else {
        
        MiddleTableViewCell *twoCell = [MiddleTableViewCell cellWithTableView:tableView];
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        twoCell.zLabel.text = @"费用";
        if (self.classXQDetailModel.courseLength != nil) {
            twoCell.fLabel.text = [NSString stringWithFormat:@"现金¥%@",self.moneyStr];
        }else{
            twoCell.fLabel.text = @"";
        }
        return twoCell;
        
    }
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 94;
    }else if (indexPath.section == 7){
        return 150;
    }else{
        return 55;
    }
}

// 设置页眉高度
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

#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)evalueteBtn:(UIButton *)evalueteBtn{

    _evaluateV = [[EvaluateView alloc]init];
    // 返回按钮
    [_evaluateV.cancelBtn addTarget:self action:@selector(cancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    // 提交按钮
    [_evaluateV.submitBtn addTarget:self action:@selector(submitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.evaluateV showCustomAlertViewOnView:self.view];
}
-(void)complainBtn:(UIButton *)complainBtn{

    TouSuViewController *tousuVC = [[TouSuViewController alloc]init];
    tousuVC.skID = self.classXQDetailModel.titleId;
    UINavigationController *tousuNav = [[UINavigationController alloc]initWithRootViewController:tousuVC];
    [self presentViewController:tousuNav animated:NO completion:nil];
    
}
// 返回按钮
-(void)cancelBtnClick:(UIButton *)cancelBtn{
    [self.evaluateV dissmissCustomAlertView];
    
}
// 提交按钮
-(void)submitBtnClick:(UIButton *)submitBtn{
    if (!self.evaluateV.smallTextV.text.length) {
        [self showErrorText:@"请输入你对本次课程的评价"];
         return ;
    }
    [self.evaluateV dissmissCustomAlertView];
}

-(ShangKeXiangQingModel *)classDetailModel{
    if (!_classDetailModel) {
        _classDetailModel = [[ShangKeXiangQingModel alloc]init];
    }
    return _classDetailModel;
}
-(ShangKeXiangQingDetailModel *)classXQDetailModel{
    if (!_classXQDetailModel) {
        _classXQDetailModel = [[ShangKeXiangQingDetailModel alloc]init];
    }
    return _classXQDetailModel;
}
-(ShangKeXinagQingViewModel *)classDetailViewModel{
    if (!_classDetailViewModel) {
        _classDetailViewModel = [[ShangKeXinagQingViewModel alloc]init];
    }
    return _classDetailViewModel;
}

@end
