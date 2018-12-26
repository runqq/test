//
//  MyMedalController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/25.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MyMedalController.h"
#import "HeaderView.h"
#import "CustomMyMedalCollectionViewCell.h"// 冰场霸主
#import "ChaoShenZhiLvCollectionViewCell.h"// 超神之旅

#import "MyModelModel.h"
#import "MyModelDetailModel.h"
#import "DetailModel.h"
#import "MyModelViewModel.h"


@interface MyMedalController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) HeaderView *headV;
@property(nonatomic,strong) UITableView *tbv;
@property(nonatomic,strong) UILabel *titlLab;
@property(nonatomic,strong) UILabel *lineLab;
@property(nonatomic,strong) UILabel *titlLab1;
@property(nonatomic,strong) UILabel *lineLab1;

@property(nonatomic,strong)UICollectionView *collectionV;// 冰场霸主
@property(nonatomic,strong)UICollectionView *collectionV1;// 超神之旅
@property(nonatomic,strong)CustomMyMedalCollectionViewCell *myMedalCell;
@property(nonatomic,strong)ChaoShenZhiLvCollectionViewCell *cszlMedalCell;


@property(nonatomic,strong)MyModelModel *myModelModel;
@property(nonatomic,strong)MyModelDetailModel *myModelDetailModel;
@property(nonatomic,strong)DetailModel *detailModle;
@property(nonatomic,strong)MyModelViewModel *myMedalViewModel;
@property(nonatomic,strong)NSMutableArray *myMedalArray;
@property(nonatomic,strong)NSMutableArray  *distanceArr;
@property(nonatomic,strong)NSMutableArray  *timeArr;;



@end

@implementation MyMedalController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 隐藏NavigationBar和tabBar
    self.navigationController.navigationBar.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 网络解析
    [self netWorkRequest];
    // 将表格添加到视图
    [self.view addSubview:self.tbv];
    // 点击事件
    [self addAction];
    
}

-(void)netWorkRequest{
    self.myMedalArray = [NSMutableArray array];
    [self.myMedalViewModel getMyModelDataWithSuccess:^(MyModelModel * myModelModel) {
        if (myModelModel.success) {
            for (MyModelDetailModel *myMedalDetailModel in myModelModel.data) {
                [self.myMedalArray addObject:myMedalDetailModel];
            }
            [self.tbv reloadData];
        }
    } Failture:^(MyModelModel * _Nonnull myModelError) {
//        [self.view showErrorText:myModelError.message];
    }];
}

