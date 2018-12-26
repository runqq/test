//
//  StrategyViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "StrategyViewController.h"
#import "StrategyTableViewCell.h"
#import "StrategyOneTableViewCell.h"
#import "StrategyTwoTableViewCell.h"
#import "ReadViewController.h"

#import "StrategyViewModel.h"
#import "StategyDetailModel.h"

#import "WantToSeeViewModel.h"
#import "WantToSeeDetailModel.h"

#import "HotViewModel.h"
#import "HotDetailModel.h"

#import "AllStraDetailModel.h"
#import "AllStrategyViewModel.h"

#import "FenLeiViewModel.h"
#import "FenLeiDetailModel.h"

@interface StrategyViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger size;
    NSInteger page;
}
    
@property(nonatomic,strong)UIImageView *headV;
@property(nonatomic,strong)StrategyTwoTableViewCell *twoCell;
@property(nonatomic , strong)UITableView *tbv;
@property(nonatomic , strong)StrategyViewModel *viewModel;
@property(nonatomic , strong)StategyDetailModel *detailModel;

@property(nonatomic , strong)WantToSeeViewModel *wantViewModel;
@property(nonatomic , strong)WantToSeeDetailModel *wantDetailModel;
@property(nonatomic , strong)NSMutableArray <WantToSeeDetailModel *>*data;

@property(nonatomic,strong)HotViewModel *hotViewModel;
@property(nonatomic,strong)HotDetailModel *hotDetailModel;
@property(nonatomic,strong)NSMutableArray <HotDetailModel *>*hotData;

@property(nonatomic,strong)AllStrategyViewModel *glViewModel;
@property(nonatomic,strong)NSMutableArray <AllStraDetailModel *>*gldata;
@property(nonatomic,strong)NSMutableArray *glArr;

@property(nonatomic,strong)FenLeiViewModel *flViewModel;
@property(nonatomic,strong)FenLeiDetailModel *flDetailModel;
@property(nonatomic,strong)NSMutableArray <FenLeiDetailModel *>*flData;


@end

@implementation StrategyViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    page = 1;
    size = 4;
    //检测网络
    [self ChickStatus];
    
    // 添加到视图
    [self.view addSubview:self.tbv];
    
}
-(void)ChickStatus{
    //检测网络
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        if (status != RealStatusNotReachable) {
            // 如果有网进行网络请求
            [self netWorkRequest];
        }else{
            [SVProgressHUD showErrorText:@"网络不给力"];
            [SVProgressHUD dismissWithDelay:0.5];
        }
    }];
}

// 网络请求
-(void)netWorkRequest{
    
    [self.viewModel getBannerPhotoSuccess:^(StategyModel *  Mmodel) {
        
        [self.tbv.mj_header endRefreshing];
        if (Mmodel.success) {
            self.detailModel.photo = Mmodel.data[@"photo"];
            self.detailModel.photoID = Mmodel.data[@"id"];
            [self->_headV sd_setImageWithURL:[NSURL URLWithString:self.detailModel.photo]];
            // 刷新表格
            [self.tbv reloadData];
            [self.twoCell reloadInputViews];
        }
    } Failture:^(StategyModel *  errorModel) {
        [self.tbv.mj_header endRefreshing];
        //        [self.view showErrorText:errorModel.message];
    }];
    
    self.data = [NSMutableArray array];
    [self.wantViewModel getWantToSeeSuccess:^(WantToSeeModel * wantModel) {
        if (wantModel.success) {
            for (WantToSeeDetailModel  *detailModel in wantModel.data) {
                [self.data addObject:detailModel];
            }
            [self.tbv reloadData];
        }
    } Failture:^(WantToSeeModel * wantError) {
        //        BQLog(@"%d",wantError.success);
    }];
    
    [self.hotViewModel getHotSuccess:^(HotModel * hotModel) {
        //            BQLog(@"%@",hotModel);
        if (hotModel.success) {
            for (HotDetailModel *hotDetailModel in hotModel.data) {
                [self.hotData addObject:hotDetailModel];
            }
            [self.tbv reloadData];
        }
    } Failture:^(HotModel * hotError) {
        //        BQLog(@"%d",hotError.success);
    }];
    
    // 全部攻略
    [self.glViewModel getAllStrategySuccess:^(AllStrategyModel * glModel) {
        if (glModel.success) {
            self.glArr = glModel.data;
            for (AllStraDetailModel *glDetailModel in glModel.data) {
                [self.gldata addObject:glDetailModel];
            }
            [self.tbv reloadData];
            [self.twoCell reloadInputViews];
        }
    } Failture:^(AllStrategyModel * glError) {
        //        BQLog(@"%d",glError.success);
    }];
}
//刷新攻略数据
- (void)refreshStrategyWithType:(NSString *)strategyType {
    
    [self.flViewModel getFenLeiWithPageNum:page SizeNum:size strategyType:strategyType Success:^(FenLeiModel * flModel) {
        if (flModel.success) {
            
            self.flData = [[NSMutableArray alloc] initWithArray:flModel.data];
            
            if(flModel.data.count)
            {
                self->page ++;
            }
            // 刷新整个表格
            [self.tbv reloadData];
            
            // 注释的这两行代码是 刷新单个cell时用到的
            NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:3];
            [self.tbv reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        }
    } Failture:^(FenLeiModel * flError) {
        //        BQLog(@"%d",flError.success);
    }];
}


