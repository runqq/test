//
//  MessageViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/30.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageTableViewCell.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tbv;

@end

@implementation MessageViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // 即将消失的时候显示导航条
    self.navigationController.navigationBar.hidden = NO;
    // 显示tabBar
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 导航标题
    UILabel  *titLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
    titLab.text = @"消息";
    titLab.textAlignment = NSTextAlignmentCenter;
    titLab.textColor = [UIColor colorWithHexString:@"#333333"];
    titLab.font = BQBOLDFONT(18);
    
    self.navigationItem.titleView = titLab;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 设置背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    
    
    // 将表格添加到主视图
    [self.view addSubview:self.tbv];
    
}

#pragma mark --> 按钮的点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark --> 懒加载
-(UITableView *)tbv{
    if (!_tbv) {
        // 初始化表格
        _tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - TABBAR_BAR_HEIGHT) style:UITableViewStyleGrouped];
        _tbv.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
        
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

#pragma mark --> 代理和数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        MessageTableViewCell *messageCell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
        if (!messageCell) {
            messageCell = [[MessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"messageCell"];
        }
        messageCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return messageCell;
        
    }else{
        
        MessageTableViewCell *messageCell = [tableView dequeueReusableCellWithIdentifier:@"messageCell"];
        if (!messageCell) {
            messageCell = [[MessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"messageCell"];
        }
        messageCell.selectionStyle = UITableViewCellSelectionStyleNone;
        messageCell.photoImg.image = [UIImage imageNamed:@"program_mes_icon"];
        messageCell.titlLab.text = @"活动";
        messageCell.subLab.text = @"夏季训练营开始了,快来参加吧.";
        return messageCell;
    }
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 73;
}

// 设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return 0;
}



@end
