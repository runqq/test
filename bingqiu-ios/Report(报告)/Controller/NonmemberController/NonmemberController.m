//
//  NonmemberController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/2.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "NonmemberController.h"

@interface NonmemberController ()

@property(nonatomic,strong)UILabel *navTitLab;
@property(nonatomic,strong)UIImageView *nonmemberImg;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *placeholderLab;

@end

@implementation NonmemberController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 导航标题
    self.navigationItem.titleView = self.navTitLab;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    
    [self.view addSubview:self.nonmemberImg];
    [self.view addSubview:self.titleLab];
    [self.view addSubview:self.placeholderLab];
    
    [self addLayOut];
    
}

-(void)addLayOut{
    __weak typeof(self) weakself = self;
    [self.nonmemberImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.self.view.mas_top).with.offset(NAVIGATION_BAR_HEIGHT+30);
        make.left.equalTo(weakself.self.view.mas_left).with.offset(132);
        make.size.mas_equalTo(CGSizeMake(222, 216));
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.self.view.mas_top).with.offset(NAVIGATION_BAR_HEIGHT+274);
        make.centerX.equalTo(weakself.self.view.mas_centerX);
    }];
    [self.placeholderLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.self.view.mas_top).with.offset(NAVIGATION_BAR_HEIGHT+306);
        make.left.equalTo(weakself.self.view.mas_left).with.offset(70);
        make.size.mas_equalTo(CGSizeMake(264, 50));
    }];
}

#pragma mark --> 懒加载
-(UILabel *)navTitLab{
    if (!_navTitLab) {
        _navTitLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        _navTitLab.text = @"报告";
        _navTitLab.textAlignment = NSTextAlignmentCenter;
        _navTitLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitLab.font = BQBOLDFONT(18);
    }
    return _navTitLab;
}
-(UIImageView *)nonmemberImg{
    if (!_nonmemberImg) {
        _nonmemberImg = [[UIImageView alloc]init];
        _nonmemberImg.image = [UIImage imageNamed:@"picture_report_nonmember"];
    }
    return _nonmemberImg;
}
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"此功能目前暂未开通";
        _titleLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titleLab.font = BQBOLDFONT(18);
    }
    return _titleLab;
}
-(UILabel *)placeholderLab{
    if (!_placeholderLab) {
        _placeholderLab = [UILabel new];
        _placeholderLab.text = @"(购买数据服务即可开通此功能,  详情请咨询华星冰上运动中心各场馆前台)";
        _placeholderLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _placeholderLab.font = BQBOLDFONT(16);
        
        _placeholderLab.preferredMaxLayoutWidth = (self.view.frame.size.width - 5 * 2);
        [_placeholderLab setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        _placeholderLab.numberOfLines = 0;
        
        
    }
    return _placeholderLab;
}

@end
