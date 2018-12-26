//
//  JiangXueJinXiangQingController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "JiangXueJinXiangQingController.h"
#import "JiangXueJinXiangQing.h"
#import "MiddleTableViewCell.h"

#import "JiangXueJInXiangQingModel.h"
#import "JiangXueJInXiangQingDetailModel.h"
#import "JiangXueJInXiangQingViewModel.h"


@interface JiangXueJinXiangQingController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)NSArray *keyArr;

@property(nonatomic,strong)JiangXueJInXiangQingModel *jxjxqModel;
@property(nonatomic,strong)JiangXueJInXiangQingDetailModel *jxjxqDetailModel;
@property(nonatomic,strong)JiangXueJInXiangQingViewModel *jxjxqViewModel;

@end

@implementation JiangXueJinXiangQingController

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
    titLab.text = @"上课详情";
    titLab.textAlignment = NSTextAlignmentCenter;
    titLab.textColor = [UIColor colorWithHexString:@"#333333"];
    titLab.font = BQBOLDFONT(18);
    
    self.navigationItem.titleView = titLab;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    
    // 网络请求
    [self netWorkRequest];
    
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
}

-(void)netWorkRequest{
    [self.jxjxqViewModel getJiangXueJinXiangQingWithTitleId:self.jiaoYiLiuShuiId Success:^(JiangXueJInXiangQingModel * jxjDetailModel) {
        
//        BQLog(@"model里的数据有%@",jxjDetailModel.data);
        
        self.jxjxqDetailModel.amount = jxjDetailModel.data[@"amount"];
        self.jxjxqDetailModel.clubName = jxjDetailModel.data[@"clubName"];
        self.jxjxqDetailModel.iceStadiumName = jxjDetailModel.data[@"iceStadiumName"];
        self.jxjxqDetailModel.memberName = jxjDetailModel.data[@"memberName"];
        self.jxjxqDetailModel.accountRecordType = jxjDetailModel.data[@"accountRecordType"];
        self.jxjxqDetailModel.membershipCategoryText = jxjDetailModel.data[@"membershipCategoryText"];
        
        self.jxjxqDetailModel.rechargeType = jxjDetailModel.data[@"rechargeType"];
        self.jxjxqDetailModel.cardType = jxjDetailModel.data[@"cardType"];
        self.jxjxqDetailModel.billDate = jxjDetailModel.data[@"billDate"];
        self.jxjxqDetailModel.courseAdvisor = jxjDetailModel.data[@"courseAdvisor"];
        self.jxjxqDetailModel.isFirstText = jxjDetailModel.data[@"isFirstText"];
        self.jxjxqDetailModel.auditTime = jxjDetailModel.data[@"auditTime"];
        
        [self.tbv reloadData];
        
    } Failture:^(JiangXueJInXiangQingModel * jxjDetailError) {
//        [self showErrorText:jxjDetailError.message];
    }];
}

#pragma mark --> 按钮的点击事件
-(void)goBackBtn:(UIButton *)backBtn{
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark --> 懒加载
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
    }
    return _tbv;
}

#pragma mark --> 代理和协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.keyArr.count;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        JiangXueJinXiangQing *jxjDetailCell = [JiangXueJinXiangQing cellWithTableView:tableView];
        jxjDetailCell.selectionStyle = UITableViewCellSelectionStyleNone;
        jxjDetailCell.titleLab.text = self.jxjxqDetailModel.iceStadiumName;
        jxjDetailCell.moneyLab.text = [NSString stringWithFormat:@"-%@",self.jxjxqDetailModel.amount];
        return jxjDetailCell;
        
    }else{
        
        NSMutableArray *valueArr = [NSMutableArray array];
        [valueArr addObject:sureStr(self.jxjxqDetailModel.memberName, @"")];
        [valueArr addObject:sureStr(self.jxjxqDetailModel.membershipCategoryText, @"")];
        [valueArr addObject:sureStr(self.jxjxqDetailModel.clubName, @"")];
        [valueArr addObject:sureStr(self.jxjxqDetailModel.billDate, @"")];
        [valueArr addObject:sureStr(self.jxjxqDetailModel.auditTime, @"")];
        [valueArr addObject:sureStr(self.jxjxqDetailModel.iceStadiumName, @"")];
        [valueArr addObject:sureStr(self.jxjxqDetailModel.courseAdvisor, @"")];
        [valueArr addObject:sureStr(self.jxjxqDetailModel.cardType, @"")];
        MiddleTableViewCell *cell = [MiddleTableViewCell cellWithTableView:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.zLabel.text = self.keyArr[indexPath.row];
        cell.fLabel.text = valueArr[indexPath.row];
        return cell;
    }
}

// 判断是否为空
NSString * sureStr(NSString *mmstr,NSString *mmtip){
    if ([mmstr isEqualToString:@""]||[mmstr isKindOfClass:[NSNull class]]||mmstr==nil) {
        return mmtip;
    }
    return mmstr;
}
// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 121;
    }
    return 50;
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

-(NSArray *)keyArr{
    if (!_keyArr) {
//        _keyArr = [NSArray arrayWithObjects:@"学员",@"会员类别",@"所属俱乐部", nil];
        _keyArr = [NSArray arrayWithObjects:@"学员",@"会员类别",@"所属俱乐部",@"开始时间",@"结束时间",@"球场",@"课程",@"团队会员", nil];
    }
    return _keyArr;
    
}
-(JiangXueJInXiangQingModel *)jxjxqModel{
    if (!_jxjxqModel) {
        _jxjxqModel = [[JiangXueJInXiangQingModel alloc]init];
    }
    return _jxjxqModel;
}
-(JiangXueJInXiangQingDetailModel *)jxjxqDetailModel{
    if (!_jxjxqDetailModel) {
        _jxjxqDetailModel = [[JiangXueJInXiangQingDetailModel alloc]init];
    }
    return _jxjxqDetailModel;
}
-(JiangXueJInXiangQingViewModel *)jxjxqViewModel{
    if (!_jxjxqViewModel) {
        _jxjxqViewModel = [[JiangXueJInXiangQingViewModel alloc]init];
    }
    return _jxjxqViewModel;
}

@end
