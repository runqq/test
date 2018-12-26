//
//  AccountDetails.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "AccountDetails.h"
#import "JiangXueJinXiangQing.h"
#import "MiddleTableViewCell.h"

#import "JiaoYiXiangQingModel.h"
#import "JiaoYiXiangQingDetailModel.h"
#import "JiaoYIXiangQingViewModel.h"

@interface AccountDetails ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)NSArray *chongZhiArr;
@property(nonatomic,strong)NSArray *gouKaArr;
@property(nonatomic,strong)NSArray *xiaoFeiArr;
@property(nonatomic,strong)NSArray *tuiKuanArr;
@property(nonatomic,strong)NSArray *shangKeArr;

@property(nonatomic,strong)JiaoYiXiangQingModel *jiaoYiModel;
@property(nonatomic,strong)JiaoYiXiangQingDetailModel *jiaoYiDetailModel;
@property(nonatomic,strong)JiaoYIXiangQingViewModel *jiaoYiViewModel;


@end

@implementation AccountDetails

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
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    // 导航标题
    UILabel  *titLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
    
    if ([self.accountRecordType isEqualToString:@"RECHARGE"]){
        titLab.text = @"充值详情";
    }else if ([self.accountRecordType isEqualToString:@"BUY_CARD"]){
        titLab.text = @"购卡详情";
    }else if ([self.accountRecordType isEqualToString:@"CLASS"]){
        titLab.text = @"上课详情";
    }else if ([self.accountRecordType isEqualToString:@"CONSUMPTION"]){
        titLab.text = @"消费详情";
    }else if ([self.accountRecordType isEqualToString:@"REFUND"]){
        titLab.text = @"退款详情";
    }
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
    
    [self.jiaoYiViewModel getJiaoYiXiangQingWithTitleId:self.strID Success:^(JiaoYiXiangQingModel *  jyxqlModel) {
        
        self.jiaoYiDetailModel.amount                  = jyxqlModel.data[@"amount"];
        self.jiaoYiDetailModel.clubName                = jyxqlModel.data[@"clubName"];
        self.jiaoYiDetailModel.iceStadiumName          = jyxqlModel.data[@"iceStadiumName"];
        self.jiaoYiDetailModel.memberName              = jyxqlModel.data[@"memberName"];
        self.jiaoYiDetailModel.accountRecordType       = jyxqlModel.data[@"accountRecordType"];
        self.jiaoYiDetailModel.membershipCategoryText  = jyxqlModel.data[@"membershipCategoryText"];
        self.jiaoYiDetailModel.rechargeType            = jyxqlModel.data[@"rechargeType"];
        self.jiaoYiDetailModel.cardType                = jyxqlModel.data[@"cardType"];
        self.jiaoYiDetailModel.billDate                = jyxqlModel.data[@"billDate"];
        self.jiaoYiDetailModel.courseAdvisor           = jyxqlModel.data[@"courseAdvisor"];
        self.jiaoYiDetailModel.isFirstText             = jyxqlModel.data[@"isFirstText"];
        self.jiaoYiDetailModel.auditTime               = jyxqlModel.data[@"auditTime"];
        self.jiaoYiDetailModel.createTime              = jyxqlModel.data[@"createTime"];
        self.jiaoYiDetailModel.sx                      = jyxqlModel.data[@"sx"];
        self.jiaoYiDetailModel.cardNo                  = jyxqlModel.data[@"cardNo"];
        self.jiaoYiDetailModel.payMethod               = jyxqlModel.data[@"payMethod"];
        self.jiaoYiDetailModel.cardTypeText            = jyxqlModel.data[@"cardTypeText"];
        self.jiaoYiDetailModel.enableDate              = jyxqlModel.data[@"enableDate"];
        self.jiaoYiDetailModel.membershipCategory      = jyxqlModel.data[@"membershipCategory"];
        self.jiaoYiDetailModel.startTime               = jyxqlModel.data[@"startTime"];
        self.jiaoYiDetailModel.endTime                 = jyxqlModel.data[@"endTime"];
        self.jiaoYiDetailModel.tdhy                    = jyxqlModel.data[@"tdhy"];
        self.jiaoYiDetailModel.coach                   = jyxqlModel.data[@"coach"];
        self.jiaoYiDetailModel.auditStatus             = jyxqlModel.data[@"auditStatus"];
        self.jiaoYiDetailModel.consumptionItems        = jyxqlModel.data[@"consumptionItems"];
        self.jiaoYiDetailModel.refundsType             = jyxqlModel.data[@"refundsType"];
        self.jiaoYiDetailModel.courseName             = jyxqlModel.data[@"courseName"];
        
        [self.tbv reloadData];
        
    } Failture:^(JiaoYiXiangQingModel *  jyxqError) {
//        [self showErrorText:jyxqError.message];
    }];
    
}
#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark -> 懒加载
-(UITableView *)tbv{
    if (!_tbv) {
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0 ,0, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
        // 分割线样式
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置代理和数据源
        _tbv.delegate=self;
        _tbv.dataSource=self;
    }
    return _tbv;
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
        
    }else{
        
        if ([self.jiaoYiDetailModel.accountRecordType isEqualToString:@"RECHARGE"]) {
            return self.chongZhiArr.count;
            
        }else if ([self.jiaoYiDetailModel.accountRecordType isEqualToString:@"BUY_CARD"]){
            return self.gouKaArr.count;
            
        }else if ([self.jiaoYiDetailModel.accountRecordType isEqualToString:@"CONSUMPTION"]){
            return self.xiaoFeiArr.count;
            
        }else if ([self.jiaoYiDetailModel.accountRecordType isEqualToString:@"REFUND"]){
            return self.tuiKuanArr.count;
            
        }else{
            return self.shangKeArr.count;
        }
    }
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    
    if (indexPath.section == 0) {
        
        JiangXueJinXiangQing *jxjDetailCell = [JiangXueJinXiangQing cellWithTableView:tableView];
        jxjDetailCell.selectionStyle = UITableViewCellSelectionStyleNone;
        // 课程名称
        jxjDetailCell.titleLab.text = self.titleStr;
        if ([self.jiaoYiDetailModel.sx isEqualToString:@"plus"]) {

            if (self.jiaoYiDetailModel.amount) {
               jxjDetailCell.moneyLab.text = [NSString stringWithFormat:@"+%@",self.jiaoYiDetailModel.amount];
            }else{
                jxjDetailCell.moneyLab.text = @"0";
            }
        }else{
            if (self.jiaoYiDetailModel.amount) {
                jxjDetailCell.moneyLab.text = [NSString stringWithFormat:@"-%@",self.jiaoYiDetailModel.amount];
            }else{
                jxjDetailCell.moneyLab.text = @"0";
            }
        }
        return jxjDetailCell;
        
    }else{
        
        MiddleTableViewCell *cell = [MiddleTableViewCell cellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if ([self.jiaoYiDetailModel.accountRecordType isEqualToString:@"RECHARGE"]) {
            cell.zLabel.text = self.chongZhiArr[indexPath.row];
            
            switch (indexPath.row) {
                case 0:{
                    cell.fLabel.text = self.jiaoYiDetailModel.memberName;// 学员
                }
                    break;
                case 1:{
                    cell.fLabel.text = self.jiaoYiDetailModel.membershipCategory;// 学员类别
                }
                    break;
                case 2:{
                    cell.fLabel.text = self.jiaoYiDetailModel.clubName;// 所属俱乐部
                }
                    break;
                case 3:{
                    cell.fLabel.text = self.jiaoYiDetailModel.rechargeType;// 充值类型
                }
                    break;
                case 4:{
                    cell.fLabel.text = self.jiaoYiDetailModel.cardType;// 充值卡类型
                }
                    break;
                case 5:{
                    cell.fLabel.text = self.jiaoYiDetailModel.createTime;// 单据日期
                }
                    break;
                case 6:{
                    cell.fLabel.text = self.jiaoYiDetailModel.courseAdvisor;// 课程顾问
                }
                    break;
                case 7:{
                    cell.fLabel.text = self.jiaoYiDetailModel.isFirstText;// 是否首充
                }
                    break;
                case 8:{
                    cell.fLabel.text = self.jiaoYiDetailModel.auditTime;// 审核时间
                }
                    break;
                    
                default:
                    break;
            }
            
        }else if ([self.jiaoYiDetailModel.accountRecordType isEqualToString:@"BUY_CARD"]){
            cell.zLabel.text = self.gouKaArr[indexPath.row];
            switch (indexPath.row) {
                case 0:{
                    cell.fLabel.text = self.jiaoYiDetailModel.memberName;// 学员
                }
                    break;
                case 1:{
                    cell.fLabel.text = self.jiaoYiDetailModel.clubName;// 所属俱乐部
                }
                    break;
                case 2:{
                    cell.fLabel.text = self.jiaoYiDetailModel.iceStadiumName;// 所属球场
                }
                    break;
                case 3:{
                    cell.fLabel.text = self.jiaoYiDetailModel.cardNo;// 卡号
                }
                    break;
                case 4:{
                    cell.fLabel.text = self.jiaoYiDetailModel.payMethod;// 收款方式
                }
                    break;
                case 5:{
                    cell.fLabel.text = self.jiaoYiDetailModel.createTime;// 销售时间
                }
                    break;
                case 6:{
                    cell.fLabel.text = self.jiaoYiDetailModel.cardTypeText;// 卡状态
                }
                    break;
                case 7:{
                    cell.fLabel.text = self.jiaoYiDetailModel.enableDate;// 启用时间
                }
                    
                default:
                    break;
            }
            
        }else if ([self.jiaoYiDetailModel.accountRecordType isEqualToString:@"CONSUMPTION"]){
            cell.zLabel.text = self.xiaoFeiArr[indexPath.row];
            switch (indexPath.row) {
                case 0:{
                    cell.fLabel.text = self.jiaoYiDetailModel.memberName;// 学员
                }
                    break;
                case 1:{
                    cell.fLabel.text = self.jiaoYiDetailModel.membershipCategory;// 会员类别
                }
                    break;
                case 2:{
                    cell.fLabel.text = self.jiaoYiDetailModel.iceStadiumName;// 所属球场
                }
                    break;
                case 3:{
                    cell.fLabel.text = self.jiaoYiDetailModel.createTime;// 单据日期
                }
                    break;
                case 4:{
                    cell.fLabel.text = self.jiaoYiDetailModel.coach;// 教练
                }
                    break;
                case 5:{
                    cell.fLabel.text = self.jiaoYiDetailModel.auditStatus;// 审核状态
                }
                    break;
                case 6:{
                    cell.fLabel.text = self.jiaoYiDetailModel.createTime;// 销售时间
                }
                    break;
                    
                default:
                    break;
            }
            
        }else if ([self.jiaoYiDetailModel.accountRecordType isEqualToString:@"REFUND"]){
            cell.zLabel.text = self.tuiKuanArr[indexPath.row];
            switch (indexPath.row) {
                case 0:{
                    cell.fLabel.text = self.jiaoYiDetailModel.memberName;// 学员
                }
                    break;
                case 1:{
                    cell.fLabel.text = self.jiaoYiDetailModel.membershipCategory;// 会员类别
                }
                    break;
                case 2:{
                    cell.fLabel.text = self.jiaoYiDetailModel.iceStadiumName;// 所属球场
                }
                    break;
                case 3:{
                    cell.fLabel.text = self.jiaoYiDetailModel.refundsType;// 退款类型
                }
                    break;
                case 4:{
                    cell.fLabel.text = self.jiaoYiDetailModel.createTime;// 单据日期
                }
                    break;
                case 5:{
                    cell.fLabel.text = self.jiaoYiDetailModel.auditStatus;// 审核状态
                }
                    break;
                    
                default:
                    break;
            }
            
            
        }else{
            cell.zLabel.text = self.shangKeArr[indexPath.row];
            switch (indexPath.row) {
                case 0:{
                    cell.fLabel.text = self.jiaoYiDetailModel.memberName;// 学员
                }
                    break;
                case 1:{
                    cell.fLabel.text = self.jiaoYiDetailModel.membershipCategory;// 会员类别
                }
                    break;
                case 2:{
                    cell.fLabel.text = self.jiaoYiDetailModel.clubName;// 所属俱乐部
                }
                    break;
                case 3:{
                    cell.fLabel.text = self.jiaoYiDetailModel.startTime;// 开始时间
                }
                    break;
                case 4:{
                    cell.fLabel.text = self.jiaoYiDetailModel.endTime;// 结束时间
                }
                    break;
                case 5:{
                    cell.fLabel.text = self.jiaoYiDetailModel.iceStadiumName;// 球场
                }
                    break;
                case 6:{
                    cell.fLabel.text = self.jiaoYiDetailModel.courseName;// 课程
                }
                    break;
                case 7:{
                    cell.fLabel.text = self.jiaoYiDetailModel.tdhy;// 团队会员
                }
                    
                default:
                    break;
            }
        }
        return cell;
    }
}
// 判断是否为空
NSString * strSure(NSString *mstr,NSString *mtip){
    if ([mstr isEqualToString:@""]||[mstr isKindOfClass:[NSNull class]]||mstr==nil) {
        return mtip;
    }
    return mstr;
}
// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 121;
    }
    return 45;
}
// 设置页眉高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

