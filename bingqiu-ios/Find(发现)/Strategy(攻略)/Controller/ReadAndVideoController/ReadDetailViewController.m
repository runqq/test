//
//  ReadDetailViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ReadDetailViewController.h"
#import "ReadDetailBottomView.h"

@interface ReadDetailViewController ()

@property(nonatomic,strong)UILabel *topLine;
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIButton *shareBtn;
@property(nonatomic,strong)ReadDetailBottomView *readDetailBottomView;


@end

@implementation ReadDetailViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.shareBtn];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.readDetailBottomView];
    
    [self addLayOut];
    
    [self.readDetailBottomView.dianZanBtn addTarget:self action:@selector(dianZanBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)addLayOut{
    __weak typeof(self) weakSelf = self;
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.readDetailBottomView.mas_left).with.offset(15);
    }];
}

-(UILabel *)topLine{
    if (!_topLine) {
        _topLine = [[UILabel alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, 0.5)];
        _topLine.backgroundColor = [UIColor colorWithHexString:@"#e2e2e2"];
    }
    return _topLine;
}
-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [[UIButton alloc]init];
        _backBtn.frame = CGRectMake(0, 0, 30, 30);
        [_backBtn setImage:[UIImage imageNamed:@"nav_back_blue"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}
-(UIButton *)shareBtn{
    if (!_shareBtn) {
        _shareBtn = [[UIButton alloc]init];
        [_shareBtn setImage:[UIImage imageNamed:@"nav_share_blue"] forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}

-(ReadDetailBottomView *)readDetailBottomView{
    if (!_readDetailBottomView) {
        _readDetailBottomView = [[ReadDetailBottomView alloc]initWithFrame:CGRectMake(0, SCREEN_H - 49, SCREEN_W, 49)];
    }
    return _readDetailBottomView;
}

-(void)leftBtnClick:(UIButton *)backBtn{
    [self.navigationController popViewControllerAnimated:NO];
}
-(void)rightBtnClick:(UIButton *)shareBtn{
    BQLog(@"您点击了分享按钮");
//    [self.navigationController popViewControllerAnimated:YES];
}
-(void)dianZanBtnClick:(UIButton *)ban{
    if (self.readDetailBottomView.dianZanBtn.selected == YES) {
        [self.readDetailBottomView.dianZanBtn setImage:[UIImage imageNamed:@"snap_article_nor"] forState:UIControlStateNormal];
        self.readDetailBottomView.dianZanBtn.selected = NO;

    }else{

        [self.readDetailBottomView.dianZanBtn setImage:[UIImage imageNamed:@"snap_article_sel"] forState:UIControlStateSelected];
        self.readDetailBottomView.dianZanBtn.selected = YES;
    }
    
}
@end
