//
//  ShareViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/3.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ShareViewController.h"
#import "ShareView.h"
#import <UIView+WebCache.h>
#import <WebKit/WebKit.h>

@interface ShareViewController ()<WKUIDelegate,WKNavigationDelegate , WKScriptMessageHandler>

@property(nonatomic,strong)ShareView *shareV;

@property(nonatomic,strong)UILabel *navTitleLab;
@property(nonatomic,strong)UIButton *rightBut;
@property(nonatomic,strong)WKWebView *wkWebV;
@property(nonatomic,strong)NSString *urlStr,*htmlStr;

@end

@implementation ShareViewController

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
    // 导航标题
    self.navigationItem.titleView = self.navTitleLab;
    // 导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    // 导航左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_back_blue"] style:UIBarButtonItemStyleDone target:self action:@selector(goBackBtn:)];
    // 导航右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBut];
    // 视图背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"#f5f5f5"];
    
//    WKWebViewConfiguration* webConfiguration = [[WKWebViewConfiguration alloc] init];
//    WKUserContentController* contentController = [[WKUserContentController alloc] init];
//    WKPreferences *preferences = [WKPreferences new];
//    webConfiguration.preferences = preferences;
//    //WeakSelf：这是一个宏，防止MessageHandler循环引用
//    WeakSelf;
//    [contentController addScriptMessageHandler:weakSelf name:@"rule"];
//    [contentController addScriptMessageHandler:weakSelf name:@"minimalInvasiveActivityProtocolClick"];
//    self.wkWebV = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
//    self.wkWebV.navigationDelegate = self;
//    self.wkWebV.UIDelegate = self;
//
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
//    [request setValue:[User_Default objectForKey:@"myjsession"] forHTTPHeaderField:@"Cookie"];
//    // 开始加载
//    [_wkWebV loadRequest:request];
    
    // 将wkWebView添加到视图
    [self.view addSubview:self.wkWebV];
    
    
    
}

#pragma mark --> 懒加载
-(WKWebView *)wkWebV{
    if (!_wkWebV) {

        WKWebViewConfiguration* webConfiguration = [[WKWebViewConfiguration alloc] init];
        WKUserContentController* contentController = [[WKUserContentController alloc] init];
        WKPreferences *preferences = [WKPreferences new];
        webConfiguration.preferences = preferences;
        //WeakSelf：这是一个宏，防止MessageHandler循环引用
        WeakSelf;
        [contentController addScriptMessageHandler:weakSelf name:@"rule"];
        [contentController addScriptMessageHandler:weakSelf name:@"minimalInvasiveActivityProtocolClick"];
        
        _wkWebV =  [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H) configuration:webConfiguration];
        _wkWebV = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, SCREEN_H)];
        _wkWebV.navigationDelegate = self;
        _wkWebV.UIDelegate = self;

        
        NSMutableDictionary *cookieDic = [NSMutableDictionary dictionary];
        NSMutableString *cookieValue = [User_Default objectForKey:@"myjsession"];
        NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (NSHTTPCookie *cookie in [cookieJar cookies]) {
            
            [cookieDic setObject:cookie.value forKey:cookie.name];
            
        }
        
        // cookie重复，先放到字典进行去重，再进行拼接
        
        for (NSString *key in cookieDic) {
            
            NSString *appendString = [NSString stringWithFormat:@"%@=%@;", key, [cookieDic valueForKey:key]];
            [cookieValue appendString:appendString];
        }
        self.urlStr = @"http://124.65.238.30:3300/html/train.html";
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
        
        [request addValue:cookieValue forHTTPHeaderField:@"Cookie"];

        
        
//        //h5页面的网址
//        self.urlStr = @"http://124.65.238.30:3300/html/train.html";

//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
//      request addValue:<#(nonnull NSString *)#> forHTTPHeaderField:<#(nonnull NSString *)#>
//                                     @"Cookie",[User_Default objectForKey:@"myjsession"],                // token值// 域
        //获取cookie
//        if (self.urlStr) {
//            [self.wkWebV loadRequest:request];
//        }

//        // 创建request
//        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
//        [request setValue:[User_Default objectForKey:@"myjsession"] forHTTPHeaderField:@"Cookie"];
        
        // 开始加载
        [_wkWebV loadRequest:request];

    }
    return _wkWebV;
}

//获取Cookie
- (NSString *)getCurrentCookie {
    NSMutableString *cookieStr = [[NSMutableString alloc] init];
    NSArray *array =  [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:self.urlStr]];
    if ([array count] > 0) {
        for (NSHTTPCookie *cookie in array) {
            [cookieStr appendFormat:@"%@=%@;",cookie.name,cookie.value];
        }
        //删除最后一个分号 “；”
        [cookieStr deleteCharactersInRange:NSMakeRange(cookieStr.length - 1, 1)];
    }
    return cookieStr;
}


-(UILabel *)navTitleLab{
    if (!_navTitleLab) {
        // 导航标题
        _navTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 18)];
        _navTitleLab.text = @"训练详情";
        _navTitleLab.textAlignment = NSTextAlignmentCenter;
        _navTitleLab.textColor = [UIColor colorWithHexString:@"#333333"];
        _navTitleLab.font = BQBOLDFONT(18);
    }
    return _navTitleLab;
}
-(UIButton *)rightBut{
    if (!_rightBut) {
        _rightBut = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBut setImage:[UIImage imageNamed:@"nav_share_blue"] forState:UIControlStateNormal];
        [_rightBut addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBut;
}

#pragma mark --> 自定义按钮点击事件
-(void)goBackBtn:(UIButton *)backBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightBtn:(UIButton *)shareBtn{
    // 展示分享页面
    [self.shareV showShareAlertViewOnView:self.view];
}

-(ShareView *)shareV{
    if (!_shareV) {
        _shareV = [[ShareView alloc]init];
        [_shareV.cancelBtn addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareV;
}
// 点击事件
-(void)backBtnClick:(UIButton *)goBackBtn{
    [self.shareV dissmissCustomAlertView];
}

@end
