//
//  LoginViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "LoginViewController.h"
#import "PasswordLoginView.h"
#import "YanZhengMaView.h"
#import "ResetPasswordController.h"
#import "ReportViewController.h"
#import "FindViewController.h"

#import "LoginViewModel.h"
#import "LoginModel.h"

#import "YanZhengMaViewModel.h"
#import "YanZhengMaModel.h"

#import "ChickVerificationCodeViewModel.h"
#import "ChickVerificationCodeModel.h"
#import "RootViewController.h"
#import "MineViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UIButton     *backBtn;
@property(nonatomic,strong)UIButton     *secretBtn;
@property(nonatomic,strong)UIButton     *messageBtn;
@property(nonatomic,strong)UILabel      *verticalLine;
@property(nonatomic,strong)UIButton     *verifyBtn;
@property(nonatomic,strong)UIButton     *login;
@property(nonatomic,strong)UIImageView  *imgV;

@property(nonatomic,strong)PasswordLoginView *passwordV;
@property(nonatomic,strong)YanZhengMaView    *yanZhengMaV;

@property(nonatomic,strong)LoginViewModel   *myloginViewModel;
@property(nonatomic,strong)LoginModel       *myLoginModel;

@property(nonatomic,strong)YanZhengMaViewModel *yzmViewModel;
@property(nonatomic,strong)YanZhengMaModel     *yzmModel;

@property(nonatomic,strong)ChickVerificationCodeViewModel  *chickCodeViewModel;
@property(nonatomic,strong)ChickVerificationCodeModel *chickCodeModel;

@end

@implementation LoginViewController

// 初始化
- (instancetype)initWithLoginSuccessBlock:(requestSuccessBlock)successBlock {
    self =  [self init];
    self.successBlock = successBlock;
    return  self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:self.backBtn];
    [self.view addSubview:self.secretBtn];
    [self.view addSubview:self.verticalLine];
    [self.view addSubview:self.messageBtn];
    
    [self.view addSubview:self.passwordV];
    [self.view addSubview:self.yanZhengMaV];
    
    [self.view addSubview:self.login];
    [self.view addSubview:self.imgV];
    
    
    [self addLayOut];
    
    // 密码登录按钮的点击事件
    [self.secretBtn addTarget:self action:@selector(targeSecretBtn) forControlEvents:UIControlEventTouchUpInside];
    // 验证码登录按钮的点击事件
    [self.messageBtn addTarget:self action:@selector(targeMessageBtn) forControlEvents:UIControlEventTouchUpInside];
    
    // 验证码登录手机号输入框代理事件
    [self.yanZhengMaV.numberTF addTarget:self action:@selector(numberTFtextChange:) forControlEvents:UIControlEventEditingChanged];
    // 获取验证码按钮的点击事件
    [self.yanZhengMaV.verifyBtn addTarget:self action:@selector(getVerifyCode:) forControlEvents:UIControlEventTouchUpInside];
    // 验证码输入框代理事件
    [self.yanZhengMaV.mimaTF addTarget:self action:@selector(mimaTFtextChange:) forControlEvents:UIControlEventEditingChanged];
    // 登录按钮的点击事件
    [self.login addTarget:self action:@selector(loginSucceed) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)addLayOut{
    
    __weak typeof(self) weakself = self;
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.self.view.mas_top).with.offset(35);
        make.right.equalTo(weakself.self.view.mas_right).with.offset(-15);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.secretBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.self.view.mas_top).with.offset(96);
        make.left.equalTo(weakself.self.view.mas_left).with.offset(35);
    }];
    [self.verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.self.view.mas_top).with.offset(110);
        make.left.equalTo(weakself.secretBtn.mas_right).with.offset(19);
        make.size.mas_equalTo(CGSizeMake(2, 18));
    }];
    [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.self.view.mas_top).with.offset(96);
        make.left.equalTo(weakself.verticalLine.mas_right).with.offset(19);
    }];
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.self.view.mas_left).with.offset(0);
        make.bottom.equalTo(weakself.self.view.mas_bottom).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(SCREEN_W, 132));
    }];
    
}

