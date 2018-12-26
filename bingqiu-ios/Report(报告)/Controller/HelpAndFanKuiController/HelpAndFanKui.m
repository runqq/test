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

@interface HelpAndFanKui ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>{
    
}

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

@property(nonatomic,strong)NSMutableArray *array;
@property(nonatomic,strong)NSMutableArray *aryOne;
//@property(nonatomic,strong)NSMutableArray *aryTwo;

//@property(nonatomic,assign)NSInteger *i;




@property(nonatomic,assign) BOOL IsYes;
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
    [self.view addSubview:self.leftTbv];
    [self.view addSubview:self.rightTbv];
    [self.view addSubview:self.bottomV];
    
}

-(void)netWorkRequest{
    
    [self.hlViewModel getHelpListWithSuccess:^(HelpListModel * helpListModel) {
        self.array = [NSMutableArray array];
        self.aryOne = [NSMutableArray array];
//        self.aryTwo = [NSMutableArray array];
        // self.array 用来接收在外层的数组data
        
        self.array= [HelpListDetailModel mj_objectArrayWithKeyValuesArray:helpListModel.data];
        NSLog(@"%@",helpListModel);
        HelpListDetailModel *detailModel = self.array[0];
        // self.aryOne 用来接收helpTypeList所对应的数据
        self.aryOne = [HelpTypeListDetailModel mj_objectArrayWithKeyValuesArray:detailModel.helpTypeList];
        
//        HelpListDetailModel *detailModel1 = self.array[1];
//        // self.aryTwo 用来接收helpTypeList所对应的数据
//        self.aryTwo = [HelpTypeListDetailModel mj_objectArrayWithKeyValuesArray:detailModel1.helpTypeList];
        
        
        // 刷新表格
        [self.leftTbv reloadData];
        [self.rightTbv reloadData];
        
 
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
    }else{
        return 5;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _leftTbv) {
        return 5;
        
    }else{
        if (section == 0) {
            if (self.IsYes) {
              return  self.aryOne.count;
                }
            }
        }
        return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    _leftTbv.rowHeight = 45;
    if (tableView == _leftTbv) {
        LeftTableViewCell *leftCell = [tableView dequeueReusableCellWithIdentifier:@"leftCell"];
        if (!leftCell) {
            leftCell = [[LeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftCell"];
        }
        leftCell.selectionStyle = UITableViewCellSelectionStyleBlue;
        NSArray  *imgArr = @[@"icon_product_heip",@"icon_data_heip",@"icon_program_heip",@"icon_privacy_heip",@"icon_other_help"];
        leftCell.photoImg.image = [UIImage imageNamed:imgArr[indexPath.row]];
        
        HelpListDetailModel *detailModel = self.array[indexPath.row];
        leftCell.titleLab.text = detailModel.helpTypeText;
//        NSLog(@"detail%@",_array);
        [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_down_help"] forState:UIControlStateNormal];
        if (self.IsYes) {
            [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_down_help"] forState:UIControlStateNormal];
        }else{
            [leftCell.arrowsBtn setImage:[UIImage imageNamed:@"arrow_up_help"] forState:UIControlStateNormal];
        }
        return leftCell;
        
    }else{
        
        RightTableViewCell *cell = [RightTableViewCell cellWithTableVIew:tableView];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        HelpTypeListDetailModel *model = self.aryOne[indexPath.row];
        cell.titleLab.text = model.title;
        
        return cell;
        
    }
    
}
// 设置cell的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTbv) {
        
        if (self.IsYes) {
            NSLog(@"%ld",self.i);
            if (indexPath.row == self.i) {
                return  self.aryOne.count*45;
            }
            
        }else{
           return 90;
        }
       
    }else{
        return 45;
    }
    
    
    return 90;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == _leftTbv) {
        self.i = indexPath.row;
        self.IsYes = !self.IsYes;
        
        
        [self.rightTbv reloadData];
        
        [self.leftTbv reloadData];
       
      
    }else{
        [self.rightTbv reloadData];
        
        [self.leftTbv reloadData];
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
