//
//  ChengWeiXingQiuVIPViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/9.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ChengWeiXingQiuVIPViewController.h"
#import "ChongZhiJinECollectionViewCell.h"
#import "OneView.h"
#import "TwoView.h"
#import "FourView.h"
#import "FiveView.h"
#import "PaySuccessViewController.h"

#import "BecomeVIPDetailModel.h"
#import "BecomeVIPViewModel.h"


@interface ChengWeiXingQiuVIPViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UILabel *navTitleLab;
@property(nonatomic,strong)UITableView *tbv;
@property(nonatomic,strong)OneView *oneV;
@property(nonatomic,strong)TwoView *twoV;
@property(nonatomic,strong)FourView *fourV;
@property(nonatomic,strong)FiveView *fiveV;

@property(nonatomic,strong)UIButton *tiJiaoBtn;

@property(nonatomic,strong)BecomeVIPDetailModel *becomeVIPdetailModel;
@property(nonatomic,strong)BecomeVIPViewModel *becomeVIPviewModel;
@property(nonatomic,strong)NSMutableArray <BecomeVIPDetailModel *>*data;

@end

@implementation ChengWeiXingQiuVIPViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // tabbar不隐藏
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 导航标题
    self.navigationItem.titleView = self.navTitleLab;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    
    // 网络解析
    [self netWorkRequest];
    
    // 添加表格
    [self.view addSubview:self.tbv];
    // 提交按钮
    [self.view addSubview:self.tiJiaoBtn];
    
}

-(void)netWorkRequest{
    
    self.data = [NSMutableArray array];
    [self.becomeVIPviewModel getVIPWithDataSuccess:^(BecomeVIPModel * becomeVIPModel) {
        if (becomeVIPModel.success) {
            for (BecomeVIPDetailModel *detailModel in becomeVIPModel.data) {
                [self.data addObject:detailModel];
            }
            [self.tbv reloadData];
        }
    } Failture:^(BecomeVIPModel * becomeVIPError) {
        
    }];
    
}

