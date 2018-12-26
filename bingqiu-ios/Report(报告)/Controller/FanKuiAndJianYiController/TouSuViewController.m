//
//  TouSuViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/4.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TouSuViewController.h"
#import "FanKuiYuJianYiView.h"
#import "TouSuView.h"
#import "CourseDetailsViewController.h"

#import "TouSuModel.h"
#import "TouSuViewModel.h"

@interface TouSuViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UILabel *navTitleLab;
@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)TouSuView *touSuCell;
@property(nonatomic,strong)NSArray *customArr;
@property(nonatomic,strong)NSArray *typeArr;
@property(nonatomic,strong)UIButton *submitBtn;
@property(assign,nonatomic)NSIndexPath *selIndex; //单选选中的行

@property(nonatomic,strong)TouSuModel *tsModel;
@property(nonatomic,strong)TouSuViewModel *tsViewModel;
@property(nonatomic,strong)NSString *typeStr;

@end

@implementation TouSuViewController
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
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = self.navTitleNav;
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftBtn];
    
    [self.view addSubview:self.tbv];
}

#pragma mark --> 懒加载
-(NSArray *)customArr{
    if (!_customArr) {
        _customArr = [NSArray arrayWithObjects:@"教练建议:  我发现这样做更好",@"场馆故障:  部分设施需要维修养护",@"设备问题:  我的智能设备等",@"其他", nil];
    }
    return _customArr;
}
- (NSArray *)typeArr{
    if (!_typeArr) {
        _typeArr = [NSArray arrayWithObjects:@"COACH_SUGGESTION",@"STADIUMS_FAILURE",@"EQUIPMENT_PROBLEM",@"OTHER", nil];
    }
    return _typeArr;
}
-(UILabel *)navTitleNav{
    if (!_navTitleLab) {
        _navTitleLab = [UILabel new];
        _navTitleLab.text = @"投诉";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}
-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        // 参数的顺序为上,左,下,右
        _leftBtn.contentEdgeInsets = UIEdgeInsetsMake(5, 0, 5, 20);
        [_leftBtn setImage:[UIImage imageNamed:@"nav_back_blue"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(goBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - NAVIGATION_BAR_HEIGHT) style:UITableViewStyleGrouped];
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
-(UIButton *)submitBtn{
    if (!_submitBtn) {
        _submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 0, SCREEN_W-30, 48)];
        _submitBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        [_submitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _submitBtn.layer.masksToBounds = YES;
        _submitBtn.layer.cornerRadius = 5;
        [_submitBtn addTarget:self action:@selector(submitBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}


#pragma mark --> 代理和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.typeArr.count;
        
    }else{
        return 1;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        FanKuiYuJianYiView *suggestCell = [tableView dequeueReusableCellWithIdentifier:@"suggestCell"];
        if (!suggestCell) {
            suggestCell = [[FanKuiYuJianYiView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"suggestCell"];
        }
        if (indexPath.row == 0) {
            suggestCell.rightBtn.selected = YES;
            _selIndex = indexPath ;
        }
        suggestCell.rightBtn.tag = indexPath.row;
        // 添加内容
        suggestCell.titleLab.text = self.customArr[indexPath.row];
        suggestCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return suggestCell;
        
    }else if (indexPath.section == 1){
        
        _touSuCell = [tableView dequeueReusableCellWithIdentifier:@"touSuCell"];
        if (!_touSuCell) {
            _touSuCell = [[TouSuView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"touSuCell"];
        }
        return _touSuCell;
        
    }else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        // 将按钮添加到表格上
        [cell addSubview:self.submitBtn];
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 45;
    }else if (indexPath.section == 1){
        return 150;
    }else{
        return 48;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView  *bgvv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 45)];
    UILabel *headStr = [[UILabel alloc]initWithFrame:CGRectMake(15, 21, 200, 14)];
    [bgvv addSubview:headStr];
    
    if (section == 0) {
        headStr.text = @"我要投诉";
        headStr.textColor = [UIColor colorWithHexString:@"#333333"];
        headStr.font = BQFONT(14);
        return bgvv;
        
    }else if (section == 1){
        headStr.text = @"请详细描述问题或建议";
        headStr.textColor = [UIColor colorWithHexString:@"#333333"];
        headStr.font = BQFONT(14);
        return bgvv;
    }
    else
    {
        return [UIView new];
    }
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

#pragma mark --> 点击事件
// 返回按钮
-(void)goBackBtn:(UIButton *)backBtn{
    //    [self.navigationController popViewControllerAnimated:NO];
    [self dismissViewControllerAnimated:NO completion:nil];
}
// 提交按钮
-(void)submitBtnClick:(UIButton *)submitBtn{
    
    if (!self.touSuCell.textV.text.length) {
        [SVProgressHUD showErrorText:@"请输入你的投诉内容"];
        [SVProgressHUD dismissWithDelay:1.0];
        return ;
    }
    [self.tsViewModel getTouSuWithCourseId:self.skID TouSuType:self.typeStr TouSuContent:_touSuCell.textV.text Success:^(TouSuModel * tsModel) {
        if (tsModel.success) {
            [SVProgressHUD showSuccessText:@"操作成功!"];
            [SVProgressHUD dismissWithDelay:1.0];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    } Failture:^(TouSuModel *  tsError) {
//        [self showErrorText:self.tsModel.message];
    }];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FanKuiYuJianYiView *celled = [tableView cellForRowAtIndexPath:indexPath];
    [celled.rightBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_select"] forState:UIControlStateNormal];
    // 将选中的类型传递出去
    self.typeStr = self.typeArr[indexPath.row];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    FanKuiYuJianYiView *celled = [tableView cellForRowAtIndexPath:indexPath];
    [celled.rightBtn setImage:[UIImage imageNamed:@"icon_datewindow_state_regular"] forState:UIControlStateNormal];
}

-(TouSuModel *)tsModel{
    if (!_tsModel) {
        _tsModel = [[TouSuModel alloc]init];
    }
    return _tsModel;
}
-(TouSuViewModel *)tsViewModel{
    if (!_tsViewModel) {
        _tsViewModel = [[TouSuViewModel alloc]init];
    }
    return _tsViewModel;
}

@end
