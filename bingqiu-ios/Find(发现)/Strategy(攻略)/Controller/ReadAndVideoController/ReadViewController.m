//
//  ReadViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReadViewController.h"
#import "BiDuAndVideoKongJieMian.h"
#import "ReadOneTableViewCell.h"
#import "ReadTwoTableViewCell.h"
#import "ReadThreeTableViewCell.h"
#import "ReadTableViewCell.h"
#import "VideoTableViewCell.h"
#import "ReadDetailViewController.h"

#import "ChaKanStrategyModel.h"
#import "ChaKanStrategyDetailModel.h"
#import "ChaKanStrategyViewModel.h"

#import "RequiredDetailModel.h"
#import "RequiredViewModel.h"

#import "VideoDetailModel.h"
#import "VideoViewModel.h"

@interface ReadViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int size;
    int page;
    NSNumber *sizeNum;
    NSNumber *pageNum;
}

@property(nonatomic,strong)BiDuAndVideoKongJieMian *biDuKongJieMian;
@property(nonatomic,strong)BiDuAndVideoKongJieMian *videoKongJieMian;

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)UIImageView *headView;
@property(nonatomic,assign)BOOL isMustRead;

@property(nonatomic,strong)ChaKanStrategyModel *ckStrategyModel;
@property(nonatomic,strong)ChaKanStrategyDetailModel *ckStrategyDetailModel;
@property(nonatomic,strong)ChaKanStrategyViewModel *ckStrategyViewModel;

@property(nonatomic,strong)RequiredDetailModel *requDetailModel;
@property(nonatomic,strong)RequiredViewModel   *requViewModel;
@property(nonatomic,strong)NSMutableArray <RequiredDetailModel *>*data;

@property(nonatomic,strong)VideoDetailModel *videoDetailModel;
@property(nonatomic,strong)VideoViewModel   *videoViewModel;
@property(nonatomic,strong)NSMutableArray <VideoDetailModel *>*videoData;


@end

@implementation ReadViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isMustRead = YES;
    
    // 视图背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    // 导航左侧返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 导航栏标题
    self.navigationItem.title = self.navTitleStr;
    
    page = 1;
    size = 10;
    // 添加到视图
    [self.view addSubview:self.tbv];
    // 检测网络
    [self ChickStatus];

}
// 返回按钮的点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)ChickStatus{
    pageNum = @(page);
    sizeNum = @(size);
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        if (status != RealStatusNotReachable) {
            // 网络解析
            [self netWorkRequest];
            // 调用必读接口请求
            [self isAccordingrequiredData];
            
        }else{
            [SVProgressHUD showErrorText:@"网络不给力"];
            [SVProgressHUD dismissWithDelay:0.5];
        }
    }];
}
// 网络解析
-(void)netWorkRequest{
    
    [self.ckStrategyViewModel getChaKanStrategyWithStrategyId:self.strategyId Success:^(ChaKanStrategyModel * chaKanStrategyModel) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
        
        self.ckStrategyDetailModel.title = chaKanStrategyModel.data[@"title"];
        self.ckStrategyDetailModel.photo = chaKanStrategyModel.data[@"photo"];
        self.ckStrategyDetailModel.attention = chaKanStrategyModel.data[@"attention"];
        self.ckStrategyDetailModel.suitIntro = chaKanStrategyModel.data[@"suitIntro"];
        self.ckStrategyDetailModel.titleId = chaKanStrategyModel.data[@"id"];
        
        NSString *urlStr = self.ckStrategyDetailModel.photo;
        [self.headView sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
        // 刷新表格
        [self.tbv reloadData];
        
    } Failture:^(ChaKanStrategyModel * chaKanStrategyError) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
    }];
}
//是否显示必读
- (void)isAccordingrequiredData
{
    self.data = [NSMutableArray array];
    [self.requViewModel getRequiredWithPageNum:self->pageNum SizeNum:self->sizeNum StrategyId:self.idss Success:^(RequiredModel *  bdModel) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
        if (bdModel.success) {
            for (RequiredDetailModel *requDetail in bdModel.data) {
                [self.data addObject:requDetail];
            }
            // 展示必读空界面时,隐藏视频空界面
            self.videoKongJieMian.hidden =YES;
            
            if (self.data.count == 0) {
                
                self.biDuKongJieMian.hidden = NO;
                [self.tbv addSubview:self.biDuKongJieMian];
                
            }else{
                
                self.biDuKongJieMian.hidden =YES;
            }
            // 刷新单个cell时用到
            NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:3];
            [self.tbv reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        
    } Failture:^(RequiredModel *  reqError) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
    }];

}

//是否显示视频
- (void)isAccordingVideoData
{
    self.videoData = [NSMutableArray array];
    [self.videoViewModel getVideowWithPageNum:self->pageNum SizeNum:self->sizeNum StrategyId:self.videoId Success:^(VideoModel * videoModel) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
        if (videoModel.success) {
            for (VideoDetailModel *videoDetail in videoModel.data) {
                [self.videoData addObject:videoDetail];
            }
            // 展示视频空界面时,隐藏必读空界面
            self.biDuKongJieMian.hidden =YES;
            
            if (self.videoData.count == 0) {
                self.videoKongJieMian.titleLab.text = @"暂时没有相关视频";
                self.videoKongJieMian.img.image = [UIImage imageNamed:@"icon_broadcast_empty"];
                self.videoKongJieMian.hidden = NO;
                [self.tbv addSubview:self.videoKongJieMian];
          
            }else{
                self.videoKongJieMian.hidden =YES;
            }
            //刷新单个cell时用到
            NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:3];
            [self.tbv reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
            
        }
    } Failture:^(VideoModel * videoError) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
    }];

}

