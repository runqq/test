//
//  ReportViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReportViewController.h"
#import "ReportHeadView.h"
#import "ReportTableViewCell.h"
#import "BallTeamInfoCell.h"
#import "GameRecordCell.h"
#import "MyMedalController.h"
#import "MessageViewController.h"
#import "GameRecordController.h"
#import "ChaKanDetailsController.h"
#import "GameRecordController.h"
// 设置密码
#import "ResetPasswordController.h"
#import "LoginViewController.h"
#import "NonmemberController.h"
#import "HelpAndFanKui.h"

#import "HomePageModel.h"
#import "HomePageDetailModel.h"
#import "HomePageViewModel.h"


#import "ShareViewController.h"

@interface ReportViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *leftBtn;
    UILabel *navTitleLab;
    UIButton *rightBtn;
}

@property(nonatomic,strong)ReportHeadView *headV;
@property(nonatomic,strong)UITableView *tbv;

@property(nonatomic,strong)UIImageView *bgImg;
@property(nonatomic,strong)UIButton *bg_medal_Btn;
@property(nonatomic,strong)UIImageView *medal_distance_1_Img;
@property(nonatomic,strong)UIImageView *medal_distance_2_Img;
@property(nonatomic,strong)UILabel *myMedalLab;
@property(nonatomic,strong)NSArray *numArr;

@property(nonatomic,strong)HomePageModel *homePageModel;
@property(nonatomic,strong)HomePageViewModel *homePageViewModel;
@property(nonatomic,strong)HomePageDetailModel *homePageDetailModel;

@end

#define Start_X 0.0f               // 距离X轴的距离
#define Start_Y 118.0f             // 距离Y轴的距离
#define Width_Space 0.0f           // 横间距
#define Height_Space     20.0f     // 竖间距
#define View_Height   80.0f        // 控件的高
#define View_Width    125.0f       // 控件的宽


