//
//  HelpAndFanKui.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/5.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "HelpAndFanKui.h"
#import "TopView.h"
#import "BottomView.h"
#import "FanKuiYuJianYi.h"

#import "LeftTableViewCell.h"
#import "RightTableViewCell.h"

#import "HelpListDetailModel.h"
#import "HelpListViewModel.h"
#import "HelpTypeListDetailModel.h"

@interface HelpAndFanKui ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>

@property(nonatomic,strong)UILabel *navTitleLab;
@property(nonatomic,strong)UIButton *leftBtn;

@property(nonatomic,strong)TopView *topV;
@property(nonatomic,assign)NSInteger *i;
@property(nonatomic,strong)LeftTableViewCell *leftCell;
@property(nonatomic,strong)UITableView *leftTbv;
@property(nonatomic,strong)UITableView *rightTbv;
@property(nonatomic,strong)BottomView *bottomV;

@property(nonatomic,strong)HelpListDetailModel *hlDetailModel;
@property(nonatomic,strong)HelpListViewModel *hlViewModel;
@property(nonatomic,strong)NSMutableArray <HelpListDetailModel *>*hlData;
@property(nonatomic,strong)HelpTypeListDetailModel *helpTypeListDetailModel;

@property(nonatomic,strong)NSMutableArray *helpTypeListArr1;
@property(nonatomic,strong)NSMutableArray *helpTypeListArr2;
@property(nonatomic,strong)NSMutableArray *helpTypeListArr3;
@property(nonatomic,strong)NSMutableArray *helpTypeListArr4;
@property(nonatomic,strong)NSMutableArray *helpTypeListArr5;

@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *aryOne;

@property(nonatomic,assign) BOOL isOpen;
@property(nonatomic,assign) BOOL isFir;
@property(nonatomic,assign) BOOL isSec;
@property(nonatomic,assign) BOOL isThir;
@property(nonatomic,assign) BOOL isFour;
@property(nonatomic,assign) BOOL isFifth;

@property(nonatomic,copy)HMPublicValueChanged shujuWenTi;

@end

@implementation HelpAndFanKui

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
    
    self.isOpen = NO;
    
    // 视图背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    // 导航栏标题
    self.navigationItem.titleView = self.navTitleNav;
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.leftBtn];
    
    // 网络请求
    [self netWorkRequest];
    
    [self.view addSubview:self.topV];
    [self.view addSubview:self.leftTbv];
    [self.view addSubview:self.rightTbv];
    [self.view addSubview:self.bottomV];
    
}

