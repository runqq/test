//
//  XiangQingViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XiangQingViewController.h"
#import "WangLuoCuoWu.h"
#import "FirstTableViewCell.h"
#import "SecTableViewCell.h"
#import "ThirTableViewCell.h"
#import "FourTableViewCell.h"
#import "FifthTableViewCell.h"
#import "SixTableViewCell.h"
#import "SevenTableViewCell.h"
#import "EighTableViewCell.h"
#import "ToolView.h"
#import "ClassInfoDetailViewController.h"
#import "StrategyViewController.h"
#import "CustomAlertView.h"

#import "XiangQingModel.h"
#import "MyDetailModel.h"
#import "XiangQingViewModel.h"

#import "CampBaoMingModel.h"
#import "CampBaoMingViewModel.h"

@interface XiangQingViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>

@property(nonatomic , strong) WangLuoCuoWu *networkError;

@property(nonatomic , strong) ToolView *toolV;
@property(nonatomic , strong) UIImageView *headV;
@property(nonatomic , strong) UIImageView *mengCengImg;
@property(nonatomic , strong) UILabel *leftLab;
@property(nonatomic , strong) UILabel *rightLab;

@property(nonatomic , strong) UITableView *tbv;
@property(nonatomic , strong) CustomAlertView  *cuAlertView;

@property(nonatomic , strong) XiangQingModel *xiangQingModel;
@property(nonatomic , strong) MyDetailModel *myDetailModel;
@property(nonatomic , strong) XiangQingViewModel *xqViewModel;

@property(nonatomic , strong) CampBaoMingModel *bmModel;
@property(nonatomic , strong) CampBaoMingViewModel *bmViewModel;

@end

@implementation XiangQingViewController