@implementation ReportViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // 如果jsession存在请求数据
    if ([User_Default objectForKey:@"myjsession"]) {
        [self netWorkRequest];
        
    }else{
        
//        // 不存在跳转到登录界面
//        LoginViewController  *loginVC = [[LoginViewController alloc]initWithLoginSuccessBlock:^{
//            [self netWorkRequest];
//        }];
//        loginVC.dismissBlock = ^{
//            [self.tabBarController setSelectedIndex:1];
//        };
//        //        [self.navigationController pushViewController:loginVC animated:NO];
//        [self presentViewController:loginVC animated:NO completion:nil];
//        [self.tbv reloadData];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden = NO;
    // 视图背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 防止导航栏下移
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 左侧按钮
    leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [leftBtn setImage:[UIImage imageNamed:@"nav_service"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    // 导航标题
    navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
    navTitleLab.text = @"报告";
    navTitleLab.textAlignment = NSTextAlignmentCenter;
    navTitleLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
    navTitleLab.font = BQBOLDFONT(18);
    self.navigationItem.titleView = navTitleLab;
    // 右侧按钮
    rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 10)];
    [rightBtn setImage:[UIImage imageNamed:@"nav_inf_new"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    //给导航条设置一个空的背景图 使其透明化
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //去除导航条透明后导航条下的黑线
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    // 网络解析
    [self postNet];
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat reOffset = scrollView.contentOffset.y + (SCREEN_H - 64) * 0.2;
    CGFloat alpha = reOffset / ((SCREEN_H - 64) * 0.2);
    if (alpha <= 1)//下拉永不显示导航栏
    {
        alpha = 0;
        [leftBtn setImage:[UIImage imageNamed:@"nav_service"] forState:UIControlStateNormal];
        [rightBtn setImage:[UIImage imageNamed:@"nav_inf_new"] forState:UIControlStateNormal];
        navTitleLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
    }
    else//上划前一个导航栏的长度是渐变的
    {
        alpha -= 1;
        [leftBtn setImage:[UIImage imageNamed:@"nav_service_gray"] forState:UIControlStateNormal];
        [rightBtn setImage:[UIImage imageNamed:@"nav_inf_gray"] forState:UIControlStateNormal];
        navTitleLab.textColor = [UIColor grayColor];
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

-(void)postNet{
    
    if ([User_Default objectForKey:@"myjsession"]) {
        // 如果jsession存在请求数据
        [self netWorkRequest];
        
    }else{
        
        __weak typeof(self) weakSelf = self;
        // 不存在跳转到登录界面
        LoginViewController  *loginVC = [[LoginViewController alloc]initWithLoginSuccessBlock:^{
            [weakSelf netWorkRequest];
        }];
        loginVC.dismissBlock = ^{
            [weakSelf.tabBarController setSelectedIndex:1];
        };
        [self presentViewController:loginVC animated:NO completion:nil];
    }
}


// 网络请求
-(void)netWorkRequest{
    
    [self.homePageViewModel getHomePageDataWithSuccess:^(HomePageModel *  homePageModel) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
        
        if (homePageModel.success) {
            
    self.homePageDetailModel.height = homePageModel.data[@"height"];// 身高
    self.homePageDetailModel.weight = homePageModel.data[@"weight"];// 体重
    self.homePageDetailModel.bodyMassFactor = homePageModel.data[@"bodyMassFactor"];//身体指数
    self.homePageDetailModel.age = homePageModel.data[@"age"];// 年龄
    self.homePageDetailModel.heatRate = homePageModel.data[@"heatRate"];// 基本心率
    self.homePageDetailModel.maxHeartRate = homePageModel.data[@"maxHeartRate"];// 最高心率
    self.homePageDetailModel.trainNum = homePageModel.data[@"trainNum"];// 总训练次数
    self.homePageDetailModel.trainAllDistance = homePageModel.data[@"trainAllDistance"];// 总滑行距离
    self.homePageDetailModel.trainUpTime = homePageModel.data[@"trainUpTime"];// 总上冰时间
    self.homePageDetailModel.matchNum = homePageModel.data[@"matchNum"];// 总比赛次数
    self.homePageDetailModel.matchGoalNum = homePageModel.data[@"matchGoalNum"];// 总进球
    self.homePageDetailModel.matchAssistNum = homePageModel.data[@"matchAssistNum"];// 总助攻(次)
    self.homePageDetailModel.matchScore = homePageModel.data[@"matchScore"];// 总得分
    self.homePageDetailModel.matchPunishTime = homePageModel.data[@"matchPunishTime"];// 总受罚时间
    self.homePageDetailModel.matchUpTime = homePageModel.data[@"matchUpTime"];// 总比赛上场时间
            
    self.homePageDetailModel.position = homePageModel.data[@"position"];// 位置
    self.homePageDetailModel.no = homePageModel.data[@"no"];// 球衣号码
    self.homePageDetailModel.matchNumTeam = homePageModel.data[@"matchNumTeam"];// 累积出赛次数
    self.homePageDetailModel.teamName = homePageModel.data[@"teamName"];// 球队
    self.homePageDetailModel.clubName = homePageModel.data[@"clubName"];// 隶属俱乐部
            
            NSMutableArray *marr = [NSMutableArray array];
            [marr addObject:self.homePageDetailModel.height];
            [marr addObject:self.homePageDetailModel.bodyMassFactor];
            [marr addObject:self.homePageDetailModel.weight];
            [marr addObject:self.homePageDetailModel.heatRate];
            [marr addObject:self.homePageDetailModel.age];
            [marr addObject:self.homePageDetailModel.maxHeartRate];
            self.numArr = marr;
            
            [self.tbv reloadData];
        }
        
    } Failture:^(HomePageModel *  homePageModel) {
        
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
        
        if ([[homePageModel.message substringToIndex:5] isEqualToString:@"未登陆错误"]) {
            [User_Default setValue:nil forKey:@"mysession"];
            LoginViewController  *loginVC = [[LoginViewController alloc] init];
            [self presentViewController:loginVC animated:YES completion:nil];
            
//            [LoginOut OutSuccess:^(TuiChuLoginModel * tuichumm) {
//                if (tuichumm.success) {
//                    [User_Default setValue:@"" forKey:@"mysession"];
//                    LoginViewController  *loginVC = [[LoginViewController alloc] init];
//                    [self presentViewController:loginVC animated:YES completion:nil];
//                }else{
//                    [self showErrorText:tuichumm.message];
//                }
//            } Failture:^(TuiChuLoginModel * err_tuichumm) {
//            }];
        }
        
    }];
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    
    [self.bg_medal_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        // 判断是否是iPhoneX
        if (kDevice_Is_iPhoneX) {
            make.top.equalTo(weakself.bgImg.mas_top).with.offset(84);
            make.right.equalTo(weakself.bgImg.mas_right).with.offset(0);
            make.size.mas_equalTo(CGSizeMake(119, 32));
        }else{
            make.top.equalTo(weakself.bgImg.mas_top).with.offset(70);
            make.right.equalTo(weakself.bgImg.mas_right).with.offset(0);
            make.size.mas_equalTo(CGSizeMake(119, 32));
        }
    }];
    
    [self.medal_distance_1_Img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_medal_Btn.mas_top).with.offset(7);
        make.left.equalTo(weakself.bg_medal_Btn.mas_left).with.offset(7);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.medal_distance_2_Img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_medal_Btn.mas_top).with.offset(7);
        make.left.equalTo(weakself.medal_distance_1_Img.mas_right).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.myMedalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bg_medal_Btn.mas_top).with.offset(7);
        make.left.equalTo(weakself.medal_distance_2_Img.mas_right).with.offset(5);
    }];
}