-(void)netWorkRequest{
    self.hlData = [NSMutableArray array];
    [self.hlViewModel getHelpListWithSuccess:^(HelpListModel * helpListModel) {
        if (helpListModel.success) {
            for (HelpListDetailModel *detailModel in helpListModel.data) {
                [self.hlData addObject:detailModel];
            }
            HelpListDetailModel *helpListDetailModel;
            self.helpTypeListArr1 = [NSMutableArray array];
            self.helpTypeListArr2 = [NSMutableArray array];
            self.helpTypeListArr3 = [NSMutableArray array];
            self.helpTypeListArr4 = [NSMutableArray array];
            self.helpTypeListArr5 = [NSMutableArray array];
            if (self.hlData.count) {
                
                helpListDetailModel = self.hlData[0];
                for (HelpTypeListDetailModel *typeListDetail in helpListDetailModel.helpTypeList) {
                    [self.helpTypeListArr1 addObject:typeListDetail];
                }
                
                helpListDetailModel = self.hlData[1];
                for (HelpTypeListDetailModel *typeListDetail1 in helpListDetailModel.helpTypeList) {
                    [self.helpTypeListArr2 addObject:typeListDetail1];
                }
                
                helpListDetailModel = self.hlData[2];
                for (HelpTypeListDetailModel *typeListDetail in helpListDetailModel.helpTypeList) {
                    [self.helpTypeListArr3 addObject:typeListDetail];
                }
                
                helpListDetailModel = self.hlData[3];
                for (HelpTypeListDetailModel *typeListDetail in helpListDetailModel.helpTypeList) {
                    [self.helpTypeListArr4 addObject:typeListDetail];
                }
                helpListDetailModel = self.hlData[4];
                for (HelpTypeListDetailModel *typeListDetail in helpListDetailModel.helpTypeList) {
                    [self.helpTypeListArr5 addObject:typeListDetail];
                }
                
            }
            
            [self.leftTbv reloadData];
            [self.rightTbv reloadData];
        }
 
    } Failture:^(HelpListModel * helpListError) {
        
    }];
    
}
#pragma mark --> 懒加载
-(UILabel *)navTitleNav{
    if (!_navTitleLab) {
        _navTitleLab = [UILabel new];
        _navTitleLab.text = @"帮助与反馈";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}
-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setImage:[UIImage imageNamed:@"nav_back_blue"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(goBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

-(TopView *)topV{
    if (!_topV) {
        _topV = [[TopView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, 55)];
    }
    return _topV;
}
-(UITableView *)leftTbv{
    if (!_leftTbv) {
        // 初始化表格
        _leftTbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT + self.topV.frame.size.height + 10, 94, SCREEN_H-75) style:UITableViewStylePlain];
        // 取消弹簧效果
//        _leftTbv.bounces = NO;
        // 设置tbv的背景颜色
        _leftTbv.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        // 分割线样式
        _leftTbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _rightTbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        _leftTbv.delegate = self;
        _leftTbv.dataSource = self;
        
    }
    return _leftTbv;
}

-(UITableView *)rightTbv{
    if (!_rightTbv) {
        // 初始化表格
        _rightTbv = [[UITableView alloc]initWithFrame:CGRectMake(95, NAVIGATION_BAR_HEIGHT + self.topV.frame.size.height + 10, SCREEN_W-95, SCREEN_H - 75) style:UITableViewStyleGrouped];
        // 取消弹簧效果
//        _rightTbv.bounces = NO;
        // 设置tbv的背景颜色
        _rightTbv.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        // 分割线样式
        _rightTbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _rightTbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        // 设置代理和数据源
        _rightTbv.delegate = self;
        _rightTbv.dataSource = self;
        
    }
    return _rightTbv;
}

-(BottomView *)bottomV{
    if (!_bottomV) {
        _bottomV = [[BottomView alloc]initWithFrame:CGRectMake(0, SCREEN_H-75, SCREEN_W, 75)];
        [_bottomV.serviceBtn addTarget:self action:@selector(serviceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomV.suggestBtn addTarget:self action:@selector(suggestBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomV;
}

#pragma mark --> 代理和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == _leftTbv) {
        return 1;
    }
    return self.hlData.count;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _leftTbv) {
        return self.hlData.count;
        
    }else{
        
        if (section == 0) {
            if (self.isFir) {
                return _helpTypeListArr1.count;
            }
        }else if (section == 1){
            if (self.isSec) {
                return _helpTypeListArr2.count;
            }
        }else if (section == 2){
            if (self.isThir) {
                return _helpTypeListArr3.count;
            }
        }else if (section == 3){
            if (self.isFour) {
                return _helpTypeListArr4.count;
            }
            
        }else if (section == 4){
            if (self.isFifth) {
                return _helpTypeListArr5.count;
            }
        }
          return 2;
    }
  
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _leftTbv) {
        LeftTableViewCell *leftCell = [tableView dequeueReusableCellWithIdentifier:@"leftCell"];
        if (!leftCell) {
            leftCell = [[LeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftCell"];
        }
        leftCell.selectionStyle = UITableViewCellSelectionStyleBlue;
        NSArray  *imgArr = @[@"icon_product_heip",@"icon_data_heip",@"icon_program_heip",@"icon_privacy_heip",@"icon_other_help"];
        leftCell.photoImg.image = [UIImage imageNamed:imgArr[indexPath.row]];
        
        leftCell.titleLab.text = self.hlData[indexPath.row].helpTypeText;
        [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_down_help"] forState:UIControlStateNormal];
        
        if (indexPath.row == 0) {
            if (self.isFir) {
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_up_help"] forState:UIControlStateNormal];
            }else{
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_down_help"] forState:UIControlStateNormal];
            }
        }else if (indexPath.row == 1){
            if (self.isSec) {
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_up_help"] forState:UIControlStateNormal];
            }else{
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_down_help"] forState:UIControlStateNormal];
            }
        }else if (indexPath.row == 2){
            if (self.isThir) {
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_up_help"] forState:UIControlStateNormal];
            }else{
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_down_help"] forState:UIControlStateNormal];
            }
        }else if (indexPath.row == 3){
            if (self.isFour) {
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_up_help"] forState:UIControlStateNormal];
            }else{
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_down_help"] forState:UIControlStateNormal];
            }
        }else if (indexPath.row == 4){
            if (self.isFifth) {
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_up_help"] forState:UIControlStateNormal];
            }else{
                [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_down_help"] forState:UIControlStateNormal];
            }
        }
        return leftCell;
        
    }else{
        
        RightTableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:@"rightCell"];
        if (!rightCell) {
            rightCell = [[RightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rightCell"];
        }
        rightCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (indexPath.section == 0) {
            rightCell.titleLab.text = [_helpTypeListArr1[indexPath.row] objectForKey:@"title"];
            
        }else if (indexPath.section == 1){
            rightCell.titleLab.text = [_helpTypeListArr2[indexPath.row] objectForKey:@"title"];
            
        }else if (indexPath.section == 2){
            rightCell.titleLab.text = [_helpTypeListArr3[indexPath.row] objectForKey:@"title"];
            
        }else if (indexPath.section == 3){
            rightCell.titleLab.text = [_helpTypeListArr4[indexPath.row] objectForKey:@"title"];
            
        }else{
            rightCell.titleLab.text = [_helpTypeListArr5[indexPath.row] objectForKey:@"title"];
        }
        
        return rightCell;
        
    }
    
}
// 设置cell的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _leftTbv) {
        if (indexPath.row == 0) {
            if (self.isFir) {
                return _helpTypeListArr1.count * 45;
            }else{
                
                return 90;
            }
        }else if (indexPath.row == 1){
            if (self.isSec) {
                return _helpTypeListArr2.count * 45;
            }else{
                return 90;
            }
        }else if (indexPath.row == 2){
            if (self.isThir) {
                return _helpTypeListArr3.count * 45;
            }else{
                
                return 90;
            }
        }else if (indexPath.row == 3){
            if (self.isFour) {
                return _helpTypeListArr4.count * 45;
            }else{
                
                return 90;
            }
        }else if (indexPath.row == 4){
            if (self.isFifth) {
                return _helpTypeListArr5.count * 45;
            }else{
                return 90;
            }
        }
    }
        return 45;
}
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _leftTbv) {
        
        if (indexPath.row == 0) {
            self.isFir = !self.isFir;
        }else if (indexPath.row == 1){
            self.isSec = !self.isSec;
        } else if  (indexPath.row == 2){
            self.isThir = !self.isThir;
            
        }else if (indexPath.row == 3){
            self.isFour = !self.isFour;
      
        }else if (indexPath.row == 4){
            self.isFifth = !self.isFifth;
          
        }
    }
    
    [self.leftTbv reloadData];
    [self.rightTbv reloadData];
    
    if (tableView == _rightTbv) {
        
    }
    
}

#pragma mark --> 点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self dismissViewControllerAnimated:NO completion:nil];
}
-(void)serviceBtnClick:(UIButton *)keFuBtn{
    
    NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", @"400-600-8928"];
    if (@available(iOS 10.0, *)) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone] options:@{} completionHandler:nil];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
    }
    
}
-(void)suggestBtnClick:(UIButton *)fanKuiYuYiJianBtn{
    FanKuiYuJianYi *jianYiVC = [[FanKuiYuJianYi alloc]init];
    UINavigationController *jianYiNav = [[UINavigationController alloc]initWithRootViewController:jianYiVC];
    [self presentViewController:jianYiNav animated:NO completion:nil];
}


-(HelpListViewModel *)hlViewModel{
    if (!_hlViewModel) {
        _hlViewModel = [[HelpListViewModel alloc]init];
    }
    return _hlViewModel;
}
-(HelpListDetailModel *)hlDetailModel{
    if (!_hlDetailModel) {
        _hlDetailModel = [[HelpListDetailModel alloc]init];
    }
    return _hlDetailModel;
}
-(NSMutableArray *)hlData{
    if (!_hlData) {
        _hlData = [NSMutableArray array];
    }
    return _hlData;
}
-(HelpTypeListDetailModel *)helpTypeListDetailModel{
    if (!_helpTypeListDetailModel) {
        _helpTypeListDetailModel = [[HelpTypeListDetailModel alloc]init];
    }
    return _helpTypeListDetailModel;
}

@end
