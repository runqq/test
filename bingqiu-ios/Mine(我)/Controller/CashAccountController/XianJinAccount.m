//
//  XianJinAccount.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XianJinAccount.h"
#import "JiLuKongJieMianView.h"
#import "TypeScreenView.h"
#import "JiangXueJinXiangQingController.h"
#import "AccountDetails.h"
#import "LoginViewController.h"

#import "JiangXueJinTableViewCell.h"

#import "XianJinZhangHuDetailModel.h"
#import "XianJinZhangHuViewModel.h"
#import "HuiZongListDetailModel.h"

#import <objc/runtime.h>
char* const buttonKey = "arrow_up_cash";

@interface XianJinAccount ()<UITableViewDelegate,UITableViewDataSource>
{
    int page;
    int size;
    NSNumber *pageNum;
    NSNumber *sizeNum;
    NSString *accountRecordTypeStr;
    UIImageView *jianTouImg;
}
@property(nonatomic,assign) BOOL isOpen; // 用来判断列表是否展开

@property(nonatomic,strong)JiLuKongJieMianView *kongJieMian;
@property(nonatomic,strong)TypeScreenView *typeScreenV;
@property(nonatomic,strong)UILabel  *titLab;
@property(nonatomic,strong)UIButton *rightBut;
@property(nonatomic,strong)UITableView *tbv;;


@property(nonatomic,strong)XianJinZhangHuDetailModel *xjzhDetailModel;
@property(nonatomic,strong)XianJinZhangHuViewModel *xjzhViewModel;
@property(nonatomic,strong)NSMutableArray <XianJinZhangHuDetailModel *>*xjzhData;

@property(nonatomic,strong)HuiZongListDetailModel *huiZongDetailModel;
@property(nonatomic,strong)NSMutableArray <HuiZongListDetailModel *>*huiZongData;

@end

@implementation XianJinAccount

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
    // 赋初始值
    self.isOpen = YES;
    // 导航标题
    self.navigationItem.titleView = self.titLab;
    // 导航条背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 导航右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBut];
    // 背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    
    // 检测网络
    [self ChickStatus];
    
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
    accountRecordTypeStr = @"";
    
    [self getData];
    
}

-(void)getData{
    
    self.xjzhData = [NSMutableArray array];
    [self.xjzhViewModel getXianJinZhangHuWithPageNo:pageNum PageSize:sizeNum accountRecordType:accountRecordTypeStr Success:^(XianJinZhangHuModel * xjzhModel) {
        
        if (xjzhModel.success == 1) {
            for (XianJinZhangHuDetailModel *detailModel in xjzhModel.data) {
                [self.xjzhData addObject:detailModel];
            }
            if (self.xjzhData.count == 0) {
                // 如果没有数据展示
                [self.view addSubview:self.kongJieMian];
                
            }else{
                // 如果有数据将view移除
                [self.kongJieMian removeFromSuperview];
            }
            
            // 停止刷新
            [self.tbv.mj_header endRefreshing];
            
            [self.tbv reloadData];
        }
    } Failture:^(XianJinZhangHuModel * xjzhError) {
        if ([[xjzhError.message substringToIndex:5] isEqualToString:@"未登陆错误"]) {
            [LoginOut OutSuccess:^(TuiChuLoginModel * tuichumm) {
                //登录
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                [self.navigationController pushViewController:loginVC animated:YES];
//                [self presentViewController:loginVC animated:NO completion:nil];
            } Failture:^(TuiChuLoginModel * err_tuichumm) {
                //                    [self.view showErrorText:err_tuichumm.message];
            }];
        }
    }];
}

