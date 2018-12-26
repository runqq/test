//
//  ConsultViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "InformationViewController.h"
#import "ZiXunKongJieMian.h"
#import "ReadDetailViewController.h"
#import "TopTableViewCell.h"
#import "InformationTableViewCell.h"
#import "ShareViewController.h"

#import "ConsultViewModel.h"
#import "ConsultDetailModel.h"

#import "ListDetailModel.h"
#import "ConsultListViewModel.h"

@interface InformationViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    int page;
    int size;
    NSNumber *pageNum;
    NSNumber *sizeNum;
    NSInteger  indd;
    
}
@property(nonatomic,strong)ZiXunKongJieMian *ziXunKongJieMianView;
@property(nonatomic,strong)TopTableViewCell *topView;
@property(nonatomic,strong)UITableView *mainTable;


@property(nonatomic , strong)ConsultViewModel   *consultViewModel;
@property(nonatomic , strong)NSMutableArray <ConsultDetailModel *>*data;
@property(nonatomic , strong)NSMutableArray *consultArr;

@property(nonatomic,strong)ConsultListViewModel *listVM;
@property(nonatomic,strong)ListDetailModel *detailModel;
@property(nonatomic,strong)NSMutableArray <ListDetailModel *>*listData;


@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    page = 1;
    size = 10;
    pageNum = @(page);
    sizeNum = @(size);
    
    //先判断网络状态
    [self ChickStatus];
    // 将表格添加到主视图
    [self.view addSubview:self.mainTable];
    
}
-(void)ChickStatus{
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        if (status != RealStatusNotReachable) {
            //有网的话进行请求
            [self postNet];
        }else{
            [SVProgressHUD showErrorText:@"网络不给力"];
            [SVProgressHUD dismissWithDelay:0.5];
        }
    }];
}

-(void)postNet{
    
    self.data = [NSMutableArray array];
    
    [self.consultViewModel getsubTitleContestWithSuccess:^(ConsultModel * sultModel) {
        [self.mainTable.mj_header endRefreshing];
        if (sultModel.success) {
            self.consultArr = sultModel.data;
//            BQLog(@"数组返回的个数%@",self.consultArr);
            for (ConsultDetailModel *consultDetaiModel in sultModel.data) {
                [self.data addObject:consultDetaiModel];
            }
            [self.mainTable reloadData];   
            ConsultDetailModel *currentModel = [sultModel.data firstObject];
            [self refreshStrategyWithType:currentModel.value];
        }
    } Failture:^(ConsultModel *  consultError) {
//          BQLog(@"%d",consultError.success);
        [self.mainTable.mj_header endRefreshing];
    }];
}
//刷新资讯列表数据
- (void)refreshStrategyWithType:(NSString *)newsClassify {
    
    self.listData = [NSMutableArray array];
    
    [self.listVM getConsultListWithPageNum:pageNum SizeNum:sizeNum NewsClassify:newsClassify Success:^(ConsultListModel * listModel) {
        
        [self.mainTable.mj_footer endRefreshing];
        if (listModel.success) {
            self.listData = [[NSMutableArray alloc] initWithArray:listModel.data];
            
            if (self.listData.count == 0) {
                [self.view addSubview:self.ziXunKongJieMianView];
                
            }else{
                [self.ziXunKongJieMianView removeFromSuperview];
            }
            [self.mainTable reloadData];
        }
    } Failture:^(ConsultListModel * listError) {
        [self.mainTable.mj_footer endRefreshing];
    }];
}

#pragma mark --> 懒加载
-(ZiXunKongJieMian *)ziXunKongJieMianView{
    if (!_ziXunKongJieMianView) {
        _ziXunKongJieMianView = [[ZiXunKongJieMian alloc]init];
    }
    return _ziXunKongJieMianView;
}
-(UITableView *)mainTable{
    if (!_mainTable) {
        // 初始化表格
        _mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT) style:UITableViewStyleGrouped];
        // 判断版本号
        if (@available(iOS 11.0, *)) {
            _mainTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        // 设置代理和数据源
        _mainTable.delegate=self;
        _mainTable.dataSource=self;
        // 分割线样式
        _mainTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // 下拉刷新
        _mainTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self postNet];
        }];
        // 上拉加载更多
        _mainTable.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [self postNet];
        }];
        
    }
    
    return _mainTable;
}
#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.listData.count;
    }
}

-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    
    if (indexPath.section == 0) {
        TopTableViewCell *topCell = [TopTableViewCell cellWithTableVIew:tableView];
        topCell.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        // 根据点击的按钮回调请求新数据
        __weak typeof(self) weakSelf = self;
        topCell.btnClickBlock = ^(NSInteger index) {
            if (weakSelf.data.count) {
                ConsultDetailModel *currentModel = [weakSelf.data objectAtIndex:index];
                [weakSelf refreshStrategyWithType:currentModel.value];
            }
        };
        return topCell;
        
    }else{
        
        InformationTableViewCell *cell = [InformationTableViewCell cellWithTableVIew:tableView];
        [cell.imageV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.listData[indexPath.row].photo]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
        cell.titleLabel.text = self.listData[indexPath.row].title;
        cell.readLabel.text = [NSString stringWithFormat:@"%@",self.listData[indexPath.row].readNum];
        cell.zanLabel.text = [NSString stringWithFormat:@"%@",self.listData[indexPath.row].upNum];
        
        return cell;
    }
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 44;
        
    }else{
        // 设置行高
        return 104;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return 0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    if (indexPath.section == 1) {
        
        ReadDetailViewController *detailVC = [[ReadDetailViewController alloc]init];
        [self.navigationController pushViewController:detailVC animated:NO];
    }
    if (indexPath.row == 0) {
        
    }else{
    ReadDetailViewController *detailVC = [[ReadDetailViewController alloc]init];
    [self.navigationController pushViewController:detailVC animated:NO];
    }
//    ShareViewController *shareV = [[ShareViewController alloc]init];
//    [self.navigationController pushViewController:shareV animated:YES];
  
}
-(NSMutableArray<ConsultDetailModel *>*)data{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}
-(ConsultViewModel *)consultViewModel{
    if (!_consultViewModel) {
        _consultViewModel = [[ConsultViewModel alloc] init];
    }
    return _consultViewModel;
}
-(NSMutableArray *)consultArr{
    if (!_consultArr) {
        _consultArr = [NSMutableArray array];
    }
    return _consultArr;
}

-(ListDetailModel *)detailModel{
    if (!_detailModel) {
        _detailModel = [[ListDetailModel alloc]init];
    }
    return _detailModel;
}
-(ConsultListViewModel *)listVM{
    if (!_listVM) {
        _listVM = [[ConsultListViewModel alloc]init];
    }
    return _listVM;
}
-(NSMutableArray<ListDetailModel *> *)listData{
    if (!_listData) {
        _listData = [NSMutableArray array];
    }
    return _listData;
}



@end