#pragma mark --> 懒加载

-(UIButton *)bg_medal_Btn{
    if (!_bg_medal_Btn) {
        _bg_medal_Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bg_medal_Btn setImage:[UIImage imageNamed:@"bg_medal_home"] forState:UIControlStateNormal];
    }
    return _bg_medal_Btn;
}
-(UIImageView *)medal_distance_1_Img{
    if (!_medal_distance_1_Img) {
        _medal_distance_1_Img = [UIImageView new];
        _medal_distance_1_Img.image = [UIImage imageNamed:@"medal_time_not_home"];
    }
    return _medal_distance_1_Img;
}
-(UIImageView *)medal_distance_2_Img{
    if (!_medal_distance_2_Img) {
        _medal_distance_2_Img = [UIImageView new];
        _medal_distance_2_Img.image = [UIImage imageNamed:@"medal_distance_3_home"];
    }
    return _medal_distance_2_Img;
}
-(UILabel *)myMedalLab{
    if (!_myMedalLab) {
        _myMedalLab = [UILabel new];
        _myMedalLab.text = @"我的勋章";
        _myMedalLab.textColor = [UIColor colorWithHexString:@"#999999"];
        _myMedalLab.font = BQFONT(12);
    }
    return _myMedalLab;
}

-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT) style:UITableViewStyleGrouped];
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
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
            [self postNet];
        }];
        
        
        
    }
    return _tbv;
}
#pragma mark --> 代理和协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ReportTableViewCell *reportCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!reportCell) {
            reportCell = [[ReportTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        reportCell.selectionStyle = UITableViewCellSelectionStyleNone;
            // 总训练次数
            reportCell.leftNum.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.trainNum];
            // 总滑行距离
            float floatStr = [self.homePageDetailModel.trainAllDistance floatValue];
            reportCell._circle.progress = floatStr/20000.00;
            // 总上冰时间
            reportCell.rightNum.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.trainUpTime];
        
        // 训练数据  --> 查看详情按钮
        [reportCell.rightBtn addTarget:self action:@selector(examineDetails:) forControlEvents:UIControlEventTouchUpInside];
        // 训练数据 --> 成长轨迹按钮
        [reportCell.arrowsBtn addTarget:self action:@selector(trainBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        return reportCell;
        
        
    }else if (indexPath.section == 1){
        GameRecordCell *gameRecCell = [tableView dequeueReusableCellWithIdentifier:@"gameRecCell"];
        if (!gameRecCell) {
            gameRecCell = [[GameRecordCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"gameRecCell"];
        }
        gameRecCell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        // 总比赛次数
        gameRecCell.gameTimeNum.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.matchNum];
        // 总进球
        float floaStr = [self.homePageDetailModel.matchGoalNum floatValue];
        gameRecCell.circle.progress = floaStr/20000.00;
        // 总助攻(次)
        gameRecCell.assistNum.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.matchAssistNum];
        // 总得分
        gameRecCell.sumGoalNum.text =  [NSString stringWithFormat:@"%@",self.homePageDetailModel.matchScore];
        // 总受罚时间
        gameRecCell.shouFaNum.text =  [NSString stringWithFormat:@"%@",self.homePageDetailModel.matchPunishTime];
        // 总上场时间
        gameRecCell.shangChangNum.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.matchUpTime];
        
        // 比赛记录  --> 查看详情按钮
        [gameRecCell.rightBtn addTarget:self action:@selector(chaKanDetailBtn:) forControlEvents:UIControlEventTouchUpInside];
        // 比赛记录 --> 成长轨迹按钮
        [gameRecCell.arrowsBtn addTarget:self action:@selector(trackBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        return gameRecCell;
        
    }else{
        
        BallTeamInfoCell *ballTeamCell = [tableView dequeueReusableCellWithIdentifier:@"ballTeamCell"];
        if (!ballTeamCell) {
            ballTeamCell = [[BallTeamInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ballTeamCell"];
        }
        ballTeamCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
            if ([self.homePageDetailModel.position isEqual:[NSNull null]]) {
                ballTeamCell.titLeftLab.text = @"";
            }else{
                // 位置
                ballTeamCell.titLeftLab.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.position];
            }
        
            if ([self.homePageDetailModel.no isEqual:[NSNull null]]) {
                ballTeamCell.timidLab.text = @"";
            }else{
                // 球衣号码
                ballTeamCell.timidLab.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.no];
            }
            if ([self.homePageDetailModel.matchNumTeam isEqual:[NSNull null]]) {
                ballTeamCell.titlRightLab.text = @"";
            }else{
                // 累计出赛次数
                ballTeamCell.titlRightLab.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.matchNumTeam];
            }
            if ([self.homePageDetailModel.teamName isEqual:[NSNull null]]) {
                ballTeamCell.teamLab.text = @"";
            }else{
                // 球队
                ballTeamCell.teamLab.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.teamName];
            }
            if ([self.homePageDetailModel.clubName isEqual:[NSNull null]]) {
                ballTeamCell.clubLab.text = @"";
            }else{
                // 俱乐部
                ballTeamCell.clubLab.text = [NSString stringWithFormat:@"%@",self.homePageDetailModel.clubName];
            }
    
        return ballTeamCell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return 265;
    }else if (indexPath.section == 1){
        return 330;
    }else{
        return 268;
    }
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 320;
    }else{
        return 10;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        _bgImg = [[UIImageView alloc]init];
        _bgImg.image = [UIImage imageNamed:@"bg_home_top"];
        _bgImg.frame = CGRectMake(0,  STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT, SCREEN_W, 320);
        // 设置用户交互
        _bgImg.userInteractionEnabled = YES;
        
        [self.bgImg addSubview:self.bg_medal_Btn];
        [self.bg_medal_Btn addSubview:self.medal_distance_1_Img];
        [self.bg_medal_Btn addSubview:self.medal_distance_2_Img];
        [self.bg_medal_Btn addSubview:self.myMedalLab];
        
        [self.bg_medal_Btn addTarget:self action:@selector(medalBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addLayOut];
        
        NSArray *imgArr = @[@"height_home",@"bodymass_home",@"weight_home",@"rate_home",@"age_home",@"rate_home_max"];
        NSArray *labArr = @[@"身高(cm)",@"身体质量指数",@"体重(kg)",@"基础心率(bpm)",@"年龄",@"最高心率(bpm)"];
        
        for (int i=0; i<6; i++) {
            NSInteger index = i % 3;
            NSInteger page = i / 3;
            UIView *myView = [[UIView alloc]init];
            // 随机色
            //            UIColor * randomColor= [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
            myView.tag = i;
            myView.frame = CGRectMake(index * (SCREEN_W/3 + Width_Space) + Start_X, page * (View_Height + Height_Space)+Start_Y, SCREEN_W/3, View_Height);
            [self.bgImg addSubview:myView];
            UIImageView *img;
            img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgArr[i]] highlightedImage:[UIImage imageNamed:imgArr[i]]];
            [myView addSubview:img];
            [img mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(myView.mas_top).with.offset(0);
                make.centerX.mas_equalTo(myView.mas_centerX);
            }];
            
            UILabel *numLab = [[UILabel alloc] init];
            // 将数据展示上去
            if (self.numArr.count) {
                
                if ([self.numArr[i] isKindOfClass:[NSNull class]]) {
                    numLab.text = @"";
                }else{
                    numLab.text = [NSString stringWithFormat:@"%@",self.numArr[i]];
                }
            }else{
                numLab.text = @"";
            }
            numLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
            numLab.font = BQBOLDFONT(22);
            [myView addSubview:numLab];
            [numLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(myView.mas_top).with.offset(35);
                make.centerX.mas_equalTo(myView.mas_centerX);
            }];
            UILabel *wenziLab;
            wenziLab = [[UILabel alloc] init];
            wenziLab.text = [NSString stringWithFormat:@"%@",labArr[i]];
            wenziLab.textColor = [UIColor colorWithHexString:@"#ffffff"];
            wenziLab.font = BQFONT(12);
            [myView addSubview:wenziLab];
            [wenziLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(myView.mas_bottom).with.offset(0);
                make.centerX.mas_equalTo(myView.mas_centerX);
            }];
        }
        
        return _bgImg;
        
    }else{
        
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

#pragma mark --> 按钮点击事件

-(void)leftBtnClick:(UIButton *)leftBtn{
    HelpAndFanKui *helpVC = [[HelpAndFanKui alloc]init];
    UINavigationController *helpNav = [[UINavigationController alloc]initWithRootViewController:helpVC];
    [self presentViewController:helpNav animated:NO completion:nil];
}
-(void)rightBtnClick:(UIButton *)rightBtn{
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    UINavigationController *messageNav = [[UINavigationController alloc]initWithRootViewController:messageVC];
    [self presentViewController:messageNav animated:NO completion:nil];
}
-(void)medalBtnClick:(UIButton *)medalBtn{
    MyMedalController *myMedalVC = [[MyMedalController alloc]init];
    [self presentViewController:myMedalVC animated:NO completion:nil];
}
// 训练数据 --> 查看详情按钮
-(void)examineDetails:(UIButton *)detailsBtn{
    ChaKanDetailsController *detailsVC = [[ChaKanDetailsController alloc]init];
    [self.navigationController pushViewController:detailsVC animated:NO];
}
// 训练数据 --> 成长轨迹按钮
-(void)trainBtnClick:(UIButton *)czgjBtn{
    ShareViewController *trainShareVC = [[ShareViewController alloc]init];
//    trainShareVC.trainStr = @"http://192.168.0.93:8080/html/train.html";
    [self.navigationController pushViewController:trainShareVC animated:YES];
}
// 比赛记录 --> 查看详情按钮
-(void)chaKanDetailBtn:(UIButton *)chaKanDetail{
    GameRecordController *gameRecordVC = [[GameRecordController alloc]init];
    [self.navigationController pushViewController:gameRecordVC animated:NO];

}
// 比赛记录 --> 成长轨迹按钮
-(void)trackBtnClick:(UIButton *)bsjlBtn{
    ShareViewController *trainShareVC = [[ShareViewController alloc]init];
    //    trainShareVC.trainStr = @"http://192.168.0.93:8080/html/train.html";
    [self.navigationController pushViewController:trainShareVC animated:YES];
}

-(HomePageModel *)homePageModel{
    if (!_homePageModel) {
        _homePageModel = [[HomePageModel alloc]init];
    }
    return _homePageModel;
}
-(HomePageDetailModel *)homePageDetailModel{
    if (!_homePageDetailModel) {
        _homePageDetailModel = [[HomePageDetailModel alloc]init];
    }
    return _homePageDetailModel;
}
-(HomePageViewModel *)homePageViewModel{
    if (!_homePageViewModel) {
        _homePageViewModel = [[HomePageViewModel alloc]init];
    }
    return _homePageViewModel;
}

@end
