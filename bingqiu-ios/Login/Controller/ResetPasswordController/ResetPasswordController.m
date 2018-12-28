//
//  ResetPasswordController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/25.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ResetPasswordController.h"

#import "ChongZhiMiMaModel.h"
#import "ChongZhiMiMaViewModel.h"

#import "ReportViewController.h"
#import "FindViewController.h"
#import "MineViewController.h"

@interface ResetPasswordController ()

@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UITextField *textTF;
@property(nonatomic,strong)UIButton *confirmBtn;
@property(nonatomic,strong)UILabel  *navTitle;

@property(nonatomic,strong)ChongZhiMiMaModel *resetPassModel;
@property(nonatomic,strong)ChongZhiMiMaViewModel *resetPassViewModel;

@end

@implementation ResetPasswordController

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
    self.view.backgroundColor = [UIColor whiteColor];
    // 隐藏系统自带的返回按钮
    [self.navigationItem setHidesBackButton:YES];
    // 导航标题
    self.navigationItem.titleView = self.navTitle;
    // 导航右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"跳过" style:UIBarButtonItemStyleDone target:self action:@selector(clickRightBtn:)];
    
    [self.view addSubview:self.bgView];
    [self.bgView addSubview:self.titleLab];
    [self.bgView addSubview:self.textTF];
    [self.bgView addSubview:self.confirmBtn];
    
    [self setLayOut];
}
-(void)setLayOut{
    
    __weak typeof(self) weakself = self;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.bgView.mas_top).with.offset(20);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(15);
    }];
    [self.textTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.titleLab.mas_bottom).with.offset(11);
        make.left.equalTo(weakself.bgView.mas_left).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 50));
    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.textTF.mas_bottom).with.offset(40);
        make.centerX.equalTo(weakself.bgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(345, 48));
        
    }];
}
#pragma mark --> 懒加载
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT, SCREEN_W, SCREEN_H - NAVIGATION_BAR_HEIGHT)];
        _bgView.backgroundColor = [UIColor colorWithHexString:@"#eeeeee"];
    }
    return _bgView;
}
-(UILabel *)navTitle{
    if (!_navTitle) {
        // 导航标题
        _navTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _navTitle.text = @"设置密码";
        _navTitle.textAlignment = NSTextAlignmentCenter;
        _navTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitle.font = BQFONT(18);
    }
    return _navTitle;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel new];
        _titleLab.text = @"请输入密码";
        _titleLab.textColor = [UIColor colorWithHexString:@"#666666"];
        _titleLab.font = BQFONT(15);
        [_titleLab sizeToFit];
    }
    return _titleLab;
}

-(UITextField *)textTF{
    if (!_textTF) {
        _textTF = [UITextField new];
        _textTF.backgroundColor = [UIColor colorWithHexString:@"#ffffff"];
        _textTF.placeholder = @"8-16位,至少包含数字/字母/字符2种组合";
        _textTF.textColor = [UIColor colorWithHexString:@"#333333"];
        _textTF.font = BQFONT(16);
        
        UIImageView *vv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 15, 50)];
        vv.backgroundColor = [UIColor clearColor];
        _textTF.leftView = vv;
        _textTF.leftViewMode = UITextFieldViewModeAlways;
        
        UIButton  *clearBtn = [_textTF valueForKey:@"_clearButton"];
        [clearBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        [clearBtn setImage:[UIImage imageNamed:@"icon_password_delete"] forState:UIControlStateNormal];
        _textTF.clearButtonMode = UITextFieldViewModeAlways;
        
    }
    return _textTF;
}

//+(BOOL)passWordChange:(NSString *)pass{
//    
//    BOOL result = false;
//    if ([pass length] >= 8 && [pass length] <= 16){
//        // 判断长度大于8位后再接着判断是否同时包含数字和字符
//        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$";
//        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
//        result = [pred evaluateWithObject:pass];
//    }
//    return result;
//}