#pragma mark --> 懒加载
-(BiDuAndVideoKongJieMian *)biDuKongJieMian{
    if (!_biDuKongJieMian) {
        _biDuKongJieMian = [[BiDuAndVideoKongJieMian alloc]init];
    }
    return _biDuKongJieMian;
}
-(BiDuAndVideoKongJieMian *)videoKongJieMian{
    if (!_videoKongJieMian) {
        _videoKongJieMian = [[BiDuAndVideoKongJieMian alloc]init];
    }
    return _videoKongJieMian;
}
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - NAVIGATION_BAR_HEIGHT) style:UITableViewStyleGrouped];
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior =  UIScrollViewContentInsetAdjustmentNever;
        }
        else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        // 分割线样式
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
        // 将试图添加到表格头视图
        _tbv.tableHeaderView = self.headView;
        
        // 下拉刷新
        _tbv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            // 网络请求
            [self netWorkRequest];
        }];
        // 上拉查看更多
        _tbv.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
        }];
        
    }
    return _tbv;
}
-(UIImageView *)headView{
    if (!_headView) {
        _headView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 170)];
    }
    return _headView;
}
#pragma mark --> 数据源方法
// 几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
// 几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 3) {
        //实际返回数组个数
        if (self.isMustRead) {
            return self.data.count;
        }else{
            return self.videoData.count;
        }
    }
      return 1;
}
// 设置cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ReadOneTableViewCell *oneCell = [ReadOneTableViewCell cellWithTableView:tableView];
        oneCell.contentTV.text = self.ckStrategyDetailModel.suitIntro;
        return oneCell;
        
    }else if (indexPath.section == 1){
        ReadTwoTableViewCell *twoCell = [ReadTwoTableViewCell cellWithTableView:tableView];
        twoCell.contentTV.text = self.ckStrategyDetailModel.attention;
        return twoCell;
        
    }else if(indexPath.section == 2){
        
        ReadThreeTableViewCell *threeCell = [ReadThreeTableViewCell cellWithTableView:tableView];
        
        // block里用的self需要弱引用
        __weak typeof(self) weakself = self;
        threeCell.btnClickedBlock = ^(BOOL isMustRead) {
            //根据点击的按钮不同,赋值不同的数据
            weakself.isMustRead = isMustRead;
            
            if(isMustRead){
                // 如果是必读调用必读网络解析
                [weakself isAccordingrequiredData];
            }else{
                // 如果是视频调用视频网络解析
                [weakself isAccordingVideoData];
            }
        };
        return threeCell;
        
    }else{
        
        if (self.isMustRead) {

            ReadTableViewCell *readCell = [ReadTableViewCell cellWithTbaleView:tableView];
            readCell.contentLab.text = self.data[indexPath.row].title;
            readCell.numberLab.text = [NSString stringWithFormat:@"%@人看过",[self.data firstObject].readNum];
            return readCell;
            
        } else {
            
            VideoTableViewCell *videoCell = [VideoTableViewCell cellWithTableView:tableView];
            [videoCell.bgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[self.videoData firstObject].photo]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
            videoCell.leftLab.text = self.videoData[indexPath.row].title;
            videoCell.dianZanLab.text = [NSString stringWithFormat:@"%@",self.videoData[indexPath.row].upNum];
            videoCell.numLab.text = [NSString stringWithFormat:@"%@",self.videoData[indexPath.row].readNum];
            return videoCell;
        }
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 115;
    }else if (indexPath.section == 1){
        return 100;
    }else if (indexPath.section == 2){
        return 49;
    }else{
        return  self.isMustRead ? 50 : 240;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
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
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 3) {
        
        if (self.isMustRead) {
            ReadDetailViewController *readDetailVC = [[ReadDetailViewController alloc]init];
            [self.navigationController pushViewController:readDetailVC animated:YES];
        }
    }
}


-(ChaKanStrategyModel *)ckStrategyModel{
    if (!_ckStrategyModel) {
        _ckStrategyModel = [[ChaKanStrategyModel alloc]init];
    }
    return _ckStrategyModel;
}
-(ChaKanStrategyDetailModel *)ckStrategyDetailModel{
    if (!_ckStrategyDetailModel) {
        _ckStrategyDetailModel = [[ChaKanStrategyDetailModel alloc]init];
    }
    return _ckStrategyDetailModel;
}
-(ChaKanStrategyViewModel *)ckStrategyViewModel{
    if (!_ckStrategyViewModel) {
        _ckStrategyViewModel = [[ChaKanStrategyViewModel alloc]init];
    }
    return _ckStrategyViewModel;
}

-(RequiredViewModel *)requViewModel{
    if (!_requViewModel) {
        _requViewModel = [[RequiredViewModel alloc]init];
    }
    return _requViewModel;
}
-(RequiredDetailModel *)requDetailModel{
    if (!_requDetailModel) {
        _requDetailModel = [[RequiredDetailModel alloc]init];
    }
    return _requDetailModel;
}

-(VideoDetailModel *)videoDetailModel{
    if (!_videoDetailModel) {
        _videoDetailModel = [[VideoDetailModel alloc]init];
    }
    return _videoDetailModel;
}
-(VideoViewModel *)videoViewModel{
    if (!_videoViewModel) {
        _videoViewModel = [[VideoViewModel alloc]init];
    }
    return _videoViewModel;
}

@end
