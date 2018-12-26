//
//  XingQiuViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "XingQiuViewController.h"
#import "XingQiuView.h"
#import "XingQiuTableViewCell.h"

#import "ChengWeiXingQiuVIPViewController.h"

#import "DingDanDetailList.h"
#import "DingDanListViewModel.h"

@interface XingQiuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)XingQiuView *xqView;
@property(nonatomic,strong)UILabel *navTitleLab;
@property(nonatomic,strong)UITableView *tbv;

@property(nonatomic,strong)DingDanDetailList *dingDanDetailList;
@property(nonatomic,strong)DingDanListViewModel *dingDanListViewModel;
@property(nonatomic,strong)NSMutableArray <DingDanDetailList *>*dingDanListArr;

@end

@implementation XingQiuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航标题
    self.navigationItem.titleView = self.navTitleLab;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    
    // 网络解析
    [self netWorkRequest];
    
    [self.view addSubview:self.tbv];
    
}
-(void)netWorkRequest{
    
    _dingDanListArr = [NSMutableArray array];
    [self.dingDanListViewModel getDingDanListDataSuccess:^(DingDanList * dingDanListModel) {
        
        if (dingDanListModel.success) {
            
            for (DingDanDetailList *detailModel in dingDanListModel.data) {
                [self->_dingDanListArr addObject:detailModel];
            }
            [self.tbv reloadData];
        }
        
    } Failture:^(DingDanList * dingDanListError) {
        
    }];
    
}

#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark --> 懒加载
-(UILabel *)navTitleLab{
    if (!_navTitleLab) {
        // 导航标题
        _navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _navTitleLab.text = @"星球VIP";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT) style:UITableViewStyleGrouped];
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
#pragma mark --> 代理和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return _dingDanListArr.count;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.xqView = [[XingQiuView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 60)];
        [cell.contentView addSubview:self.xqView];
        
        return cell;
        
    }else{
        
        XingQiuTableViewCell *xqCell = [tableView dequeueReusableCellWithIdentifier:@"xqCell"];
        if (!xqCell) {
            xqCell = [[XingQiuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xqCell"];
        }
        xqCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if ([_dingDanListArr[indexPath.row].usageState isEqualToString:@"USING"]) {
            xqCell.bImg.image = [UIImage imageNamed:@"bg_use_xingqiuvip"];
            
        }else if ([_dingDanListArr[indexPath.row].usageState isEqualToString:@"NOT_START"]){
            
            xqCell.bImg.image = [UIImage imageNamed:@"bg_not_xingqiuvip"];
        }else{
            xqCell.bImg.image = [UIImage imageNamed:@"bg_expire_xingqiuvip"];
        }
        
        if (_dingDanListArr.count) {
            xqCell.nameLab.text = _dingDanListArr[indexPath.row].memberName;
            xqCell.monthLab.text = _dingDanListArr[indexPath.row].productName;
            xqCell.timeLab.text = [NSString stringWithFormat:@"使用时间: %@到%@",_dingDanListArr[indexPath.row].startDate,_dingDanListArr[indexPath.row].endDate];
        }
        
        return xqCell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }else{
        return 178;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1) {
        return 20;
    }
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        ChengWeiXingQiuVIPViewController *xuFeiVC = [[ChengWeiXingQiuVIPViewController alloc]init];
        xuFeiVC.navigationItem.title = @"续费";
        UINavigationController *xuFeiNav = [[UINavigationController alloc]initWithRootViewController:xuFeiVC];
        [self presentViewController:xuFeiNav animated:YES completion:nil];
        
    }else{
        
        [SVProgressHUD showErrorText:@"您点击了第二行"];
        
    }
}

-(DingDanDetailList *)dingDanDetailList{
    if (!_dingDanDetailList) {
        _dingDanDetailList = [[DingDanDetailList alloc]init];
    }
    return _dingDanDetailList;
}
-(DingDanListViewModel *)dingDanListViewModel{
    if (!_dingDanListViewModel) {
        _dingDanListViewModel = [[DingDanListViewModel alloc]init];
    }
    return _dingDanListViewModel;
    
}

@end
