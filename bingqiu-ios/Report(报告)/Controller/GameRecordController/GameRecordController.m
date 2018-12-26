//
//  GameRecordController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/30.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "GameRecordController.h"
#import "WangLuoCuoWu.h"
#import "ScreenView.h"
#import "GameRecordDetails.h"
#import "ShareViewController.h"

#import "BiSaiListDetailModel.h"
#import "BiSaiListViewModel.h"

@interface GameRecordController ()<UITableViewDelegate,UITableViewDataSource>
{
    int size;
    int page;
    NSNumber *sizeNum;
    NSNumber *pageNum;
    
    NSString  *yearss;
    NSString  *monthss;
}

@property(nonatomic,strong)WangLuoCuoWu *netWorkErrorView;
@property(nonatomic,strong)ScreenView *screenV;

@property(nonatomic,copy)UILabel  *titLab;
@property(nonatomic,strong)UIButton *rightBut;

@property(nonatomic,strong)UIView       *footView;
@property(nonatomic,strong)UIImageView  *zuoBiaoImg;
@property(nonatomic,strong)UILabel      *titleLab;

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic , strong)UILabel  *lineLab;
@property(nonatomic , strong)NSMutableArray  *mArr;

@property(nonatomic,strong)BiSaiListDetailModel *biSaiDetailModel;
@property(nonatomic,strong)BiSaiListViewModel *biSaiViewModel;
@property(nonatomic,strong)NSMutableArray <BiSaiListDetailModel *>*bsData;


@end

@implementation GameRecordController

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
    // 设置背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    // 导航标题
    self.navigationItem.titleView = self.titLab;
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.extendedLayoutIncludesOpaqueBars = YES;
    
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 导航右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBut];
    
    // 网络请求
    [self netWorkRequest];
    
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
    
    [self.view addSubview:self.lineLab];
    
}

-(void)netWorkRequest{
    
    page = 1;
    size = 10;
    pageNum = @(page);
    sizeNum = @(size);
    
    yearss = @"";
    monthss = @"";
    
    // 网络解析
    [self getData];
    
}
-(void)getData{
    
    self.bsData = [NSMutableArray array];
    // 比赛数据
    [self.biSaiViewModel getBiSaiListWithPageNo:pageNum PageSize:sizeNum yearStr:yearss MonthStr:monthss Success:^(BiSaiListModel *  biSaiModel) {
        
        [self.tbv.mj_header endRefreshing];
        
        if (biSaiModel.success) {
            for (BiSaiListDetailModel *biSaiDetailModel in biSaiModel.data) {
                [self.bsData addObject:biSaiDetailModel];
            }
//            if (self.bsData.count == 0) {
//                self.netWorkErrorView = [[WangLuoCuoWu alloc]init];
//                [self.netWorkErrorView showCustomNetWorkErrorView:self.view];
//            }
//            if (self.bsData.count == 0) {
////                [self.view showErrorText:@"暂无数据"];
//                [SVProgressHUD showErrorText:@"暂无数据"];
//                [SVProgressHUD dismissWithDelay:0.5];
//            }
            [self.tbv reloadData];
        }
    } Failture:^(BiSaiListModel *  biSaiError) {
        
    }];
}

