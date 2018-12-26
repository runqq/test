//
//  MineViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#define Start_X 0.0f               // 距离X轴的距离
#define Start_Y 0.0f             // 距离Y轴的距离
#define Width_Space 0.0f           // 横间距
#define Height_Space     0.0f     // 竖间距
#define View_Height   83.0f        // 控件的高


#import "MineViewController.h"
#import "MineTwoTableViewCell.h"
#import "MineThreeTableViewCell.h"
#import "HeadView.h"
#import "ChangeStuController/ChangeStuViewController.h"
#import "StuInformationController/StuInforController.h"
#import "SetController/SetViewController.h"
#import "GouKaController/RecordViewController.h"
#import "ClassRecordController/ClassRecord.h"
#import "XianJinAccount.h"
#import "JiangXueJinController.h"
#import "LoginViewController.h"
#import "XingQiuVIPView.h"

#import "PaySuccessViewController.h"
#import "ChengWeiXingQiuVIPViewController.h"
#import "XingQiuViewController.h"

#import "CustomView.h" // 网格

#import "MyHomepageModel.h"
#import "MyHomePageDetailModel.h"
#import "MyHomePageViewModel.h"

#import "BQSmallCardViewModel.h"
#import "BQSmallCardDetailModel.h"


@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *leftBtn;
    UILabel *navTitleLab;
    UIButton *rightBtn;
}

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)HeadView *headV;

@property(nonatomic,strong)CustomView *customV; // 定义属性
@property(nonatomic,strong)XingQiuVIPView *xqView;

@property(nonatomic,strong)MineTwoTableViewCell *cashReserveCell;
@property(nonatomic,strong)MineThreeTableViewCell *jiangXueJinCell;
@property(nonatomic,strong)MineThreeTableViewCell *xinYongEDuCell;
@property(nonatomic,strong)MineTwoTableViewCell *youHuiZhengCeCell;
@property(nonatomic,strong)MineThreeTableViewCell *bingQiuDaKeKaCell;

@property(nonatomic,strong)MyHomepageModel *myHomePageModel;
@property(nonatomic,strong)MyHomePageDetailModel *myHomePageDetailModel;
@property(nonatomic,strong)MyHomePageViewModel *myHomePageViewModel;

@property(nonatomic,strong)BQSmallCardViewModel *bqViewModel;
@property(nonatomic,strong)BQSmallCardDetailModel *bqDetailModel;
@property(nonatomic,strong)NSMutableArray <BQSmallCardDetailModel *>*data;


@end