-(UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmBtn.backgroundColor = [UIColor colorWithHexString:@"#188bf0"];
        [_confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:[UIColor colorWithHexString:@"#ffffff"] forState:UIControlStateNormal];
        _confirmBtn.titleLabel.font = BQBOLDFONT(18);
        _confirmBtn.layer.masksToBounds = YES;
        _confirmBtn.layer.cornerRadius = 5;
        [_confirmBtn addTarget:self action:@selector(queDingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

// 跳过按钮的点击事件
-(void)clickRightBtn:(UIButton *)rightBtn{
    
    NSArray  *viewControllers =  self.navigationController.viewControllers;
    for (UIViewController  *item in viewControllers) {
        if ([item isKindOfClass:[FindViewController class]]) {

            FindViewController *findVC = [[FindViewController alloc]init];
            findVC.tabBarController.tabBar.hidden = NO;
            [self.navigationController pushViewController:findVC animated:NO];

        }else if ([item isKindOfClass:[ReportViewController class]]){

            ReportViewController *reportVC = [[ReportViewController alloc]init];
            reportVC.tabBarController.tabBar.hidden = NO;
            [self.navigationController pushViewController:reportVC animated:NO];

        }else  if([item isKindOfClass:[MineViewController class]]){
            
            MineViewController *mineVC = [[MineViewController alloc]init];
            mineVC.tabBarController.tabBar.hidden = NO;
            [self.navigationController pushViewController:mineVC animated:NO];
        }
    }
}

-(void)queDingBtnClick:(UIButton *)deleteBtn{
    
    if (self.textTF.text.length < 8)
    {
        [SVProgressHUD showErrorText:@"8-16位,至少包含数字/字母/字符2种组合"];
        [SVProgressHUD dismissWithDelay:1.25];
        
        return;
    }
    
    if (self.textTF.text.length >= 8 && self.textTF.text.length <= 16) {
        //数字条件
        NSRegularExpression *tNumRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:NSRegularExpressionCaseInsensitive error:nil];
        //符合数字条件的有几个
        NSUInteger tNumMatchCount = [tNumRegularExpression numberOfMatchesInString:self.textTF.text
                                                                           options:NSMatchingReportProgress
                                                                             range:NSMakeRange(0, self.textTF.text.length)];
        //英文字条件
        NSRegularExpression *tLetterRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Za-z]" options:NSRegularExpressionCaseInsensitive error:nil];
        
        //符合英文字条件的有几个
        NSUInteger tLetterMatchCount = [tLetterRegularExpression numberOfMatchesInString:self.textTF.text
                                                                                 options:NSMatchingReportProgress
                                                                                   range:NSMakeRange(0, self.textTF.text.length)];
        if(tNumMatchCount >= 1 && tLetterMatchCount >= 1){
            // 进行的网络解析
            [self.resetPassViewModel getChongZhiMiMaWithPassword:self.textTF.text  Success:^(ChongZhiMiMaModel * zhongZhiModel) {
                if (zhongZhiModel.success) {
                    //                    [self dismissViewControllerAnimated:YES completion:nil];
                    
                    NSArray  *viewControllers =  self.navigationController.viewControllers;
                    for (UIViewController  *item in viewControllers) {
                        if ([item isKindOfClass:[FindViewController class]]) {
                            FindViewController *findVC = [[FindViewController alloc]init];
                            findVC.tabBarController.tabBar.hidden = NO;
                            [self.navigationController pushViewController:findVC animated:NO];
                            
                        }else if ([item isKindOfClass:[ReportViewController class]]){
                            ReportViewController *reportVC = [[ReportViewController alloc]init];
                            reportVC.tabBarController.tabBar.hidden = NO;
                            [self.navigationController pushViewController:reportVC animated:NO];
                            
                        }else  if([item isKindOfClass:[MineViewController class]]){
                            MineViewController *mineVC = [[MineViewController alloc]init];
                            mineVC.tabBarController.tabBar.hidden = NO;
                            [self.navigationController pushViewController:mineVC animated:NO];
                        }
                    }
                    
                    [SVProgressHUD showSuccessText:zhongZhiModel.message];
                    [SVProgressHUD dismissWithDelay:1.25];
                    
                }else{
                    
                    [self showErrorText:zhongZhiModel.message];
                    
                }
            } Failture:^(ChongZhiMiMaModel * chongZhiError) {
                
            }];
            
            return;
            
        }else{
            
            [SVProgressHUD showErrorText:@"8-16位,至少包含数字/字母/字符2种组合"];
            [SVProgressHUD dismissWithDelay:2];
            return;
        }
    }
}
-(ChongZhiMiMaModel *)resetPassModel{
    if (!_resetPassModel) {
        _resetPassModel = [[ChongZhiMiMaModel alloc]init];
    }
    return _resetPassModel;
}
-(ChongZhiMiMaViewModel *)resetPassViewModel{
    if (!_resetPassViewModel) {
        _resetPassViewModel = [[ChongZhiMiMaViewModel alloc]init];
    }
    return _resetPassViewModel;
}


@end
