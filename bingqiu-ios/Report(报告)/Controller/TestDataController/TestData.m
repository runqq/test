//
//  TestData.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/31.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "TestData.h"
#import "JiLuKongJieMianView.h"
#import "TestDataCell.h"
#import "ShareViewController.h"

#import "CeShiDataDetailModel.h"
#import "CeShiDataViewModel.h"

@interface TestData ()<UITableViewDelegate,UITableViewDataSource>
{
    int size;
    int page;
    NSNumber *sizeNum;
    NSNumber *pageNum;
}

@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)JiLuKongJieMianView *kongJieMian;

@property(nonatomic,strong)UIView       *footView;
@property(nonatomic,strong)UIImageView  *zuoBiaoImg;
@property(nonatomic,strong)UILabel      *titleLab;

@property(nonatomic,strong)CeShiDataDetailModel *ceShiDetailModel;
@property(nonatomic,strong)CeShiDataViewModel *ceShiViewModel;
@property(nonatomic,strong)NSMutableArray <CeShiDataDetailModel *>*ceShiData;

@end

@implementation TestData

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
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    
    page = 1;
    size = 2;
    
    // 网络请求
    [self NetWorkRequest];
    
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
}

-(void)NetWorkRequest{
    self.ceShiData = [NSMutableArray array];
    pageNum = @(page);
    sizeNum = @(size);
    [self.ceShiViewModel getCeShiDataWithPageNum:pageNum pagesize:sizeNum yearStr:self.yearss MonthStr:self.monthss Success:^(CeShiDataModel *  ceShiModel) {
        if (ceShiModel.success) {
            for (CeShiDataDetailModel *detailModel in ceShiModel.data) {
                [self.ceShiData addObject:detailModel];
            }
            if (self.ceShiData.count == 0) {
                [self.view addSubview:self.kongJieMian];
            }else{
                [self.kongJieMian removeFromSuperview];
            }
            [self.tbv reloadData];
        }
    } Failture:^(CeShiDataModel *  ceShiError) {
//        [self.view showErrorText:ceShiError.message];
    }];
}
-(void)headerRefresh{
    
    self.ceShiData = [NSMutableArray array];
    self->page = page-1;
    if (self->page < 1) {
        self->page = 1;
    }
    pageNum = @(page);
    sizeNum = @(size);
    [self.ceShiViewModel getCeShiDataWithPageNum:pageNum pagesize:sizeNum yearStr:@"" MonthStr:@"" Success:^(CeShiDataModel *  ceShiModel) {
        if (ceShiModel.success) {
            for (CeShiDataDetailModel *detailModel in ceShiModel.data) {
                [self.ceShiData addObject:detailModel];
            }
            // 停止刷新
            [self.tbv.mj_header endRefreshing];
            // 判断数组返回的格式是否为零
            if (self.ceShiData.count == 0) {
                [self.view addSubview:self.kongJieMian];
            }else{
                [self.kongJieMian removeFromSuperview];
            }
            [self.tbv reloadData];
        }
    } Failture:^(CeShiDataModel *  ceShiError) {
        // 停止刷新
        [self.tbv.mj_header endRefreshing];
    }];
    
}
-(void)footRefresh{
    self.ceShiData = [NSMutableArray array];
    self->page = self->page+1;
    pageNum = @(page);
    sizeNum = @(size);
    [self.ceShiViewModel getCeShiDataWithPageNum:pageNum pagesize:sizeNum yearStr:@"" MonthStr:@"" Success:^(CeShiDataModel *  ceShiModel) {
        if (ceShiModel.success) {
            for (CeShiDataDetailModel *detailModel in ceShiModel.data) {
                [self.ceShiData addObject:detailModel];
            }
            // 停止刷新
            [self.tbv.mj_footer endRefreshing];
            if (self.ceShiData.count == 0) {
                [self.view addSubview:self.kongJieMian];
            }else{
                [self.kongJieMian removeFromSuperview];
            }
            [self.tbv reloadData];
        }
    } Failture:^(CeShiDataModel *  ceShiError) {
        // 停止刷新
        [self.tbv.mj_footer endRefreshing];
//        [self.view showErrorText:ceShiError.message];
    }];
}


#pragma mark --> 懒加载
-(JiLuKongJieMianView *)kongJieMian{
    if (!_kongJieMian) {
        _kongJieMian = [[JiLuKongJieMianView alloc]init];
    }
    return _kongJieMian;
}
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
            __weak typeof(self)weakSelf = self;
            [weakSelf headerRefresh];
            
        }];
        _tbv.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            __weak typeof(self)weakSelf = self;
            [weakSelf footRefresh];
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
    return self.ceShiData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TestDataCell *testCell = [tableView dequeueReusableCellWithIdentifier:@"testCell"];
    if (!testCell) {
        testCell = [[TestDataCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"testCell"];
    }
    testCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (self.ceShiData.count) {
        testCell.dateLab.text = self.ceShiData[indexPath.row].startTime;
        testCell.titleLab.text = self.ceShiData[indexPath.row].iceStadium;
        testCell.timeLab.text = self.ceShiData[indexPath.row].score;
        testCell.meterLab.text = [NSString stringWithFormat:@"%@",self.ceShiData[indexPath.row].sorting];
    }
    
    return testCell;
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
-(CeShiDataDetailModel *)ceShiDetailModel{
    if (!_ceShiDetailModel) {
        _ceShiDetailModel = [[CeShiDataDetailModel alloc]init];
    }
    return _ceShiDetailModel;
}
-(CeShiDataViewModel *)ceShiViewModel{
    if (!_ceShiViewModel) {
        _ceShiViewModel = [[CeShiDataViewModel alloc]init];
    }
    return _ceShiViewModel;
}
-(NSMutableArray<CeShiDataDetailModel *> *)ceShiData{
    if (!_ceShiData) {
        _ceShiData = [NSMutableArray array];
    }
    return _ceShiData;
}

@end