// 即将展示
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    //给导航条设置一个空的背景图 使其透明化
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去除导航条透明后导航条下的黑线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 隐藏导航自带的返回按钮
    [self.navigationItem setHidesBackButton:YES];
    
    // 左侧按钮
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [leftBtn setImage:[UIImage imageNamed:@"nav_back_white"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(goBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    // 检测网络状态
    [self ChickStatus];
    
}
-(void)ChickStatus{
    
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        if (status != RealStatusNotReachable) {
            // 网络解析
            [self NetworkRequest];
            [self addView];
            
        }else{
            
            [self.view addSubview:self.networkError];
            [self.networkError.refreshBtn addTarget:self action:@selector(refreshBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }];
}
-(void)addView{
    [self.cuAlertView.cancelBtn addTarget:self action:@selector(cancelShow) forControlEvents:UIControlEventTouchUpInside];
    [self.cuAlertView.sendBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    // 添加到视图
    [self.view addSubview:self.tbv];
    
    if ([self.endStr isEqualToString:@"cutOff"]) {
        [self.view addSubview:self.toolV];
        self.toolV.backgroundColor = [UIColor colorWithHexString:@"#bfbfbf"];
        self.toolV.applyBtn.hidden = YES;
        self.toolV.consultBtn.hidden = YES;
        self.toolV.lab.hidden = NO;
    }else{
        [self.view addSubview:self.toolV];
    }
    // 将试图添加到最顶部
    [self.toolV bringSubviewToFront:self.tbv];
    
    [self.headV addSubview:self.mengCengImg];
    [self.mengCengImg addSubview:self.leftLab];
    [self.mengCengImg addSubview:self.rightLab];
    
    // 适配
    [self addLayOut];
}

- (void)NetworkRequest{
    
    [self.xqViewModel getXiangQingWithID:self.ids Success:^(XiangQingModel *  detailModel) {
        if (detailModel.success) {
            
//            self.homePageDetailModel.height = homePageModel.data[@"height"];
            self.myDetailModel.dayHours = detailModel.data[@"dayHours"];
            self.myDetailModel.remark = detailModel.data[@"remark"];
            self.myDetailModel.recordNum = detailModel.data[@"recordNum"];
            self.myDetailModel.content = detailModel.data[@"content"];
            self.myDetailModel.amIntro = detailModel.data[@"amIntro"];
            self.myDetailModel.upFlag = detailModel.data[@"upFlag"];
            self.myDetailModel.price = detailModel.data[@"price"];
            self.myDetailModel.titleID = detailModel.data[@"id"];
            self.myDetailModel.pmIntro = detailModel.data[@"pmIntro"];
            self.myDetailModel.suitIntro = detailModel.data[@"suitIntro"];
            self.myDetailModel.address = detailModel.data[@"address"];
            self.myDetailModel.mobile = detailModel.data[@"mobile"];
            self.myDetailModel.photo = detailModel.data[@"photo"];
            self.myDetailModel.createTime = detailModel.data[@"createTime"];
            self.myDetailModel.subName = detailModel.data[@"subName"];
            self.myDetailModel.name = detailModel.data[@"name"];
            self.myDetailModel.attention = detailModel.data[@"attention"];
            self.myDetailModel.trainingDate = detailModel.data[@"trainingDate"];
            self.myDetailModel.signDate = detailModel.data[@"signDate"];
            self.myDetailModel.totalDuration = detailModel.data[@"totalDuration"];
    
            // 将训练营ID赋值给训练营报名的参数
            self.campId = self.myDetailModel.titleID;
            // 解析图片
            NSString *photoStr = self.myDetailModel.photo;
            [self.headV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",photoStr]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
            
            self.leftLab.text = self.myDetailModel.name;
            if ([self.endStr isEqualToString:@"cutOff"]) {
                self.rightLab.text = [NSString stringWithFormat:@"%@人报名",self.myDetailModel.recordNum];
            }else{
                self.rightLab.text = [NSString stringWithFormat:@"%@人已报名",self.myDetailModel.recordNum];
            }
            
            [self.tbv reloadData];
        }
        
    } Failture:^(XiangQingModel *  detailError) {
//        [self showErrorText:detailError.message];
    }];
}

#pragma mark --> 懒加载
-(WangLuoCuoWu *)networkError{
    if (!_networkError) {
        _networkError = [[WangLuoCuoWu alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
    }
    return _networkError;
}
-(ToolView *)toolV{
    if (!_toolV) {
        _toolV = [[ToolView alloc]initWithFrame:CGRectMake(0, SCREEN_H-50, SCREEN_W, 50)];
        _toolV.lineLab.textColor = [UIColor grayColor];
        _toolV.layer.borderWidth = 0.5;
        _toolV.layer.borderColor = [[UIColor colorWithHexString:@"#e2e2e2"] CGColor];
        // 致电咨询
        [_toolV.consultBtn addTarget:self action:@selector(consultBtnClick) forControlEvents:UIControlEventTouchUpInside];
        // 立即报名
        [_toolV.applyBtn addTarget:self action:@selector(applyImmediteally) forControlEvents:UIControlEventTouchUpInside];
        [_toolV.consultBtn showsTouchWhenHighlighted];
        
    }
    return _toolV;
}

-(UIImageView *)headV{
    if (!_headV) {
        // 头部视图
        _headV = [[UIImageView alloc]init];
        _headV.frame = CGRectMake(0, STATUS_BAR_HEIGHT , SCREEN_W, 220);
        _headV.userInteractionEnabled = YES;
    }
    return _headV;
}
-(UIImageView *)mengCengImg{
    if (!_mengCengImg) {
        _mengCengImg = [[UIImageView alloc]init];
        _mengCengImg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mask_camp_detail"]];
        _mengCengImg.userInteractionEnabled = YES;
    }
    return _mengCengImg;
}

// 适配
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.mengCengImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.headV.mas_top).with.offset(0);
        make.left.equalTo(weakself.headV.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.headV.mas_bottom).with.offset(0);
        make.right.equalTo(weakself.headV.mas_right).with.offset(0);
    }];
    [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.mengCengImg.mas_left).with.offset(20);
        make.bottom.equalTo(weakself.mengCengImg.mas_bottom).with.offset(-20);
    }];
    
    [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mengCengImg.mas_bottom).with.offset(-20);
        make.right.equalTo(weakself.mengCengImg.mas_right).with.offset(-20);
    }];
}