#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark --> 懒加载
-(UILabel *)navTitleLab{
    if (!_navTitleLab) {
        // 导航标题
        _navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _navTitleLab.text = @"星球VIP";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT - 65) style:UITableViewStyleGrouped];
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
        
    }
    return _tbv;
}
-(UIButton *)tiJiaoBtn{
    if (!_tiJiaoBtn) {
        _tiJiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _tiJiaoBtn.frame = CGRectMake(0, SCREEN_H-50, SCREEN_W, 50);
        _tiJiaoBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        [_tiJiaoBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_tiJiaoBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _tiJiaoBtn.titleLabel.font = BQBOLDFONT(18);
        [_tiJiaoBtn addTarget:self action:@selector(tiJiaoBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tiJiaoBtn;
}
-(void)tiJiaoBtnClick:(UIButton *)send{
    PaySuccessViewController *paySuccessVC = [[PaySuccessViewController alloc]init];
    [self.navigationController pushViewController:paySuccessVC animated:YES];
//    UINavigationController *paySuccessNav = [[UINavigationController alloc]initWithRootViewController:paySuccessVC];
//    [self presentViewController:paySuccessNav animated:NO completion:nil];
}
#pragma mark --> 代理和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UITableViewCell *oneCell = [tableView dequeueReusableCellWithIdentifier:@"oneCell"];
        if (!oneCell) {
            oneCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"oneCell"];
        }
        oneCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [oneCell.contentView addSubview:self.oneV];
        return oneCell;
        
    }else if (indexPath.section == 1){
        
        UITableViewCell *twoCell = [tableView dequeueReusableCellWithIdentifier:@"twoCell"];
        if (!twoCell) {
            twoCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"twoCell"];
        }
        twoCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [twoCell.contentView addSubview:self.twoV];
        return twoCell;
        
    }else if (indexPath.section == 2){
        
        UITableViewCell *threeCell = [tableView dequeueReusableCellWithIdentifier:@"threeCell"];
        if (!threeCell) {
            threeCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"threeCell"];
        }
        threeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        UILabel *titLab = [[UILabel alloc]initWithFrame:CGRectMake(15, 17, 200, 16)];
        titLab.text = @"请选择充值金额";
        titLab.textColor = [UIColor colorWithHexString:@"#333333"];
        titLab.font = BQFONT(16);
        [threeCell.contentView addSubview:titLab];
        
        //UICollectionViewLayout  --流水布局对象
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //设置最小的行间距
        layout.minimumLineSpacing = 5;
        //设置最小的列间距
        layout.minimumInteritemSpacing = 0;
        //单元格大小
        layout.itemSize = CGSizeMake(112 , 86);
        //滚动方向
        //UICollectionViewScrollDirectionVertical(垂直)
        //UICollectionViewScrollDirectionHorizontal(水平)
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //创建网格
        UICollectionView *collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(15, 50, SCREEN_W-30, 200) collectionViewLayout:layout];
        collectionV.scrollEnabled = NO;
        //网格背景色
        collectionV.backgroundColor = [UIColor whiteColor];
        //注册cell
        [collectionV registerClass:[ChongZhiJinECollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
        //设置代理
        collectionV.delegate = self;
        //设置数据源
        collectionV.dataSource = self;
        
        [threeCell.contentView addSubview:collectionV];
        
        return threeCell;
        
    }else if (indexPath.section == 3){
        UITableViewCell *fourCell = [tableView dequeueReusableCellWithIdentifier:@"fourCell"];
        if (!fourCell) {
            fourCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fourCell"];
        }
        fourCell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.fourV = [[FourView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 140)];
        [fourCell.contentView addSubview:self.fourV];
        return fourCell;
        
    }else{
        UITableViewCell *fiveCell = [tableView dequeueReusableCellWithIdentifier:@"fiveCell"];
        if (!fiveCell) {
            fiveCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fiveCell"];
        }
        fiveCell.selectionStyle = UITableViewCellSelectionStyleNone;
        fiveCell.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        self.fiveV = [[FiveView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 190)];
        [fiveCell.contentView addSubview:self.fiveV];
        
        return fiveCell;
    }
}
#pragma mark ->UICollectionView的代理和数据源方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.data.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ChongZhiJinECollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 4;
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = [UIColor colorWithHexString:@"#bfbfbf"].CGColor;
    cell.monthLab.text = [NSString stringWithFormat:@"%@会员",self.data[indexPath.row].name];
    cell.moneyLab.text = [NSString stringWithFormat:@"¥ %.2f",self.data[indexPath.row].price];
    cell.lab.text = [NSString stringWithFormat:@"¥ %.2f/月",self.data[indexPath.row].aveMonthlyAmount];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ChongZhiJinECollectionViewCell *cell = (ChongZhiJinECollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.borderColor = [UIColor colorWithHexString:@"#188bf0"].CGColor;
    cell.backgroundColor = [UIColor colorWithHexString:@"#e7f3fd"];
    cell.monthLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
    cell.moneyLab.textColor = [UIColor colorWithHexString:@"#188bf0"];
    cell.lab.textColor = [UIColor colorWithHexString:@"#188bf0"];
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    ChongZhiJinECollectionViewCell *cell = (ChongZhiJinECollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.layer.borderColor = [UIColor colorWithHexString:@"#bfbfbf"].CGColor;
    cell.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
    cell.monthLab.textColor = [UIColor colorWithHexString:@"#333333"];
    cell.moneyLab.textColor = [UIColor colorWithHexString:@"#333333"];
    cell.lab.textColor = [UIColor colorWithHexString:@"#666666"];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 80;
    }else if (indexPath.section == 1){
        return 110;
    }else if (indexPath.section == 2){
        return 250;
    }else if (indexPath.section == 3){
        return 140;
    }else{
        return 190;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 4) {
        return 0.01;
    }else{
        return 10;
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

-(OneView *)oneV{
    if (!_oneV) {
        _oneV = [[OneView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 80)];
    }
    return _oneV;
}
-(TwoView *)twoV{
    if (!_twoV) {
        _twoV = [[TwoView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 110)];
    }
    return _twoV;
}

-(BecomeVIPDetailModel *)becomeVIPdetailModel{
    if (!_becomeVIPdetailModel) {
        _becomeVIPdetailModel = [[BecomeVIPDetailModel alloc]init];
    }
    return _becomeVIPdetailModel;
}
-(BecomeVIPViewModel *)becomeVIPviewModel{
    if (!_becomeVIPviewModel) {
        _becomeVIPviewModel = [[BecomeVIPViewModel alloc]init];
    }
    return _becomeVIPviewModel;
}

@end
