//
//  SetViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "SetViewController.h"
#import "ChangeStuViewController.h"
#import "ResetPasswordController.h"
#import "ChongZhiMiMaViewController.h"
#import "MessageViewController.h"
#import "AboutUsViewController.h"
#import "HelpAndFanKui.h"

#import "BanBeBiJiaoModel.h"
#import "BanBenBiJiaoDetailModel.h"
#import "BanBenBiJiaoViewModel.h"

#import "TuiChuLoginModel.h"
#import "TuiChuLoginViewModel.h"
#import "LoginViewController.h"
#import "RootViewController.h"
#import "MineViewController.h"

@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)NSArray *oneArr,*twoArr;

@property(nonatomic,strong)BanBeBiJiaoModel *versionModel;
@property(nonatomic,strong)BanBenBiJiaoDetailModel *versionDetailModel;
@property(nonatomic,strong)BanBenBiJiaoViewModel *versionViewModel;

@property(nonatomic,strong)TuiChuLoginModel *logOutModel;
@property(nonatomic,strong)TuiChuLoginViewModel *logOutViewModel;

@end

@implementation SetViewController

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
    titLab.text = @"设置";
    // 字体居中
    titLab.textAlignment = NSTextAlignmentCenter;
    titLab.textColor = [UIColor colorWithHexString:@"#333333"];
    titLab.font = BQBOLDFONT(18);
    self.navigationItem.titleView = titLab;
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 添加到视图
    [self.view addSubview:self.tbv];
    
}

#pragma mark --> backBtn
-(void)goBackBtn:(UIButton *)backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --> 懒加载
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT) style:UITableViewStyleGrouped];
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        
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
-(NSArray *)oneArr{
    if (!_oneArr) {
        _oneArr = [NSArray arrayWithObjects:@"切换学员",@"重置密码", nil];
    }
    return _oneArr;
}
-(NSArray *)twoArr{
    if (!_twoArr) {
        _twoArr = [NSArray arrayWithObjects:@"支持我们",@"帮助与反馈",@"关于我们",@"当前版本号", nil];
    }
    return _twoArr;
}

#pragma mark --> UITableViewDelegate And UITableViewDataSource
// 几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
// 几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.oneArr.count;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return self.twoArr.count;
    }else{
        return 1;
    }
}
// 设置cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"oneCell"];
    if (!oneCell) {
        oneCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"oneCell"];
    }
    oneCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0) {
        oneCell.textLabel.text = _oneArr[indexPath.row];
        oneCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else if (indexPath.section == 1){
        oneCell.textLabel.text = @"消息中心";
        oneCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }else if (indexPath.section == 2){
        
        oneCell.textLabel.text = _twoArr[indexPath.row];
        
        if (indexPath.row == 3) {
            
            oneCell.detailTextLabel.text = @"V1.7.1";
            oneCell.accessoryType = UITableViewCellAccessoryNone;
            
        }else{
            oneCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
    }else{
            
        UITableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
        if (!customCell) {
            customCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customCell"];
        }
        customCell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *customLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 50)];
        customLab.text = @"退出当前帐户";
        customLab.textColor = [UIColor colorWithHexString:@"#333333"];
        customLab.font = BQBOLDFONT(16);
        customLab.textAlignment = NSTextAlignmentCenter;
        [customCell.contentView addSubview:customLab];
        
        return customCell;
    }
    
    return oneCell;
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

// 页眉高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
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

// 点击cell跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            ChangeStuViewController *changeStuVC = [[ChangeStuViewController alloc]init];
            changeStuVC.memId = self.memId;
            [self.navigationController pushViewController:changeStuVC animated:YES];
//            UINavigationController *changeStuNav = [[UINavigationController alloc]initWithRootViewController:changeStuVC];
//            [self presentViewController:changeStuNav animated:NO completion:nil];
            
        }else{
            
            ChongZhiMiMaViewController *chongZhiMiMaVC = [[ChongZhiMiMaViewController alloc]init];
            UINavigationController *chongZhiMiMaNav = [[UINavigationController alloc]initWithRootViewController:chongZhiMiMaVC];
            [self presentViewController:chongZhiMiMaNav animated:NO completion:nil];
            
        }
    }else if (indexPath.section == 1){
        
        MessageViewController *messageVC = [[MessageViewController alloc]init];
        UINavigationController *messageNav = [[UINavigationController alloc]initWithRootViewController:messageVC];
        [self presentViewController:messageNav animated:NO completion:nil];
        
        
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            [SVProgressHUD showErrorText:@"此功能尚未开通"];
            [SVProgressHUD dismissWithDelay:0.5];
            
        }else if (indexPath.row == 1){
//            BQLog(@"您点击了帮助与反馈这一行");
            HelpAndFanKui *fanKuiVC = [[HelpAndFanKui alloc]init];
            UINavigationController *fanKuiNav = [[UINavigationController alloc]initWithRootViewController:fanKuiVC];
            [self presentViewController:fanKuiNav animated:NO completion:nil];
            
        }else if (indexPath.row == 2){
            AboutUsViewController *aboutUsVC = [[AboutUsViewController alloc]init];
            UINavigationController *aboutUsNav = [[UINavigationController alloc]initWithRootViewController:aboutUsVC];
            [self presentViewController:aboutUsNav animated:NO completion:nil];
            
        }else{
            BQLog(@"您点击了当前版本号这一行");
//            [self.versionViewModel getBanBenBiJiaoWithVersion:1 Success:^(BanBeBiJiaoModel * _Nonnull banBenModel) {
//            } Failture:^(BanBeBiJiaoModel * _Nonnull banBenError) {
//            }];
        }
    }else{
        
        [LoginOut OutSuccess:^(TuiChuLoginModel *  tuichumm) {
            if (tuichumm.success) {
                [User_Default setValue:@"" forKey:@"mysession"];
                [SVProgressHUD showSuccessText:@"退出成功"];
                [SVProgressHUD dismissWithDelay:1.25];
                [self.navigationController popViewControllerAnimated:YES];
                
            }else{
                // 失败
                [self showErrorText:tuichumm.message];
            }
        } Failture:^(TuiChuLoginModel *  err_tuichumm) {
            
        }];
    }
}

-(BanBeBiJiaoModel *)versionModel{
    if (!_versionModel) {
        _versionModel = [[BanBeBiJiaoModel alloc]init];
    }
    return _versionModel;
}
-(BanBenBiJiaoDetailModel *)versionDetailModel{
    if (!_versionDetailModel) {
        _versionDetailModel = [[BanBenBiJiaoDetailModel alloc]init];
    }
    return _versionDetailModel;
}
-(BanBenBiJiaoViewModel *)versionViewModel{
    if (!_versionViewModel) {
        _versionViewModel = [[BanBenBiJiaoViewModel alloc]init];
    }
    return _versionViewModel;
}

-(TuiChuLoginModel *)logOutModel{
    if (!_logOutModel) {
        _logOutModel = [[TuiChuLoginModel alloc]init];
    }
    return _logOutModel;
}
-(TuiChuLoginViewModel *)logOutViewModel{
    if (!_logOutViewModel) {
        _logOutViewModel = [[TuiChuLoginViewModel alloc]init];
    }
    return _logOutViewModel;
}

@end