-(NSArray *)chongZhiArr{
    if (!_chongZhiArr) {
        _chongZhiArr = [NSArray arrayWithObjects:@"学员",@"会员类别",@"所属俱乐部",@"充值类型",@"充值卡类型",@"单据日期",@"课程顾问",@"是否首充",@"审核时间", nil];
    }
    return _chongZhiArr;
}
-(NSArray *)gouKaArr{
    if (!_gouKaArr) {
        _gouKaArr = [NSArray arrayWithObjects:@"学员",@"所属俱乐部",@"所属球场",@"卡号",@"收款方式",@"销售时间",@"卡状态",@"启用时间", nil];
    }
    return _gouKaArr;
}
-(NSArray *)xiaoFeiArr{
    if (!_xiaoFeiArr) {
        _xiaoFeiArr = [NSArray arrayWithObjects:@"学员",@"会员类别",@"所属球场",@"单据日期",@"教练",@"审核状态",@"销售时间", nil];
    }
    return _xiaoFeiArr;
}
-(NSArray *)tuiKuanArr{
    if (!_tuiKuanArr) {
        _tuiKuanArr = [NSArray arrayWithObjects:@"学员",@"会员类别",@"所属球场",@"退款类型",@"单据日期",@"审核状态", nil];
    }
    return _tuiKuanArr;
}
-(NSArray *)shangKeArr{
    if (!_shangKeArr) {
        _shangKeArr = [NSArray arrayWithObjects:@"学员",@"会员类别",@"所属俱乐部",@"开始时间",@"结束时间",@"球场",@"课程",@"团队会员", nil];
    }
    return _shangKeArr;
}

-(JiaoYiXiangQingModel *)jiaoYiModel{
    if (!_jiaoYiModel) {
        _jiaoYiModel = [[JiaoYiXiangQingModel alloc]init];
    }
    return _jiaoYiModel;
}
-(JiaoYiXiangQingDetailModel *)jiaoYiDetailModel{
    if (!_jiaoYiDetailModel) {
        _jiaoYiDetailModel = [[JiaoYiXiangQingDetailModel alloc]init];
    }
    return _jiaoYiDetailModel;
}
-(JiaoYIXiangQingViewModel *)jiaoYiViewModel{
    if (!_jiaoYiViewModel) {
        _jiaoYiViewModel = [[JiaoYIXiangQingViewModel alloc]init];
    }
    return _jiaoYiViewModel;
}


@end