-(UILabel *)leftLab{
    if (!_leftLab) {
        _leftLab = [[UILabel alloc]init];
        _leftLab.text = @"冰球夏季训练营";
        _leftLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _leftLab.font = BQBOLDFONT(24);
        [_leftLab sizeToFit];
    }
    return _leftLab;
}
-(UILabel *)rightLab{
    if (!_rightLab) {
        _rightLab = [[UILabel alloc]init];
        _rightLab.text = @"3829人已报名";
        _rightLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
        _rightLab.font = BQFONT(13);
        [_rightLab sizeToFit];
    }
    return _rightLab;
}

-(UITableView *)tbv{
    if (!_tbv) {
        
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W , SCREEN_H) style:UITableViewStyleGrouped];
        // 设置分割线样式
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
        // 将试图添加到表格头部
        _tbv.tableHeaderView = self.headV;
        // 表格的分割线样式设置为None
        _tbv.separatorStyle =  UITableViewCellSeparatorStyleNone;
        
    }
    return _tbv;
}

// 初始化自定义提示框
-(CustomAlertView *)cuAlertView{
    if (!_cuAlertView) {
        _cuAlertView = [[CustomAlertView alloc] init];
    }
    return _cuAlertView;
}
#pragma mark -> 数据源方法
// 几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}
// 几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
// 设置cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        FirstTableViewCell *firstCell = [FirstTableViewCell cellWithTableView:tableView];
        if (self.myDetailModel.totalDuration != nil) {
            firstCell.numLab1.text = [NSString stringWithFormat:@"%@天",self.myDetailModel.totalDuration];
            firstCell.numLab2.text = [NSString stringWithFormat:@"%@小时",self.myDetailModel.dayHours];
            firstCell.numLab3.text = [NSString stringWithFormat:@"%@元",self.myDetailModel.price];
        }
        
        return firstCell;
        
    }else if (indexPath.section == 1){
        
        SecTableViewCell *secCell = [SecTableViewCell cellWithTableView:tableView];
        secCell.textV.text = self.myDetailModel.remark;
        // 点击事件
        [secCell.boultBtn addTarget:self action:@selector(boultClick) forControlEvents:UIControlEventTouchUpInside];
        return secCell;
        
    }else if (indexPath.section == 2){
        
        ThirTableViewCell *thirCell = [ThirTableViewCell cellWithTableView:tableView];
        thirCell.trainDateLab.text = self.myDetailModel.trainingDate;
        thirCell.applyDateLab.text = self.myDetailModel.signDate;
        return thirCell;
        
    }else if (indexPath.section == 3){
        
        FourTableViewCell *fourCell = [FourTableViewCell cellWithTableView:tableView];
        if (self.myDetailModel.amIntro != nil || self.myDetailModel.pmIntro != nil) {
        fourCell.amTime1.text = [NSString stringWithFormat:@"%@  A组冰上&B组陆地",self.myDetailModel.amIntro];
        fourCell.pmTime1.text = [NSString stringWithFormat:@"%@  A组冰上&B组陆地",self.myDetailModel.pmIntro];
        }
        return fourCell;
        
    }else if (indexPath.section == 4){
        
        FifthTableViewCell *fifCell = [FifthTableViewCell cellWithTableView:tableView];
        fifCell.siteLab1.text = self.myDetailModel.address;
        return fifCell;
        
    }else if (indexPath.section == 5){
        
        SixTableViewCell *sixCell = [SixTableViewCell cellWithTableView:tableView];
        sixCell.textV.text = self.myDetailModel.content;
        return sixCell;
        
    }else if (indexPath.section == 6){
        
        SevenTableViewCell *sevenCell = [SevenTableViewCell cellWithTableView:tableView];
        sevenCell.numLab.text = self.myDetailModel.mobile;
        return sevenCell;
        
    }else {
        
        EighTableViewCell  *eightCell = [EighTableViewCell cellWithTableView:tableView];
        eightCell.attionView.text = self.myDetailModel.attention;
        return eightCell;
    }
    
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
        
    }else if (indexPath.section == 1){
        return 170;
        
    }else if (indexPath.section == 2){
        
        return 100;
        
    }else if (indexPath.section == 3){
        
        return 230;
        
    }else if (indexPath.section == 4){
        
        return 130;
        
    }else if (indexPath.section == 5){
        
        return 180;
        
    }else if (indexPath.section == 6){
        
        return 100;
        
    }else{
        return 200;
    }
}