@implementation MineViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 即将显示 隐藏导航条
//    self.navigationController.navigationBar.hidden = YES;
//    [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[kColorRGB(0, 166, 228)  colorWithAlphaComponent:0] ] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.translucent = YES;
    
    if ([User_Default objectForKey:@"myjsession"]) {
        [self netWorkRequest];
        
    }else{
        
        self.headV.headImg.image = [UIImage imageNamed:@"photo_tourist_nor"];
        self.headV.nameLab.text = @"未登录";
        self.headV.textF.text = @" 游客";
        self.headV.huangGuanImg.image = [UIImage imageNamed:@"vip_my_icon_tourist"];
        
        [self.tbv reloadData];
  
    }
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 即将消失的时候显示导航条
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // tabbar不隐藏
    self.tabBarController.tabBar.hidden = NO;
    // 防止导航栏下移
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 左侧按钮
    leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [leftBtn setImage:[UIImage imageNamed:@"nav_install_icon_white"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    // 导航标题
    navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
    navTitleLab.text = @"我";
    navTitleLab.textAlignment = NSTextAlignmentCenter;
    navTitleLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
    navTitleLab.font = BQBOLDFONT(18);
    self.navigationItem.titleView = navTitleLab;
    // 右侧按钮
    rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 10)];
    [rightBtn setTitle:@"切换学员" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
    rightBtn.titleLabel.font = BQFONT(16);
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    //给导航条设置一个空的背景图 使其透明化
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去除导航条透明后导航条下的黑线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    // 网络检测
    [self ChickStatus];
    
    // 添加到视图
    [self.view addSubview:self.tbv];
    
    // 蒙层
    [self.headV.coverBtn addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
//-(UIImage *)imageWithBgColor:(UIColor *)color
//{
//    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
//}
//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat dis = scrollView.contentOffset.y;
//    if(dis > NAVIGATION_BAR_HEIGHT){
//        [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[kColorRGB(255, 255, 255)  colorWithAlphaComponent:dis/NAVIGATION_BAR_HEIGHT] ] forBarMetrics:UIBarMetricsDefault];
//        //                                      translucent:透明的,半透明的
//        self.navigationController.navigationBar.translucent = NO;
//
//        [leftBtn setImage:[UIImage imageNamed:@"nav_install_icon_gray"] forState:UIControlStateNormal];
//        navTitleLab.textColor = [UIColor grayColor];
//        [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//
//
//    }
//    if(dis < NAVIGATION_BAR_HEIGHT)
//    {
//        [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[kColorRGB(255, 255, 255)  colorWithAlphaComponent:dis/NAVIGATION_BAR_HEIGHT]] forBarMetrics:UIBarMetricsDefault];
//        self.navigationController.navigationBar.translucent = YES;
//        [leftBtn setImage:[UIImage imageNamed:@"nav_install_icon_white"] forState:UIControlStateNormal];
//        navTitleLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
//        [rightBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
//    }
//}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat reOffset = scrollView.contentOffset.y + (SCREEN_H - 64) * 0.2;
    CGFloat alpha = reOffset / ((SCREEN_H - 64) * 0.2);
    if (alpha <= 1)//下拉永不显示导航栏
    {
        alpha = 0;
                [leftBtn setImage:[UIImage imageNamed:@"nav_install_icon_white"] forState:UIControlStateNormal];
                navTitleLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
                [rightBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        
    }
    else//上划前一个导航栏的长度是渐变的
    {
        alpha -= 1;
                [leftBtn setImage:[UIImage imageNamed:@"nav_install_icon_gray"] forState:UIControlStateNormal];
                navTitleLab.textColor = [UIColor grayColor];
                [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    // 设置导航条的背景图片 其透明度随  alpha 值 而改变
    UIImage *image = [self imageWithColor:[UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

}
/// 使用颜色填充图片
- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return theImage;
}

-(void)ChickStatus{
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        if (status != RealStatusNotReachable) {
            if ([User_Default objectForKey:@"myjsession"]) {
                // 网络请求
                [self netWorkRequest];
            }else{
                [self.tbv reloadData];
            }
        }else{
            
            [SVProgressHUD showErrorText:@"网络不给力"];
            [SVProgressHUD dismissWithDelay:0.5];
        }
    }];
}

-(void)netWorkRequest{
    
    [self.myHomePageViewModel getMyHomePageSuccess:^(MyHomepageModel * myHomePageModel) {
        // 结束刷新
        [self.tbv.mj_header endRefreshing];
        
        if (myHomePageModel.success) {
            
            self.myHomePageDetailModel.photo                = myHomePageModel.data[@"photo"];
            self.myHomePageDetailModel.creditLimitUsed      = [myHomePageModel.data[@"creditLimitUsed"] doubleValue];
            self.myHomePageDetailModel.membershipCatfegory   = myHomePageModel.data[@"membershipCategory"];
            self.myHomePageDetailModel.creditLimitSurplus   = [myHomePageModel.data[@"creditLimitSurplus"] doubleValue];
            self.myHomePageDetailModel.favouredPolicy       = myHomePageModel.data[@"favouredPolicy"];
            self.myHomePageDetailModel.scholarshipUsed      = [myHomePageModel.data[@"scholarshipUsed"] doubleValue];
            self.myHomePageDetailModel.cashBalance          = [myHomePageModel.data[@"cashBalance"] doubleValue];
            self.myHomePageDetailModel.scholarshipSurplus   = [myHomePageModel.data[@"scholarshipSurplus"] doubleValue];
            self.myHomePageDetailModel.name                 = myHomePageModel.data[@"name"];
            self.myHomePageDetailModel.scholarshipSum       = [myHomePageModel.data[@"scholarshipSum"] doubleValue];
            self.myHomePageDetailModel.titlID               = myHomePageModel.data[@"id"];
            self.myHomePageDetailModel.creditLimitTotal     = [myHomePageModel.data[@"creditLimitTotal"] doubleValue];
            self.myHomePageDetailModel.membershipCategoryText = myHomePageModel.data[@"membershipCategoryText"];
            self.myHomePageDetailModel.gender               = myHomePageModel.data[@"gender"];
            self.myHomePageDetailModel.vipEndDate           = myHomePageModel.data[@"vipEndDate"];
            
            // 用户头像
            if ([self.myHomePageDetailModel.gender isEqualToString:@"MALE"]) {
                NSString *photoStr = self.myHomePageDetailModel.photo;
                [self.headV.headImg sd_setImageWithURL:[NSURL URLWithString:photoStr] placeholderImage:[UIImage imageNamed:@"photo_man_nor"]];
            }else{
                NSString *photoStr = self.myHomePageDetailModel.photo;
                [self.headV.headImg sd_setImageWithURL:[NSURL URLWithString:photoStr] placeholderImage:[UIImage imageNamed:@"photo_woman_nor"]];
            }
            // 用户姓名
            self.headV.nameLab.text = self.myHomePageDetailModel.name;
            // 是否是会员
            NSString *btnStr = [NSString stringWithFormat:@" %@",self.myHomePageDetailModel.membershipCategoryText];
//            [self.headV.bgBtn setTitle:btnStr forState:UIControlStateNormal];
            self.headV.textF.text = btnStr;
//            [self.headV.bgBtn setImage:[UIImage imageNamed:@"vip_my_icon_nor"] forState:UIControlStateNormal];
            self.headV.huangGuanImg.image = [UIImage imageNamed:@"vip_my_icon_nor"];
            // 刷新表格
            [self.tbv reloadData];
            
        }
        
    } Failture:^(MyHomepageModel * myHomePageError) {
        if ([[myHomePageError.message substringToIndex:5] isEqualToString:@"未登陆错误"]) {
            [User_Default setValue:nil forKey:@"mysession"];
            [self.tbv reloadData];
        }
    }];
    // 我 - 有效课卡
    [self.bqViewModel getBQSmallCardSuccess:^(BingQiuSmallCardModel * bqModel) {
        // 结束刷新
        [self.tbv.mj_header endRefreshing];
        self.data = [NSMutableArray array];
        if (bqModel.success) {
            for (BQSmallCardDetailModel *bqSmallCardDetailModel in bqModel.data) {
                [self.data addObject:bqSmallCardDetailModel];
            }
            [self.tbv reloadData];
        }
    } Failture:^(BingQiuSmallCardModel * bqError) {
        
        if ([[bqError.message substringToIndex:5] isEqualToString:@"未登陆错误"]) {
            [User_Default setValue:nil forKey:@"mysession"];
            [self.tbv reloadData];
        }
    }];
    
}
#pragma mark --> 按钮的点击事件
- (void)leftBtnClick:(UIButton *)leftBtn{
    
    if ([User_Default objectForKey:@"myjsession"]) {
        
        SetViewController *setVC = [[SetViewController alloc]init];
        // 将我的界面的学员ID传递到设置界面
        setVC.memId = self.myHomePageDetailModel.titlID;
        UINavigationController *setNav = [[UINavigationController alloc]initWithRootViewController:setVC];
        [self presentViewController:setNav animated:NO completion:nil];
        
    }else{
        
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        [self presentViewController:loginVC animated:NO completion:nil];
    }
}
- (void)rightBtnClick:(UIButton *)rightBtn{
    if ([User_Default objectForKey:@"myjsession"]) {
        ChangeStuViewController *changeStuVC = [[ChangeStuViewController alloc]init];
        // 将我的界面的学员ID传递给切换学员界面
        changeStuVC.memId = self.myHomePageDetailModel.titlID;
        UINavigationController *changeStuNav = [[UINavigationController alloc]initWithRootViewController:changeStuVC];
        [self presentViewController:changeStuNav animated:NO completion:nil];
    }else{
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        [self presentViewController:loginVC animated:NO completion:nil];
    }
}
- (void)coverBtnClick:(UIButton *)coverBtn{
    
    if ([User_Default objectForKey:@"myjsession"]) {
        
        StuInforController *stuInfoVC = [[StuInforController alloc]init];
        //实现回传头像的block
        stuInfoVC.headerImgBlock = ^(UIImage * _Nonnull img) {
            self.headV.headImg.image = img;
        };
        
        UINavigationController *stuInfoNav = [[UINavigationController alloc]initWithRootViewController:stuInfoVC];
        [self presentViewController:stuInfoNav animated:YES completion:nil];
        
    }else{
        
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        [self presentViewController:loginVC animated:NO completion:nil];
    }
}
// 立即开通按钮
-(void)rigthBtnClick:(UIButton *)ljktBtn{
    
    if ([User_Default objectForKey:@"myjsession"]) {
        
        if (self.myHomePageDetailModel.vipEndDate) {
            XingQiuViewController *xqVIPVC = [[XingQiuViewController alloc]init];
            UINavigationController *xqVIPNav = [[UINavigationController alloc]initWithRootViewController:xqVIPVC];
            [self presentViewController:xqVIPNav animated:NO completion:nil];
            
        }else{
            
            ChengWeiXingQiuVIPViewController *paySuccessVC = [[ChengWeiXingQiuVIPViewController alloc]init];
            UINavigationController *paySuccessNav = [[UINavigationController alloc]initWithRootViewController:paySuccessVC];
            [self presentViewController:paySuccessNav animated:NO completion:nil];
        }
        
    }else{
        
        LoginViewController *loginVC = [[LoginViewController alloc]init];
        [self presentViewController:loginVC animated:NO completion:nil];
    }
    
}
#pragma mark------懒加载
-(HeadView *)headV{
    if (!_headV) {
        _headV = [[HeadView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, 180)];
    }
    return _headV;
}
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT) style:UITableViewStyleGrouped];
        _tbv.bounces = NO;
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
        _tbv.tableHeaderView = self.headV;
        
        // 下拉刷新
        self.tbv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self netWorkRequest];
        }];
        
    }
    return _tbv;
}