#pragma mark --> 懒加载
-(JiLuKongJieMianView *)kongJieMian{
    if (!_kongJieMian) {
        _kongJieMian = [[JiLuKongJieMianView alloc]init];
    }
    return _kongJieMian;
}
-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _titLab.text = @"现金账户";
        _titLab.textAlignment = NSTextAlignmentCenter;
        _titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titLab.font = BQBOLDFONT(18);
    }
    return _titLab;
}
-(UIButton *)rightBut{
    if (!_rightBut) {
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
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0 ,NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT) style:UITableViewStyleGrouped];
        // 分割线样式
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        // 设置代理和数据源
        _tbv.delegate=self;
        _tbv.dataSource=self;
        
        // 下拉刷新
        _tbv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self netWorkRequest];
        }];
        
    }
    return _tbv;
}
#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
// 筛选按钮
-(void)rightBtn:(UIButton *)lrightBtn{
    // 默认选中第一行
    NSIndexPath * indexrow = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.typeScreenV.typeScreenTbv selectRowAtIndexPath:indexrow animated:YES scrollPosition:1];
    // 显示筛选试图
    [self.typeScreenV showCustomScreenView:self.view];
    
}
#pragma mark --> 初始化筛选试图
-(TypeScreenView *)typeScreenV{
    if (!_typeScreenV) {
        _typeScreenV = [[TypeScreenView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H)];
        // 确定按钮
        [_typeScreenV.sureBtn addTarget:self action:@selector(queDingBntnClick:) forControlEvents:UIControlEventTouchUpInside];
        // 取消按钮
        [_typeScreenV.cancelBtn addTarget:self action:@selector(quXiaoBntnClick:) forControlEvents:UIControlEventTouchUpInside];
        _typeScreenV.backgroundColor = [UIColor grayColor];
    }
    return _typeScreenV;
}
#pragma mark --> 确定按钮和取消按钮点击事件
-(void)queDingBntnClick:(UIButton *)queDingBtn{
    
    accountRecordTypeStr = self.typeScreenV.typeStr;
    [self getData];
    [self.typeScreenV dissmissCustomScreenView];
}
-(void)quXiaoBntnClick:(UIButton *)quXiaoBtn{
    
    NSIndexPath * indexrow = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.typeScreenV.typeScreenTbv selectRowAtIndexPath:indexrow animated:YES scrollPosition:1];
    [self.typeScreenV dissmissCustomScreenView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.xjzhData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = self.isOpen?self.xjzhData[section].accountRecords.count:0;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        JiangXueJinTableViewCell *twoCell = [JiangXueJinTableViewCell cellWithTableview:tableView];
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
        NSMutableArray *huiZongArr = [HuiZongListDetailModel mj_objectArrayWithKeyValuesArray:self.xjzhData[indexPath.section].accountRecords];
    
        HuiZongListDetailModel *huiZongDetailModel = huiZongArr[indexPath.row];
        // 消费名称
        twoCell.titLab.text = huiZongDetailModel.name;
        // 创建时间
        twoCell.subLab.text = huiZongDetailModel.createTime;
    
        // 金额
        if ([huiZongDetailModel.amountType isEqualToString:@"plus"]) {
            if (huiZongDetailModel.amount.length) {
                twoCell.moneyLab.text = [NSString stringWithFormat:@"+%@",huiZongDetailModel.amount];
                twoCell.moneyLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
            }else{
                twoCell.moneyLab.text = @"0";
                twoCell.moneyLab.textColor = [UIColor colorWithHexString:@"#333333"];
            }
        }else{
            if (huiZongDetailModel.amount.length) {
                twoCell.moneyLab.text = [NSString stringWithFormat:@"-%@",huiZongDetailModel.amount];
                twoCell.moneyLab.textColor = [UIColor colorWithHexString:@"#333333"];
            }else{
                twoCell.moneyLab.text = @"0";
                twoCell.moneyLab.textColor = [UIColor colorWithHexString:@"#333333"];
            }
        }
        return twoCell;
    
}
// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 72;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 72)];
    headView.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    
    UIButton *button = [[UIButton alloc]init];
    [button setFrame:headView.bounds];
    [button setTag:section];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:button];
    
    
    UILabel *dateLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 19, 200, 16)];
    dateLab.text = @"2018年8月";
    dateLab.font = BQBOLDFONT(16);
    dateLab.textColor = [UIColor colorWithHexString:@"#333333"];
    [headView addSubview:dateLab];
    UILabel *zhiChuLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 45, 80, 14)];
    zhiChuLab.text = @"支出¥ 0";
    zhiChuLab.font = BQFONT(14);
    zhiChuLab.textColor = [UIColor colorWithHexString:@"#666666"];
    [headView addSubview:zhiChuLab];
    
    UILabel *chongZhiLab = [[UILabel alloc]initWithFrame:CGRectMake(85, 45, 180, 14)];
    chongZhiLab.text = @"充值¥ 0";
    chongZhiLab.font = BQFONT(14);
    chongZhiLab.textColor = [UIColor colorWithHexString:@"#666666"];
    [headView addSubview:chongZhiLab];
    
    
    jianTouImg = [[UIImageView alloc]initWithFrame:CGRectMake(340, 28, 14, 8)];
    jianTouImg.image = [UIImage imageNamed:@"arrow_down_cash"];
    [headView addSubview:jianTouImg];
    
    if (self.xjzhData.count) {
        // 日期
        dateLab.text = self.xjzhData[section].dateGrouping;
        // 充值
        chongZhiLab.text = [NSString stringWithFormat:@"充值¥ %@",self.xjzhData[section].income];
        
    }
    return headView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