#pragma mark --> 按钮的点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBtn:(UIButton *)rightBtn{
    [self.screenV showCustomScreenView:self.view];
}
#pragma mark --> 初始化筛选试图
-(ScreenView *)screenV{
    if (!_screenV) {
        _screenV = [[ScreenView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
        // 确定按钮
        [_screenV.sureBtn addTarget:self action:@selector(queDingBntnClick:) forControlEvents:UIControlEventTouchUpInside];
        // 取消按钮
        [_screenV.cancelBtn addTarget:self action:@selector(quXiaoBntnClick:) forControlEvents:UIControlEventTouchUpInside];
        _screenV.backgroundColor = [UIColor grayColor];
    }
    return _screenV;
}
#pragma mark --> 确定按钮和取消按钮点击事件
-(void)queDingBntnClick:(UIButton *)queDingBtn{
    
    yearss = self.screenV.yearStr;
    monthss = self.screenV.monthStr;
    // 网络解析
    [self getData];
    
    [self.screenV dissmissCustomScreenView];
}
-(void)quXiaoBntnClick:(UIButton *)quXiaoBtn{
    
    [self.screenV dissmissCustomScreenView];
}

#pragma mark --> 懒加载
-(UILabel *)titLab{
    if (!_titLab) {
        _titLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _titLab.text = @"比赛记录";
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
#pragma mark --> 懒加载
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
        _tbv.tableFooterView = self.footView;
        
        // 下拉刷新
        _tbv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self netWorkRequest];
        }];
        
    }
    return _tbv;
}
-(UIView *)footView{
    if (!_footView) {
        _footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W  , 40)];
        _footView.backgroundColor = [UIColor whiteColor];
        [self.footView addSubview:self.zuoBiaoImg];
        [self.footView addSubview:self.titleLab];
        [self addLayOut];
        
    }
    return _footView;
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.zuoBiaoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (IS_IPHONE_6s) {
            make.top.equalTo(weakself.footView.mas_top).with.offset(8);
            make.left.equalTo(weakself.footView.mas_left).with.offset(85);
            make.size.mas_equalTo(CGSizeMake(18, 23));
        }else{
            make.top.equalTo(weakself.footView.mas_top).with.offset(5);
            make.left.equalTo(weakself.footView.mas_left).with.offset(125);
            make.size.mas_equalTo(CGSizeMake(18, 23));
        }
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.footView.mas_top).with.offset(8);
        make.left.equalTo(weakself.zuoBiaoImg.mas_right).with.offset(5);
    }];
    
}
-(UIImageView *)zuoBiaoImg{
    if (!_zuoBiaoImg) {
        _zuoBiaoImg = [UIImageView new];
        _zuoBiaoImg.image = [UIImage imageNamed:@"icon_list_start"];
    }
    return _zuoBiaoImg;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"这不仅是起点,更是一段人生的开始!";
        _titleLab.font = BQFONT(14);
        _titleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        [_titleLab sizeToFit];
    }
    return _titleLab;
}
#pragma mark --> 代理和数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.bsData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GameRecordDetails *detailsCell = [tableView dequeueReusableCellWithIdentifier:@"detailsCell"];
    if (!detailsCell) {
        detailsCell = [[GameRecordDetails alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"detailsCell"];
    }
    detailsCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    detailsCell.timeLab.text = self.bsData[indexPath.row].startTime;
    detailsCell.titlLab.text = self.bsData[indexPath.row].iceTitle;
    detailsCell.firTeam.text = self.bsData[indexPath.row].team1Name;
    detailsCell.firNum.text = [NSString stringWithFormat:@"%@",self.bsData[indexPath.row].team1Score];
    detailsCell.secTeam.text = self.bsData[indexPath.row].team2Name;
    detailsCell.secNum.text = [NSString stringWithFormat:@"%@",self.bsData[indexPath.row].team2Score];
    
    return detailsCell;
}
// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 143;
}

// 设置页眉高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShareViewController *shareV = [[ShareViewController alloc]init];
    [self.navigationController pushViewController:shareV animated:YES];
}
-(BiSaiListDetailModel *)biSaiDetailModel{
    if (!_biSaiDetailModel) {
        _biSaiDetailModel = [[BiSaiListDetailModel alloc]init];
    }
    return _biSaiDetailModel;
}
-(BiSaiListViewModel *)biSaiViewModel{
    if (!_biSaiViewModel) {
        _biSaiViewModel = [[BiSaiListViewModel alloc]init];
    }
    return _biSaiViewModel;
}
-(NSMutableArray<BiSaiListDetailModel *> *)bsData{
    if (!_bsData) {
        _bsData = [NSMutableArray array];
    }
    return _bsData;
}
@end