#pragma mark --> 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        if (!_customV) {
            _customV = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 83)];
            _customV.backgroundColor = [UIColor whiteColor];
            [cell.contentView addSubview:_customV];
        }
        return cell;
        
    }else if (indexPath.section == 1){
        
        UITableViewCell *xqCell = [tableView dequeueReusableCellWithIdentifier:@"xqCell"];
        if (!xqCell) {
            xqCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xqCell"];
        }
        xqCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        if (!_xqView) {
            _xqView = [[XingQiuVIPView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 50)];
            
        }
        
        if ([User_Default objectForKey:@"myjsession"]) {
            
            if (self.myHomePageDetailModel.vipEndDate) {
                _xqView.dateBtn.hidden = NO;
                _xqView.rightBtn.hidden = YES;
                // 立即开通按钮
                NSString *dateStr = self.myHomePageDetailModel.vipEndDate;
                [_xqView.dateBtn setTitle:[NSString stringWithFormat:@"%@到期",dateStr] forState:UIControlStateNormal];
                [_xqView.dateBtn setTitleColor:[UIColor colorWithHexString:@"#188bf0"] forState:UIControlStateNormal];
                [_xqView.dateBtn addTarget:self action:@selector(rigthBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                [xqCell.contentView addSubview:_xqView];
            }else{
                _xqView.rightBtn.hidden = NO;
                _xqView.dateBtn.hidden = YES;
                // 立即开通按钮
                [_xqView.rightBtn addTarget:self action:@selector(rigthBtnClick:) forControlEvents:UIControlEventTouchUpInside];
                [xqCell.contentView addSubview:_xqView];
            }
        }else{
            
            _xqView.rightBtn.hidden = NO;
            _xqView.dateBtn.hidden = YES;
            // 立即开通按钮
            [_xqView.rightBtn addTarget:self action:@selector(rigthBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [xqCell.contentView addSubview:_xqView];
        }
        
        
        return xqCell;
        
    }else if (indexPath.section == 2){
        self.cashReserveCell = [tableView dequeueReusableCellWithIdentifier:@"cashReserveCell"];
        if (!_cashReserveCell) {
            _cashReserveCell = [[MineTwoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cashReserveCell"];
        }
        self.cashReserveCell.selectionStyle = UITableViewCellSelectionStyleNone;
        if ([User_Default objectForKey:@"myjsession"]) {
                // 现金余额
                self.cashReserveCell.rightLab.text = [NSString stringWithFormat:@"%.2f元",self.myHomePageDetailModel.cashBalance];
        }else{
            self.cashReserveCell.rightLab.text = @"0.00元";
        }
        return self.cashReserveCell;
    }else if (indexPath.section == 3){
        self.jiangXueJinCell = [tableView dequeueReusableCellWithIdentifier:@"jiangXueJinCell"];
        if (!_jiangXueJinCell) {
            _jiangXueJinCell = [[MineThreeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"jiangXueJinCell"];
        }
        self.jiangXueJinCell.selectionStyle = UITableViewCellSelectionStyleNone;
        if ([User_Default objectForKey:@"myjsession"]) {
                // 奖学金合计
                self.jiangXueJinCell.leftNumLab.text = [NSString stringWithFormat:@"%.2f",self.myHomePageDetailModel.scholarshipSum];
                // 奖学金已用
                self.jiangXueJinCell.middleNumLab.text = [NSString stringWithFormat:@"%.2f",self.myHomePageDetailModel.scholarshipUsed];
                // 奖学金可用
                self.jiangXueJinCell.rightNumLab.text = [NSString stringWithFormat:@"%.2f",self.myHomePageDetailModel.scholarshipSurplus];
            
        }else{
            // 奖学金 合计(元)
            self.jiangXueJinCell.leftNumLab.text = @"0.00";
            // 奖学金 已用(元)
            self.jiangXueJinCell.middleNumLab.text = @"0.00";
            // 奖学金 可用(元)
            self.jiangXueJinCell.rightNumLab.text = @"0.00";
        }
        return self.jiangXueJinCell;
    }else if (indexPath.section == 4){
        self.xinYongEDuCell = [tableView dequeueReusableCellWithIdentifier:@"xinYongEDuCell"];
        if (!_xinYongEDuCell) {
            _xinYongEDuCell = [[MineThreeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"xinYongEDuCell"];
        }
        self.xinYongEDuCell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.xinYongEDuCell.titleLab.text = @"信用额度";
        self.xinYongEDuCell.leftLab.text = @"额度(元)";
        
        if ([User_Default objectForKey:@"myjsession"]) {
                // 总信用额度
                self.xinYongEDuCell.leftNumLab.text = [NSString stringWithFormat:@"%.2f",self.myHomePageDetailModel.creditLimitTotal];
                // 信用额度已用
                self.xinYongEDuCell.middleNumLab.text = [NSString stringWithFormat:@"%.2f",self.myHomePageDetailModel.creditLimitUsed];
                // 信用额度可用
                self.xinYongEDuCell.rightNumLab.text = [NSString stringWithFormat:@"%.2f",self.myHomePageDetailModel.creditLimitSurplus];
            
        }else{
            
            // 信用额度 额度(元)
            self.xinYongEDuCell.leftNumLab.text = @"0.00";
            // 信用额度 已用(元)
            self.xinYongEDuCell.middleNumLab.text = @"0.00";
            // 信用额度 可用(元)
            self.xinYongEDuCell.rightNumLab.text = @"0.00";
        }
        return self.xinYongEDuCell;
    }else if (indexPath.section == 5){
        self.youHuiZhengCeCell = [tableView dequeueReusableCellWithIdentifier:@"youHuiZhengCeCell"];
        if (!_youHuiZhengCeCell) {
            _youHuiZhengCeCell = [[MineTwoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"youHuiZhengCeCell"];
        }
        self.youHuiZhengCeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.youHuiZhengCeCell.leftLab.text = @"优惠政策";
        self.youHuiZhengCeCell.rightLab.textColor = [UIColor colorWithHexString:@"#999999"];
        
        if ([User_Default objectForKey:@"myjsession"]) {
            if (self.myHomePageDetailModel.favouredPolicy != nil) {
                // 优惠政策
                self.youHuiZhengCeCell.rightLab.text = self.myHomePageDetailModel.favouredPolicy;
            }
        }else{
            // 优惠政策
            self.youHuiZhengCeCell.rightLab.text = @"无";
        }
        return self.youHuiZhengCeCell;
    }else {
        self.bingQiuDaKeKaCell = [tableView dequeueReusableCellWithIdentifier:@"bingQiuDaKeKaCell"];
        if (!_bingQiuDaKeKaCell) {
            _bingQiuDaKeKaCell = [[MineThreeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bingQiuDaKeKaCell"];
        }
        self.bingQiuDaKeKaCell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.bingQiuDaKeKaCell.titleLab.text = @"有效课卡";
        self.bingQiuDaKeKaCell.leftLab.text = @"总节数";
        self.bingQiuDaKeKaCell.middleLab.text = @"已使用";
        self.bingQiuDaKeKaCell.rightLab.text = @"剩余";
        
        if ([User_Default objectForKey:@"myjsession"]) {
            
            if (self.data.count) {
                // 标题
                self.bingQiuDaKeKaCell.titleLab.text = [self.data firstObject].cardName;
                // 总节数
                self.bingQiuDaKeKaCell.leftNumLab.text = [self.data firstObject].classNum;
                // 已使用
                self.bingQiuDaKeKaCell.middleNumLab.text = [self.data firstObject].usedClassNum;
                // 剩余
                self.bingQiuDaKeKaCell.rightNumLab.text = [self.data firstObject].surplusNum;
                
            }else{
                self.bingQiuDaKeKaCell.titleLab.text = @"有效课卡";
                self.bingQiuDaKeKaCell.leftNumLab.text = @"0";
                self.bingQiuDaKeKaCell.middleNumLab.text = @"0";
                self.bingQiuDaKeKaCell.rightNumLab.text = @"0";
            }
            
        }else{
            
            self.bingQiuDaKeKaCell.titleLab.text = @"有效课卡";
            self.bingQiuDaKeKaCell.leftNumLab.text = @"0";
            self.bingQiuDaKeKaCell.middleNumLab.text = @"0";
            self.bingQiuDaKeKaCell.rightNumLab.text = @"0";
        }
        
        return self.bingQiuDaKeKaCell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 83;
    }else if (indexPath.section == 1 || indexPath.section == 2 || indexPath.section == 5){
        return 50;
    }else if (indexPath.section == 3 || indexPath.section == 4 || indexPath.section == 6){
        return 113;
    }
    return 0;
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1|| section == 2 || section == 6){
        return 10;
    }else{
        return 0.01;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
        
    return 0;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

-(MyHomepageModel *)myHomePageModel{
    if (!_myHomePageModel) {
        _myHomePageModel = [[MyHomepageModel alloc]init];
    }
    return _myHomePageModel;
}
-(MyHomePageDetailModel *)myHomePageDetailModel{
    if (!_myHomePageDetailModel) {
        _myHomePageDetailModel = [[MyHomePageDetailModel alloc]init];
    }
    return _myHomePageDetailModel;
}
-(MyHomePageViewModel *)myHomePageViewModel{
    if (!_myHomePageViewModel) {
        _myHomePageViewModel = [[MyHomePageViewModel alloc]init];
    }
    return _myHomePageViewModel;
}
-(BQSmallCardViewModel *)bqViewModel{
    if (!_bqViewModel) {
        _bqViewModel = [[BQSmallCardViewModel alloc]init];
    }
    return _bqViewModel;
}
-(BQSmallCardDetailModel *)bqDetailModel{
    if (!_bqDetailModel) {
        _bqDetailModel = [[BQSmallCardDetailModel alloc]init];
    }
    return _bqDetailModel;
}
@end