#pragma mark  - select cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *huiZongArr = [HuiZongListDetailModel mj_objectArrayWithKeyValuesArray:self.xjzhData[indexPath.section].accountRecords];
    HuiZongListDetailModel *huiZongDetailModel = huiZongArr[indexPath.row];
    
    // AccountDetails:这个是跳转以后的详情界面
    AccountDetails *accountDetailVC = [[AccountDetails alloc]init];
    UINavigationController *accountDetailNav = [[UINavigationController alloc]initWithRootViewController:accountDetailVC];
    accountDetailVC.strID = huiZongDetailModel.titleID;
    accountDetailVC.titleStr = huiZongDetailModel.name;
    accountDetailVC.accountRecordType = huiZongDetailModel.accountRecordType;

    [self presentViewController:accountDetailNav animated:YES completion:nil];
    
}
- (void)buttonPress:(UIButton *)sender//headButton点击
{
    UIImageView *imageView =  objc_getAssociatedObject(sender,buttonKey);
    if (self.isOpen) {
        [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionTransitionNone animations:^{
            CGAffineTransform currentTransform = imageView.transform;
            CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, -M_PI/2); // 在现在的基础上旋转指定角度
            imageView.transform = newTransform;
        } completion:^(BOOL finished) {
            self->jianTouImg.image = [UIImage imageNamed:@"arrow_up_cash"];
            
        }];
        
    }else{
        [UIView animateWithDuration:0.3 delay:0.0 options: UIViewAnimationOptionAllowUserInteraction |UIViewAnimationOptionCurveLinear animations:^{

            CGAffineTransform currentTransform = imageView.transform;
            CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, M_PI/2); // 在现在的基础上旋转指定角度
            imageView.transform = newTransform;
        } completion:^(BOOL finished) {
            self->jianTouImg.image = [UIImage imageNamed:@"arrow_down_cash"];
        }];
    }
    
    self.isOpen = !self.isOpen;
    [self.tbv reloadSections:[NSIndexSet indexSetWithIndex:sender.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

-(XianJinZhangHuDetailModel *)xjzhDetailModel{
    if (!_xjzhDetailModel) {
        _xjzhDetailModel = [[XianJinZhangHuDetailModel alloc]init];
    }
    return _xjzhDetailModel;
}
-(XianJinZhangHuViewModel *)xjzhViewModel{
    if (!_xjzhViewModel) {
        _xjzhViewModel = [[XianJinZhangHuViewModel alloc]init];
    }
    return _xjzhViewModel;
}

-(HuiZongListDetailModel *)huiZongDetailModel{
    if (!_huiZongDetailModel) {
        _huiZongDetailModel = [[HuiZongListDetailModel alloc]init];
    }
    return _huiZongDetailModel;
}

-(NSMutableArray<HuiZongListDetailModel *> *)huiZongData{
    if (!_huiZongData) {
        _huiZongData = [NSMutableArray array];
    }
    return _huiZongData;
}

@end