#pragma mark --> 懒加载
-(HeaderView *)headV{
    if (!_headV) {
        _headV = [[HeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 190)];
        _headV.backgroundColor = [UIColor colorWithHexString:@"#384c60"];
    }
    return _headV;
}
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) style:UITableViewStyleGrouped];
        _tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        if (@available(iOS 11.0, *)) {
            _tbv.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets =  NO;
        }
        // 设置代理和数据源
        _tbv.delegate = self;
        _tbv.dataSource = self;
        // 将headV添加到表格头部
        _tbv.tableHeaderView = self.headV;
    }
    return _tbv;
}
-(UILabel *)titlLab{
    if (!_titlLab) {
        _titlLab = [[UILabel alloc]initWithFrame:CGRectMake(25, 15, 300, 16)];
//        _titlLab.text = @"冰场霸主(上冰时间)";
        _titlLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _titlLab.font = BQBOLDFONT(16);
    }
    return _titlLab;
}
-(UILabel *)lineLab{
    if (!_lineLab) {
        _lineLab = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_W-345)/2, 49, 345, 0.5)];
        _lineLab.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab;
}
-(UILabel *)titlLab1{
    if (!_titlLab1) {
        _titlLab1 = [[UILabel alloc]initWithFrame:CGRectMake(25, 15, 300, 16)];
//        _titlLab1.text = @"超神之旅(滑行距离)";
        _titlLab1.textColor = [UIColor colorWithHexString:@"#333333"];
        _titlLab1.font = BQBOLDFONT(16);
    }
    return _titlLab1;
}
-(UILabel *)lineLab1{
    if (!_lineLab1) {
        _lineLab1 = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_W-345)/2, 49, 345, 0.5)];
        _lineLab1.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _lineLab1;
}
#pragma mark --> UITableViewDelegate And UITableViewDataSource
// 几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.myMedalArray.count;
}
// 几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
// 设置cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        MyModelDetailModel * myModelDetailMode;
        _distanceArr = [NSMutableArray array];
        if (self.myMedalArray.count) {
            myModelDetailMode = self.myMedalArray[0];
            self.titlLab.text = myModelDetailMode.medalTypeText;
            for (DetailModel *distanceDetail in myModelDetailMode.distanceList) {
                [_distanceArr addObject:distanceDetail];
            }
            BQLog(@"超深之旅:%@",_distanceArr);
        }else{
            self.titlLab.text = @"超神之旅(滑行距离)";
        }
        [cell.contentView addSubview:self.titlLab];
        [cell.contentView addSubview:self.lineLab];
        
        //UICollectionViewLayout  --流水布局对象
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.estimatedItemSize = CGSizeMake([[UIScreen mainScreen]bounds].size.width, 165);
        //设置最小的行间距
        layout.minimumLineSpacing = 0;
        //设置最小的列间距
        layout.minimumInteritemSpacing = 0;
        //单元格大小
        layout.itemSize = CGSizeMake(SCREEN_W/3 , 165);
        //滚动方向
        //UICollectionViewScrollDirectionVertical(垂直)
        //UICollectionViewScrollDirectionHorizontal(水平)
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //创建网格
        self.collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_W, 520) collectionViewLayout:layout];
        //        _collectionV.scrollEnabled = NO;
        //网格背景色
        self.collectionV.backgroundColor = [UIColor whiteColor];
        //注册cell
        [self.collectionV registerClass:[CustomMyMedalCollectionViewCell class] forCellWithReuseIdentifier:@"bingChangBaZhu"];
        //设置代理
        self.collectionV.delegate = self;
        //设置数据源
        self.collectionV.dataSource = self;
        
        [cell.contentView addSubview:self.collectionV];
        
        return cell;
        
    }else{

        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (!cell1) {
            cell1 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        
        MyModelDetailModel * myModelDetailMode;
        _timeArr = [NSMutableArray array];
        if (self.myMedalArray.count) {
            myModelDetailMode = self.myMedalArray[1];
            self.titlLab1.text = myModelDetailMode.medalTypeText;
            for (DetailModel  *timeModel in myModelDetailMode.secondsList) {
                [_timeArr addObject:timeModel];
            }
            BQLog(@"冰场霸主:%@",_timeArr);
            
        }else{
            self.titlLab1.text = @"冰场霸主(上冰时间)";
        }
        [cell1.contentView addSubview:self.titlLab1];
        [cell1.contentView addSubview:self.lineLab1];
        
        //UICollectionViewLayout  --流水布局对象
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //设置最小的行间距
        layout.minimumLineSpacing = 0;
        //设置最小的列间距
        layout.minimumInteritemSpacing = 0;
        //单元格大小
        layout.itemSize = CGSizeMake(SCREEN_W/3 , 165);
        //滚动方向
        //UICollectionViewScrollDirectionVertical(垂直)
        //UICollectionViewScrollDirectionHorizontal(水平)
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //创建网格
        self.collectionV1 = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_W, 520) collectionViewLayout:layout];
        //        _collectionV.scrollEnabled = NO;
        //网格背景色
        self.collectionV1.backgroundColor = [UIColor whiteColor];
        //注册cell
        [self.collectionV1 registerClass:[ChaoShenZhiLvCollectionViewCell class] forCellWithReuseIdentifier:@"chaoShenZhiLv"];
        //设置代理
        self.collectionV1.delegate = self;
        //设置数据源
        self.collectionV1.dataSource = self;
        
        [cell1.contentView addSubview:self.collectionV1];
        
        // 计算获得的勋章的个数
        self.headV.zhuLab.text = [NSString stringWithFormat:@"已获得%lu个勋章",(unsigned long)_distanceArr.count + _timeArr.count];
        self.headV.fuLab.text = [NSString stringWithFormat:@"马上运动起来,解锁你的第%lu块勋章",((unsigned long)_distanceArr.count + _timeArr.count)+1];
        
        return cell1;
    }
    
}
#pragma mark ->
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (collectionView == self.collectionV) {
        return _distanceArr.count;
    }else{
        return _timeArr.count;
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == self.collectionV) {
        
        _myMedalCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bingChangBaZhu" forIndexPath:indexPath];
        NSString *photoStr = [_distanceArr[indexPath.row] objectForKey:@"photo"];
        [_myMedalCell.bigImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",photoStr]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
        
        _myMedalCell.smallImg.image = [UIImage imageNamed:@"shadow_medal"];
        _myMedalCell.zhuLab.text = [_distanceArr[indexPath.row] objectForKey:@"name"];
        _myMedalCell.fuLab.text = [NSString stringWithFormat:@"%@",[_distanceArr[indexPath.row] objectForKey:@"minValue"]];
        
        return _myMedalCell;
        
    }else{
        
        _cszlMedalCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"chaoShenZhiLv" forIndexPath:indexPath];
        
        NSString *photoStr1 = [_timeArr[indexPath.row] objectForKey:@"photo"];
        [_cszlMedalCell.bigImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",photoStr1]] placeholderImage:[UIImage imageNamed:@"yuanmingyuan"]];
        _cszlMedalCell.smallImg.image = [UIImage imageNamed:@"shadow_medal"];
        _cszlMedalCell.zhuLab.text = [_timeArr[indexPath.row] objectForKey:@"name"];
        _cszlMedalCell.fuLab.text = [NSString stringWithFormat:@"%@",[_timeArr[indexPath.row] objectForKey:@"minValue"]];
        
        return _cszlMedalCell;
    }
}
// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 550;
}

// 设置页眉高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 30;
    }
    return 0.01;
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

// 实现按钮的点击事件
- (void)addAction{
    [self.headV.goBackBtn addTarget:self action:@selector(cancleClick) forControlEvents:UIControlEventTouchUpInside];
}
-(void)cancleClick{
    [self dismissViewControllerAnimated:NO completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}

-(MyModelModel *)myModelModel{
    if (!_myModelModel) {
        _myModelModel = [[MyModelModel alloc]init];
    }
    return _myModelModel;
}
-(MyModelDetailModel *)myModelDetailModel{
    if (!_myModelDetailModel) {
        _myModelDetailModel = [[MyModelDetailModel alloc]init];
    }
    return _myModelDetailModel;
}
-(MyModelViewModel *)myMedalViewModel{
    if (!_myMedalViewModel) {
        _myMedalViewModel = [[MyModelViewModel alloc]init];
    }
    return _myMedalViewModel;
}
-(DetailModel *)detailModle{
    if (!_detailModle) {
        _detailModle = [[DetailModel alloc]init];
    }
    return _detailModle;
}

@end
