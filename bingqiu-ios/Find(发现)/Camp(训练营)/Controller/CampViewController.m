//
//  CampViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CampViewController.h"
#import "CampTableViewCell.h"
#import "CampOneTableViewCell.h"
#import "CampTwoTableViewCell.h"
#import "CampThreeTableViewCell.h"
#import "MineTwoTableViewCell.h"
#import "ViewController.h"
#import "StrategyViewController.h"
#import "XiangQingViewController.h"
#import "CampViewModel.h"
#import "CampDetailModel.h"


@interface CampViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int size;
    int page;
    NSNumber *sizeNum;
    NSNumber *pageNum;
}
@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)CampViewModel *campVM;
@property(nonatomic,strong)CampDetailModel *campDetailM;
@property(nonatomic,strong)NSMutableArray <CampDetailModel *>*campData;

@end

@implementation CampViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    page = 1;
    size = 10;
    pageNum = @(page);
    sizeNum = @(size);
    // 网络检测
    [self ChickStatus];
    // 添加到视图
    [self.view addSubview:self.tbv];
    
}
-(void)ChickStatus{
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        if (status != RealStatusNotReachable) {
            // 网络解析
            [self netWorkRequest];
        }else{
            [SVProgressHUD showErrorText:@"网络不给力"];
            [SVProgressHUD dismissWithDelay:0.5];
        }
    }];
}
// 网络解析
-(void)netWorkRequest{
    
    self.campData = [NSMutableArray array];
    
    [self.campVM getCampWithPageNum:pageNum PageSize:sizeNum Success:^(CampModel * campModel) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
        if (campModel.success) {
            
            for (CampDetailModel *campDetailModel in campModel.data) {
                [self.campData addObject:campDetailModel];
            }
            [self.tbv reloadData];
        }
    } Failture:^(CampModel * _Nonnull campError) {
        //BQLog(@"--------%d",campError.success);
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
    }];
}

#pragma mark --> 懒加载
-(UITableView *)tbv{
    if (!_tbv) {
        
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W , SCREEN_H - TABBAR_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT) style:UITableViewStyleGrouped];
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
//            [self->_tbv reloadData];
        }];
        
    }
    return _tbv;
}


#pragma mark -> 数据源方法
// 几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
// 几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return self.campData.count;
    }
    return 1;
}

// 设置cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        CampTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[CampTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        // 设置选中样式
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (self.campData.count) {
            [cell.headImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.campData[indexPath.row].photo]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
        }
        return cell;
        
    }else if (indexPath.section == 1){
        MineTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[MineTwoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.leftLab.text = @"训练营";
        cell.leftLab.textColor = [UIColor colorWithHexString:@"#333333"];
        cell.leftLab.font = BQBOLDFONT(14);
        cell.rightLab.text = @"";
        
        return cell;
        
    }else {
        CampOneTableViewCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"oneCell"];
        if (!oneCell) {
            oneCell = [[CampOneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"oneCell"];
        }
        if (self.campData.count) {
            oneCell.selectionStyle = UITableViewCellSelectionStyleNone;
            [oneCell.dtImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.campData[indexPath.row].photo]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
            oneCell.numLab.text = [NSString stringWithFormat:@"%@人已报名",self.campData[indexPath.row].recordNum];
            oneCell.contenLab.text = self.campData[indexPath.row].name;
            
            // 判断是否返回零天
            if ([self.campData[indexPath.row].signStatus isEqualToString:@"cutOff"]) {
                oneCell.countDownLab.text = @"报名已截止";
                oneCell.countDownLab.backgroundColor = [UIColor whiteColor];
                oneCell.countDownLab.textColor = [UIColor colorWithHexString:@"#999999"];
                oneCell.iconImg.image = [UIImage imageNamed:@"end_camp"];
                
            }else if ([self.campData[indexPath.row].cutDays integerValue] <= 7 && [self.campData[indexPath.row].cutDays integerValue] > 0){
                
                oneCell.countDownLab.text = [NSString stringWithFormat:@"报名还剩%@天",self.campData[indexPath.row].cutDays];
                oneCell.countDownLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
                oneCell.countDownLab.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
                oneCell.iconImg.image = [UIImage imageNamed:@"hot_camp"];
                
            }else{
                
                oneCell.countDownLab.text = [NSString stringWithFormat:@"报名截止时间:%@",self.campData[indexPath.row].recordEndDate];
                oneCell.iconImg.image = [UIImage imageNamed:@"hot_camp"];
                oneCell.countDownLab.backgroundColor = [UIColor whiteColor];
                oneCell.countDownLab.textColor = [UIColor colorWithHexString:@"#999999"];
                
            }
        }
        return oneCell;
    }
    
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 170;
        
    }else if (indexPath.section == 1){
        return 50;
        
    }else {
        return 270;
    }
}

// 设置页眉和页脚高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 判断是第几组用section
    if (indexPath.section == 0) {
        
        if (self.campData.count) {
            XiangQingViewController *xqVC = [[XiangQingViewController alloc]init];
            xqVC.ids = self.campData[indexPath.row].titleID;
            xqVC.endStr = self.campData[indexPath.row].signStatus;
            [self.navigationController pushViewController:xqVC animated:YES];
        }
        
    }else if (indexPath.section == 1){
        
        
    }else {
        
        XiangQingViewController *xqVC = [[XiangQingViewController alloc]init];
        xqVC.ids = self.campData[indexPath.row].titleID;
        xqVC.endStr = self.campData[indexPath.row].signStatus;
        [self.navigationController pushViewController:xqVC animated:YES];
        
    }
    
}
-(CampViewModel *)campVM{
    if (!_campVM) {
        _campVM = [[CampViewModel alloc]init];
    }
    return _campVM;
}
-(CampDetailModel *)campDetailM{
    if (!_campDetailM) {
        _campDetailM = [[CampDetailModel alloc]init];
    }
    return _campDetailM;
}

@end