#pragma mark----懒加载
-(UIImageView *)headV{
    if (!_headV) {
        // 头部图片试图
        _headV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 170)];
    }
    return _headV;
}

-(UITableView *)tbv{
    if (!_tbv) {
        
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W , SCREEN_H - NAVIGATION_BAR_HEIGHT - TABBAR_BAR_HEIGHT) style:UITableViewStyleGrouped];
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        // 这三个属性是为了设置tableView在reloadData的时候出现抖动,闪动,漂移等问题
        _tbv.estimatedRowHeight = 0;
    
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
        // 将图片视图添加到表格头部
        _tbv.tableHeaderView = self.headV;
        
        // 下拉刷新
        _tbv.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self netWorkRequest];
            
        }];
        // 上拉查看更多
        _tbv.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            AllStraDetailModel *curentModel = [self.gldata objectAtIndex:0];
            [self refreshStrategyWithType:curentModel.value];
        }];
    }
    return _tbv;
}

#pragma mark -> 数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 3) {
        return self.flData.count;
    }else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 ){
        
        StrategyTableViewCell *cellOne = [StrategyTableViewCell cellWithTableView:tableView];
        
        [cellOne.leftBtn addTarget:self action:@selector(sectinOneClicked_left:) forControlEvents:UIControlEventTouchUpInside];
        [cellOne.rightBtn addTarget:self action:@selector(sectinOneClicked_right:) forControlEvents:UIControlEventTouchUpInside];
        
        [cellOne.leftImg sd_setImageWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@",[self.data firstObject].photo]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
        [cellOne.rightImg sd_setImageWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@",[self.data lastObject].photo]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
        
        cellOne.leftLab.text = [self.data firstObject].title;
        cellOne.rightLab.text = [self.data lastObject].title;
        
        return cellOne;
        
    }else if (indexPath.section == 1){
        
        StrategyTableViewCell *cellTwo = [StrategyTableViewCell cellWithTableView:tableView];
         [cellTwo.leftBtn addTarget:self action:@selector(sectinTwoClicked_left:) forControlEvents:UIControlEventTouchUpInside];
        [cellTwo.rightBtn addTarget:self action:@selector(sectinTwoClicked_right:) forControlEvents:UIControlEventTouchUpInside];
        
        cellTwo.titLab.text = @"本周最热";
        [cellTwo.leftImg sd_setImageWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@",[self.hotData firstObject].photo]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
        [cellTwo.rightImg sd_setImageWithURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@",[self.hotData lastObject].photo]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
        cellTwo.leftLab.text = [self.hotData firstObject].title;
        cellTwo.rightLab.text = [self.hotData lastObject].title;
        return cellTwo;
        
    }else if (indexPath.section == 2){
        
       StrategyOneTableViewCell *oneCell = [StrategyOneTableViewCell cellWithTableView:tableView];
        
        // 根据点击的按钮回调请求新数据
        // block块里的self都需要弱引用
        __weak typeof(self) weakSelf = self;
        oneCell.btnClickedBlock = ^(NSInteger index) {
            
            AllStraDetailModel *curentModel = [weakSelf.gldata objectAtIndex:index];
            [weakSelf refreshStrategyWithType:curentModel.value];
        };
        
        return oneCell;
        
    }else{
        
        StrategyTwoTableViewCell *twoCell = [StrategyTwoTableViewCell cellWithTableView:tableView];
        [twoCell.leftImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.flData[indexPath.row].photo]] placeholderImage:nil];
        twoCell.zhuLab.text = self.flData[indexPath.row].title;
        twoCell.fuLab.text = self.flData[indexPath.row].suitIntro;
        twoCell.numLab.text = [NSString stringWithFormat:@"%@",self.flData[indexPath.row].readNum];
        
#pragma 全部攻略刷新
//        BQLog(@"%@,%@,%@,%@",self.flData[indexPath.row].readNum,self.flData[indexPath.row].suitIntro,self.flData[indexPath.row].title,self.flData[indexPath.row].photo);
        

        return twoCell;
    }
}

// 设置每个cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 || indexPath.section == 1) {
        return 220;
    }else if (indexPath.section == 2){
        return 110;
    }else{
        return 160;
    }
    return 0;
}
// 设置页眉高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
// 设置页脚高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 10;
    }else if(section == 2){
        return 0.01;

    }else{
        return 0.01;
    }
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}