// 设置页眉和页脚高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 10;
    }
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

#pragma mark --> 按钮的点击事件
- (void)goBackBtn:(UIButton *)fanHuiBtn{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)refreshBtnClick:(UIButton *)refresh{
    
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        if (status != RealStatusNotReachable) {
            // 网络解析
            [self NetworkRequest];
            [self addView];
            
        }else{
            [SVProgressHUD showErrorText:@"请检查您的网络"];
            [SVProgressHUD dismissWithDelay:0.5];
        }
    }];
}
// 跳转到弹窗
-(void)boultClick{
    ClassInfoDetailViewController  *detailVC = [[ClassInfoDetailViewController alloc] init];
    [self.navigationController presentViewController:detailVC animated:YES completion:nil];
}
// 致电咨询按钮 400-600-8928
-(void)consultBtnClick{
    NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", @"400-600-8928"];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone] options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
    }
}
//立即报名按钮
-(void)applyImmediteally{
    [self.cuAlertView showCustomAlertViewOnView:self.view];
    if ([User_Default objectForKey:@"myjsession"]) {
        self.cuAlertView.phoneNumTF.placeholder = [User_Default objectForKey:@"myPhoneNumber"];
    }
}

//弹框X
-(void)cancelShow{
    [self.cuAlertView dissmissCustomAlertView];
}
//提交按钮
-(void)submit{
    
    // 将输入的手机号赋值给训练营报名的参数
    self.campMobile = self.cuAlertView.phoneNumTF.text;
    
    if (self.cuAlertView.phoneNumTF.text.length) {
        
        ZJChickTools  *tool = [[ZJChickTools alloc] init];
        if ([tool IsValidPhoneNumber:self.cuAlertView.phoneNumTF.text]) {
            
            [self.bmViewModel getCampBaoMingWithCampId:self.campId Mobile:self.campMobile Success:^(CampBaoMingModel * baoMingModel) {
                
                if  (baoMingModel.success) {
//                    [SVProgressHUD showSuccessText:@"您已报名!"];
//                    [SVProgressHUD dismissWithDelay:0.5];
                    [self showSuccessText:baoMingModel.message];
                    [self.cuAlertView dissmissCustomAlertView];
                }
                
            } Failture:^(CampBaoMingModel * baoMingError) {
//                BQLog(@"%@",baoMingError.message);
                    [self.view showErrorText:baoMingError.message];
            }];
            
        }else{
            [self.view showErrorText:@"号码有问题"];
        }
        
    }else{
        
        [SVProgressHUD showErrorText:@"手机号不能为空!"];
        [SVProgressHUD dismissWithDelay:0.5];
    }
    
}



-(XiangQingModel *)xiangQingModel{
    if (!_xiangQingModel) {
        _xiangQingModel = [[XiangQingModel alloc]init];
    }
    return _xiangQingModel;
}

-(MyDetailModel *)myDetailModel{
    if (!_myDetailModel) {
        _myDetailModel = [[MyDetailModel alloc]init];
    }
    return _myDetailModel;
}
-(XiangQingViewModel *)xqViewModel{
    if (!_xqViewModel) {
        _xqViewModel = [[XiangQingViewModel alloc]init];
    }
    return _xqViewModel;
}

-(CampBaoMingModel *)bmModel{
    if (!_bmModel) {
        _bmModel = [[CampBaoMingModel alloc]init];
    }
    return _bmModel;
}
-(CampBaoMingViewModel *)bmViewModel{
    if (!_bmViewModel) {
        _bmViewModel = [[CampBaoMingViewModel alloc]init];
    }
    return _bmViewModel;
}

@end
