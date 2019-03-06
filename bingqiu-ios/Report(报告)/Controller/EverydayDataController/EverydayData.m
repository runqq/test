//
//  EverydayData.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/31.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "EverydayData.h"
#import "JiLuKongJieMianView.h"
#import "EverydayDataCell.h"
#import "ShareViewController.h"
#import "ShareView.h"
#import "ChaKanDetailsController.h"

#import "EverydayTrainDetailModel.h"
#import "EverdayTrainViewModel.h"


@interface EverydayData ()<UITableViewDelegate,UITableViewDataSource>
{
    int size;
    int page;
    NSNumber *sizeNum;
    NSNumber *pageNum;
}

@property(nonatomic,strong)UITableView  *tbv;
@property(nonatomic,strong)JiLuKongJieMianView *kongJieMian;
@property(nonatomic , strong)UILabel    *lineLab;

@property(nonatomic,strong)UIView       *footView;
@property(nonatomic,strong)UIImageView  *zuoBiaoImg;
@property(nonatomic,strong)UILabel      *titleLab;

@property(nonatomic,strong)ChaKanDetailsController *chaKanVC;

@property(nonatomic,strong)EverydayTrainDetailModel *everyTrainDetailModel;
@property(nonatomic,strong)EverdayTrainViewModel    *everyTrainViewModel;
@property(nonatomic,strong)NSMutableArray <EverydayTrainDetailModel *>*everydayData;
@property(nonatomic,strong)NSMutableArray *Maaaaa;

@end

@implementation EverydayData

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
    // 背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    page = 1;
    size = 10;
    // 网络请求
    [self NetWorkRequest];
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
    self.everydayData = [NSMutableArray array];
    
}

-(void)NetWorkRequest{
    pageNum = @(page);
    sizeNum = @(size);
//    self.chaKanVC.yearss = @"";
//    self.chaKanVC.monthss = @"";
    [self.everyTrainViewModel getEveryDatTrainWithPageNo:pageNum PageSize:sizeNum yearStr:self.yearss MonthStr:self.monthss Success:^(EverydayTrainModel * everyDayTrainModel) {
        if (everyDayTrainModel.success) {
            for (EverydayTrainDetailModel *detailModel in everyDayTrainModel.data) {
                [self.everydayData addObject:detailModel];
            }
            if (self.everydayData.count == 0) {
                [self.view addSubview:self.kongJieMian];
            }else{
                [self.kongJieMian removeFromSuperview];
            }
            [self.tbv reloadData];
        }
    } Failture:^(EverydayTrainModel * everyDayTrainError) {
        
    }];
}

-(void)headerRefresh{
    self->page = page-1;
    
    if (self->page < 1) {
        self->page = 1;
    }
    
    pageNum = @(page);
    sizeNum = @(size);
    //    self.chaKanVC.yearss = @"";
    //    self.chaKanVC.monthss = @"";
    
    [self.everyTrainViewModel getEveryDatTrainWithPageNo:pageNum PageSize:sizeNum yearStr:self.yearss MonthStr:self.monthss Success:^(EverydayTrainModel * everyDayTrainModel) {
        if (everyDayTrainModel.success) {
            for (EverydayTrainDetailModel *detailModel in everyDayTrainModel.data) {
                [self.everydayData addObject:detailModel];
            }
            // 停止刷新
            [self.tbv.mj_header endRefreshing];
            if (self.everydayData.count == 0) {
                [self.view addSubview:self.kongJieMian];
            }else{
                [self.kongJieMian removeFromSuperview];
            }
            [self.tbv reloadData];
        }
    } Failture:^(EverydayTrainModel * everyDayTrainError) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
    }];
}

-(void)footerRefresh{
    
    pageNum = @(page);
    sizeNum = @(size);
    //    self.chaKanVC.yearss = @"";
    //    self.chaKanVC.monthss = @"";
    
    self.everydayData = [NSMutableArray array];
    
    [self.everyTrainViewModel getEveryDatTrainWithPageNo:pageNum PageSize:sizeNum yearStr:self.yearss MonthStr:self.monthss Success:^(EverydayTrainModel * everyDayTrainModel) {
        if (everyDayTrainModel.success) {
            
            if (everyDayTrainModel.data.count) {
                for (EverydayTrainDetailModel *detailModel in everyDayTrainModel.data) {
                    [self.everydayData addObject:detailModel];
                }
                self->page++;
            }
            // 停止刷新
            [self.tbv.mj_footer endRefreshing];
            [self.tbv reloadData];
            
        }
    } Failture:^(EverydayTrainModel * everyDayTrainError) {
        // 停止刷新
        [self.tbv.mj_footer endRefreshing];
    }];
}

#pragma mark --> 懒加载
-(JiLuKongJieMianView *)kongJieMian{
    if (!_kongJieMian) {
        _kongJieMian = [[JiLuKongJieMianView alloc]init];
    }
    return _kongJieMian;
}
-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 1)];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT) style:UITableViewStylePlain];
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
//            __weak typeof(self) weakself = self;
//            [weakself headerRefresh];
//            [weakself NetWorkRequest];
        }];
        // 上拉加载
        _tbv.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//            __weak typeof(self) weakself = self;
//            [weakself footerRefresh];
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
    return self.everydayData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EverydayDataCell *everydayCell = [tableView dequeueReusableCellWithIdentifier:@"everydayCell"];
    if (!everydayCell) {
        everydayCell = [[EverydayDataCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"everydayCell"];
    }
    everydayCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (self.everydayData.count) {
        everydayCell.dateLab.text = self.everydayData[indexPath.row].startTime;
        everydayCell.coachLab.text = [NSString stringWithFormat:@"教练%@",self.everydayData[indexPath.row].coach];
        everydayCell.titleLab.text = self.everydayData[indexPath.row].iceStadium;
        everydayCell.timeLab.text = self.everydayData[indexPath.row].trainTime;
        everydayCell.meterLab.text = [NSString stringWithFormat:@"%@m",self.everydayData[indexPath.row].allDistance];
    }

    return everydayCell;
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
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.lineLab;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return 0;
}
// 当开始滚动的时候隐藏顶部line
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.lineLab.hidden = YES;
}
// 当停止滚动的时候显示顶部line
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.lineLab.hidden = NO;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShareViewController *shareV = [[ShareViewController alloc]init];
    [self.navigationController pushViewController:shareV animated:YES];
}

-(EverydayTrainDetailModel *)everyTrainDetailModel{
    if (!_everyTrainDetailModel) {
        _everyTrainDetailModel = [[EverydayTrainDetailModel alloc]init];
    }
    return _everyTrainDetailModel;
}
-(EverdayTrainViewModel *)everyTrainViewModel{
    if (!_everyTrainViewModel) {
        _everyTrainViewModel = [[EverdayTrainViewModel alloc]init];
    }
    return _everyTrainViewModel;
}
//-(NSMutableArray<EverydayTrainDetailModel *> *)everydayData{
//    if (!_everydayData) {
//        _everydayData = [NSMutableArray array];
//    }
//    return _everydayData;
//}
-(NSMutableArray *)Maaaaa{
    if (!_Maaaaa) {
        _Maaaaa = [NSMutableArray array];
    }
    return _Maaaaa;
}

@end