#pragma mark----自定义方法
-(void)sectinOneClicked_left:(UIButton *)leftSender{
//    BQLog(@"点击了一分区左按钮和lab");
    ReadViewController *readVC = [[ReadViewController alloc]init];
    readVC.idss = [self.data firstObject].titleID;
    readVC.videoId = [self.data firstObject].titleID;
    readVC.strategyId = [self.data firstObject].titleID;
    readVC.navTitleStr = [self.data firstObject].title;
    
    [self.navigationController pushViewController:readVC animated:YES];
    
}
-(void)sectinOneClicked_right:(UIButton *)rightSender{
    //    BQLog(@"您点击了一分区右按钮和lab");
    ReadViewController *readVC = [[ReadViewController alloc]init];
    readVC.idss = [self.data lastObject].titleID;
    readVC.videoId = [self.data lastObject].titleID;
    readVC.strategyId = [self.data lastObject].titleID;
    readVC.navTitleStr = [self.data lastObject].title;
    [self.navigationController pushViewController:readVC animated:YES];
    
}
-(void)sectinTwoClicked_left:(UIButton *)leftTrasSender{
//    BQLog(@"点击了二分区左按钮和lab");
    ReadViewController *readVC = [[ReadViewController alloc]init];
    readVC.idss = [self.data firstObject].titleID;
    readVC.videoId = [self.data firstObject].titleID;
    readVC.strategyId = [self.data firstObject].titleID;
    readVC.navTitleStr = [self.data firstObject].title;
    [self.navigationController pushViewController:readVC animated:YES];
    
}
-(void)sectinTwoClicked_right:(UIButton *)rightTrasSender{
//    BQLog(@"您点击了二分区右按钮和lab");
    ReadViewController *readVC = [[ReadViewController alloc]init];
    readVC.idss = [self.data lastObject].titleID;
    readVC.videoId = [self.data lastObject].titleID;
    readVC.strategyId = [self.data lastObject].titleID;
    readVC.navTitleStr = [self.data lastObject].title;
    [self.navigationController pushViewController:readVC animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 3) {
        ReadViewController *readVC = [[ReadViewController alloc]init];
        readVC.idss = [self.data firstObject].titleID;
        readVC.videoId = [self.data lastObject].titleID;
        readVC.strategyId = [self.data firstObject].titleID;
        [self.navigationController pushViewController:readVC animated:NO];
    }
}


-(StrategyViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[StrategyViewModel alloc] init];
    }
    return _viewModel;
}
-(StategyDetailModel *)detailModel{
    if (!_detailModel) {
        _detailModel = [[StategyDetailModel alloc] init];
    }
    return _detailModel;
}

-(WantToSeeViewModel *)wantViewModel{
    if (!_wantViewModel) {
        _wantViewModel = [[WantToSeeViewModel alloc]init];
    }
    return _wantViewModel;
}
-(WantToSeeDetailModel *)wantDetailModel{
    if (!_wantDetailModel) {
        _wantDetailModel = [[WantToSeeDetailModel alloc]init];
    }
    return _wantDetailModel;
}
//-(NSMutableArray<WantToSeeDetailModel *> *)data{
//    if (!_data) {
//        _data = [NSMutableArray array];
//    }
//    return _data;
//}
-(HotViewModel *)hotViewModel{
    if (!_hotViewModel) {
        _hotViewModel = [[HotViewModel alloc]init];
    }
    return _hotViewModel;
}
-(HotDetailModel *)hotDetailModel{
    if (!_hotDetailModel) {
        _hotDetailModel = [[HotDetailModel alloc]init];
    }
    return _hotDetailModel;
}
- (NSMutableArray<HotDetailModel *> *)hotData{
    if (!_hotData) {
        _hotData = [NSMutableArray array];
    }
    return _hotData;
}
-(AllStrategyViewModel *)glViewModel{
    if (!_glViewModel) {
        _glViewModel = [[AllStrategyViewModel alloc]init];
    }
    return _glViewModel;
}
-(NSMutableArray<AllStraDetailModel *> *)gldata{
    if (!_gldata) {
        _gldata = [NSMutableArray array];
    }
    return _gldata;
}
-(NSMutableArray *)glArr{
    if (!_glArr) {
        _glArr = [NSMutableArray array];
    }
    return _glArr;
}

-(FenLeiViewModel *)flViewModel{
    if (!_flViewModel) {
        _flViewModel = [[FenLeiViewModel alloc]init];
    }
    return _flViewModel;
}
-(FenLeiDetailModel *)flDetailModel{
    if (!_flDetailModel) {
        _flDetailModel = [[FenLeiDetailModel alloc]init];
    }
    return _flDetailModel;
}
-(NSMutableArray<FenLeiDetailModel *> *)flData{
    if (!_flData) {
        _flData = [NSMutableArray array];
    }
    return _flData;
}
@end
