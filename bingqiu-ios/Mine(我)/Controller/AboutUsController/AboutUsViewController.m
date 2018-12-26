//
//  AboutUsViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/31.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UILabel *navTitleLab;

@property(nonatomic,strong)UIView *headerView;
@property(nonatomic,strong)UIImageView *iconImg;
@property(nonatomic,strong)UILabel *bingQiuLab;
@property(nonatomic,strong)UITableView *tbv;


@property(nonatomic,strong)UIView *footerV;
@property(nonatomic,strong)UILabel  *componay;

@end

@implementation AboutUsViewController

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
    // 导航条背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航标题
    self.navigationItem.titleView = self.navTitleLab;
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
}

#pragma mark --> customBtn点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark --> 懒加载
-(UILabel *)navTitleLab{
    if (!_navTitleLab) {
        // 导航标题
        _navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _navTitleLab.text = @"关于我们";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}


-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 175)];
        _headerView.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
        
        [self.headerView addSubview:self.iconImg];
        [self.headerView addSubview:self.bingQiuLab];
        
        [self addLayOut];
    }
    return _headerView;
}
-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.headerView.mas_top).with.offset(41);
        make.centerX.equalTo(weakself.headerView.mas_centerX);
    }];
    [self.bingQiuLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.iconImg.mas_bottom).with.offset(8);
        make.centerX.equalTo(weakself.headerView.mas_centerX);
    }];
}
-(UIImageView *)iconImg{
    if (!_iconImg) {
        _iconImg = [UIImageView new];
        _iconImg.image = [UIImage imageNamed:@"icon_aboutus_120"];
    }
    return _iconImg;
}
-(UILabel *)bingQiuLab{
    if (!_bingQiuLab) {
        _bingQiuLab = [UILabel new];
        _bingQiuLab.text = @"冰上星球";
        _bingQiuLab.textAlignment = NSTextAlignmentCenter;
        _bingQiuLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _bingQiuLab.font = BQBOLDFONT(14);
    }
    return _bingQiuLab;
}

-(UITableView *)tbv{
    if (!_tbv) {
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - NAVIGATION_BAR_HEIGHT) style:UITableViewStyleGrouped];
        
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
        
        _tbv.tableHeaderView = self.headerView;
    }
    return _tbv;
}

#pragma mark --> 代理和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @[@"关注冰上星球微信公众号",@"关注冰上星球微博",@"商务合作"][indexPath.row];
    cell.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    cell.textLabel.font = BQBOLDFONT(16);
    
    cell.detailTextLabel.text = @[@"冰上星球",@"冰上星球",@"yunrui@icestargroup.com"][indexPath.row];
    cell.detailTextLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    cell.detailTextLabel.font = BQFONT(16);
    // 右侧箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 2) {
        // 右侧箭头
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

// 设置页眉高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return SCREEN_H - 390;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return self.footerV;
}

-(UIView *)footerV{
    if (!_footerV) {
        _footerV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H - 390)];
        [self.footerV  addSubview:self.componay];
    }
    return _footerV;
}
-(UILabel *)componay{
    if (!_componay) {
        _componay  = [[UILabel alloc] initWithFrame:CGRectMake(0, self.footerV.frame.size.height - TABBAR_BAR_HEIGHT, SCREEN_W, 14)];
        _componay.text = @"华星云睿荣誉出品";
        _componay.textColor = [UIColor colorWithHexString:@"#666666"];
        _componay.textAlignment = NSTextAlignmentCenter;
        _componay.font = BQFONT(14);
    }
    return _componay;
}
@end