-(UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"close_window_30"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(closeLoginViewController:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backBtn;
}

-(UIButton *)secretBtn{
    if (!_secretBtn) {
        _secretBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _secretBtn.titleLabel.font = BQBOLDFONT(22);
        [_secretBtn setTitle:@"密码登录" forState:UIControlStateNormal];
        [_secretBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        [_secretBtn sizeToFit];
    }
    return _secretBtn;
}
-(UIButton *)messageBtn{
    if (!_messageBtn) {
        _messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _messageBtn.selected = YES;
        [_messageBtn setTitle:@"验证码登录" forState:UIControlStateNormal];
        _messageBtn.titleLabel.font = BQBOLDFONT(22);
        [_messageBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [_messageBtn sizeToFit];
    }
    return _messageBtn;
}
// 中间的垂直线
-(UILabel *)verticalLine{
    if (!_verticalLine) {
        _verticalLine = [UILabel new];
        _verticalLine.backgroundColor = [UIColor colorWithHexString:@"#333333"];
    }
    return _verticalLine;
}

-(PasswordLoginView *)passwordV{
    if (!_passwordV) {
        _passwordV = [[PasswordLoginView alloc]initWithFrame:CGRectMake(0, 187, SCREEN_W, 84)];
        _passwordV.hidden = YES;
    }
    return _passwordV;
}
-(YanZhengMaView *)yanZhengMaV{
    if (!_yanZhengMaV) {
        _yanZhengMaV = [[YanZhengMaView alloc]initWithFrame:CGRectMake(0, 187, SCREEN_W, 84)];
        _yanZhengMaV.hidden = NO;
    }
    return _yanZhengMaV;
}

-(UIButton *)login{
    if (!_login) {
        // 登录按钮
        _login = [[UIButton alloc]initWithFrame:CGRectMake(40, 320, SCREEN_W - 80, 48)];
        //设置圆角
        _login.layer.cornerRadius = 24;
        //将多余的部分切掉
        _login.layer.masksToBounds = YES;
        _login.backgroundColor = [UIColor colorWithRed:35/255.0 green:117/255.0 blue:236/255.0 alpha:1];
        [_login setTitle:@"登录" forState:UIControlStateNormal];
        [_login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _login.titleLabel.font = BQBOLDFONT(18);
        
    }
    return _login;
}
-(UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, SCREEN_H - 132, SCREEN_W, 132)];
        _imgV.image = [UIImage imageNamed:@"bg_login"];
    }
    return _imgV;
}

#pragma mark —验证码登录方法—
-(void)targeMessageBtn{
    
    self.yanZhengMaV.hidden = NO;
    self.passwordV.hidden = YES;
    // 让验证码手机号数输入框成为第一响应者
    [self.yanZhengMaV.numberTF becomeFirstResponder];
    // 验证码登录按钮的颜色为黑色
    [_messageBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    // 密码登录按钮的文字颜色为灰色
    [_secretBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
}

#pragma mark —密码登录方法—
-(void)targeSecretBtn{
    // 密码登录时隐藏验证码试图,显示登录视图
    self.passwordV.hidden = NO;
    self.yanZhengMaV.hidden = YES;
    // 让密码登录手机号数输入框成为第一响应者
    [self.passwordV.mobileTF becomeFirstResponder];
    [_messageBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    [_secretBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    // 手机号输入框代理事件
    [self.passwordV.mobileTF addTarget:self action:@selector(mobileTFtextChange:) forControlEvents:UIControlEventEditingChanged];
    // 密码框代理事件
    [self.passwordV.passwordTF addTarget:self action:@selector(passwordTFtextChange:) forControlEvents:UIControlEventEditingChanged];
}

#pragma mark — 登录方法 —
-(void)loginSucceed{
    [self.passwordV.mobileTF resignFirstResponder];
    [self.yanZhengMaV.numberTF resignFirstResponder];
    
    if (self.yanZhengMaV.hidden == YES) {
        //账号登录
        if (!self.myloginViewModel.phoneNumber || !self.myloginViewModel.passWordNumber ) {
            [SVProgressHUD showErrorText:@"账号或密码不能为空"];
            [SVProgressHUD dismissWithDelay:1.25];
        }else{
            // 有网,进行网络请求
            [self.myloginViewModel getLoginDataSuccess:^(LoginModel * loginModel) {
                self.myLoginModel = loginModel;
                if (self.myLoginModel.success) {
                    // 存储手机号
                    [User_Default setObject:self.passwordV.mobileTF.text forKey:@"myPhoneNumber"];
                    if (self.successBlock !=nil) {
                        self.successBlock();
                    }
                    // 登录成功以后跳转到报告界面 同时将登录界面dismiss掉
                    [self dismissViewControllerAnimated:YES completion:nil];
                    
                }else{
                    
                    // 失败返回0
                    NSString *str = self.myLoginModel.message;
                    NSArray *arr = [str componentsSeparatedByString:@"Error"];
                    if (arr != nil) {
                        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",arr[0]]];
                        [SVProgressHUD dismissWithDelay:1.25];
                    }
                }
                
            } Failture:^(LoginModel * myLoginModel) {
//                 [self showErrorText:myLoginModel.message];
            }];
        }
    }else{
        
        //验证码登录
        self.chickCodeViewModel.phoneNumber = self.yzmViewModel.phoneNumber;
        
        if (!self.chickCodeViewModel.phoneNumber || !self.chickCodeViewModel.yanZhengMaStr) {
            [SVProgressHUD showErrorText:@"账号或验证码不能为空"];
            [SVProgressHUD dismissWithDelay:1.25];
            
        }else{
            
            [self.chickCodeViewModel ChickVerificationCodeSuccess:^(ChickVerificationCodeModel *  chickCodeModel) {
                if (chickCodeModel.success) {
                    // 存储手机号
                    [User_Default setObject:self.yanZhengMaV.numberTF.text forKey:@"myPhoneNumber"];
                    
                    if (self.successBlock !=nil) {
                        self.successBlock();
                    }
                    [self dismissViewControllerAnimated:YES completion:^{
                        //设置密码页面
                        ResetPasswordController *restPasswordVC = [[ResetPasswordController alloc]init];
                        [self.navigationController pushViewController:restPasswordVC animated:YES];
                    }];
                }else{
                    
                    //输入验证码错误给出提示
                    NSString *str1 = chickCodeModel.message;
                    NSArray *arr1 = [str1 componentsSeparatedByString:@"Error"];
                    if (arr1 != nil) {
                        [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",arr1[0]]];
                        [SVProgressHUD dismissWithDelay:1.25];
                    }
                }
            } Failture:^(ChickVerificationCodeModel *  chickCodeModel) {
//                [self showErrorText:chickCodeModel.message];
            }];
        }
    }
    
}

#pragma mark —关闭登录视图方法—
-(void)closeLoginViewController:(UIButton *)closeBtn{
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        if (self.dismissBlock) {
            self.dismissBlock();
        };
  //  [self dismissViewControllerAnimated:YES completion:nil];
 //         UIViewController *rootVC= [UIApplication sharedApplication].delegate.window.rootViewController;
//        rootVC.viewcon
//        [tab setSelectedIndex:1];
    }];
    
//    FindViewController *findVC = [[FindViewController alloc]init];
//    [self.navigationController pushViewController:findVC animated:YES];
    
}

#pragma mark --> textField代理方法
-(void)mobileTFtextChange:(UITextField *)mobile{
    NSString  *oldStr = mobile.text;
    NSString *subStr = [[NSString alloc] init];
    if (mobile.text.length > 11) {
        subStr = [oldStr substringToIndex:11];
        mobile.text = subStr;
        self.myloginViewModel.phoneNumber = subStr;
    }else{
        self.myloginViewModel.phoneNumber = mobile.text;
    }
}
// 验证码手机输入框监听
-(void)numberTFtextChange:(UITextField *)numberTF{
    NSString  *oldStr = numberTF.text;
    NSString *subStr = [[NSString alloc] init];
    if (numberTF.text.length > 11) {
        subStr = [oldStr substringToIndex:11];
        numberTF.text = subStr;
        self.yzmViewModel.phoneNumber = subStr;
    }else{
        self.yzmViewModel.phoneNumber = numberTF.text;
    }
}
// 密码监听
-(void)passwordTFtextChange:(UITextField *)password{
    self.myloginViewModel.passWordNumber = password.text;
    [Encryption md5:self.myloginViewModel.passWordNumber];
    
}
// 输入验证码框的监听
-(void)mimaTFtextChange:(UITextField *)yzmTF{
    NSString *yzmTextField = yzmTF.text;
    NSString *jieQuStr = [[NSString alloc]init];
    if (yzmTF.text.length > 6) {
        jieQuStr = [yzmTextField substringToIndex:6];
        yzmTF.text = jieQuStr;
        self.chickCodeViewModel.yanZhengMaStr = jieQuStr;
    }else{
        self.chickCodeViewModel.yanZhengMaStr = yzmTF.text;
    }
    

    
}
// 获取验证码按钮的点击事件
#pragma mark —获取验证码方法—
-(void)getVerifyCode:(UIButton *)sender{
    
    if (!self.yzmViewModel.phoneNumber || [self.yzmViewModel.phoneNumber isEqualToString:@""] || self.yzmViewModel.phoneNumber == nil) {
//        [self showErrorText:@"请输入手机号"];
        [SVProgressHUD showErrorText:@"请输入手机号"];
        [SVProgressHUD dismissWithDelay:1.25];
        
    }else{
        
        [self.yzmViewModel getDataWithSuccess:^(YanZhengMaModel *  yzmModel) {
            self.chickCodeViewModel.phoneNumber = self.yzmViewModel.phoneNumber;
            if (yzmModel.success) {
                // 进入倒计时
                [self TimeReduce];
                
            }else{
                
                //输入验证码错误给出提示
                NSString *str1 = yzmModel.message;
                NSArray *arr1 = [str1 componentsSeparatedByString:@"Error"];
                if (arr1 != nil) {
                    [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@",arr1[0]]];
                    [SVProgressHUD dismissWithDelay:1.25];
                }
            }
            
        } Failture:^(YanZhengMaModel *  yzmError) {
//            [self showErrorText:yzmError.message];
        }];
        
    }
}

-(void)TimeReduce{
    //倒计时时间
    __block int timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);

    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行

    dispatch_source_set_event_handler(_timer, ^{

        if(timeout<=0){ //倒计时结束，关闭

            dispatch_source_cancel(_timer);

            dispatch_async(dispatch_get_main_queue(), ^{

                [self.yanZhengMaV.verifyBtn setTitle:@"重新获取" forState:UIControlStateNormal];
                self.yanZhengMaV.verifyBtn.userInteractionEnabled = YES;

            });

        }else{

            int seconds = timeout;

            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];

            dispatch_async(dispatch_get_main_queue(), ^{

                //让按钮变为不可点击
                self.yanZhengMaV.verifyBtn.userInteractionEnabled = NO;

                [UIView beginAnimations:nil context:nil];

                [UIView setAnimationDuration:1];

                [self.yanZhengMaV.verifyBtn setTitle:[NSString stringWithFormat:@"%@s",strTime] forState:UIControlStateNormal];
                //                BRLog(@"倒计时=========%@",strTime);
                [UIView commitAnimations];
            });
            timeout--;
        }

    });

    dispatch_resume(_timer);
}

-(LoginViewModel *)myloginViewModel{
    if (!_myloginViewModel) {
        _myloginViewModel = [[LoginViewModel alloc] init];
    }
    return _myloginViewModel;
}
-(LoginModel *)myLoginModel{
    if (!_myLoginModel) {
        _myLoginModel = [[LoginModel alloc]init];
    }
    return _myLoginModel;
}
-(YanZhengMaViewModel *)yzmViewModel{
    if (!_yzmViewModel) {
        _yzmViewModel = [[YanZhengMaViewModel alloc]init];
    }
    return _yzmViewModel;
}
-(YanZhengMaModel *)yzmModel{
    if (!_yzmModel) {
        _yzmModel = [[YanZhengMaModel alloc]init];
    }
    return _yzmModel;
}
-(ChickVerificationCodeViewModel *)chickCodeViewModel{
    if (!_chickCodeViewModel) {
        _chickCodeViewModel = [[ChickVerificationCodeViewModel alloc]init];
    }
    return _chickCodeViewModel;
}
-(ChickVerificationCodeModel *)chickCodeModel{
    if (!_chickCodeModel) {
        _chickCodeModel = [[ChickVerificationCodeModel alloc]init];
    }
    return _chickCodeModel;
}

@end
