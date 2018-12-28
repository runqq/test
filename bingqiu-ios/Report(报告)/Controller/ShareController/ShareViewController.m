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
    
    
    // 将wkWebView添加到视图
    [self.view addSubview:self.wkWebV];
    
//    NSString *urlStr = @"http://124.65.238.30:3300/html/train.html";
////    NSString *trainStr = [interface stringByAppendingString:urlStr];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
//    NSArray* cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];NSHTTPCookie* realCookie = nil;
//    for (NSHTTPCookie* cookie in cookies)
//     {
//         //[NSObject baseURLStr] ：接口地址的请求头
//         NSRange range = [interface rangeOfString:cookie.domain];
//         //如过找到了
//         if (range.location != NSNotFound) {realCookie = cookie;break;}}//下面这个取cookie的方法，每个项目的name值可能不一样，要要断点查看：
//
//    NSString* cookieValue = [User_Default objectForKey:@"myjsession"]; //[NSString stringWithFormat:@"app=;",realCookie.value];
//      [request setValue:cookieValue forHTTPHeaderField:@"cookie"];
//    [self.wkWebV loadRequest:request];
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
        _wkWebV.navigationDelegate = self;
        _wkWebV.UIDelegate = self;
        
        NSString *urlStr = @"http://124.65.238.30:3300/html/train.html";
        NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
        [request setValue:[User_Default objectForKey:@"myjsession"] forHTTPHeaderField:@"Cookie"];

        // 开始加载
        [_wkWebV loadRequest:request];

    }
    return _wkWebV;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSMutableURLRequest *mutableRequest = [navigationAction.request mutableCopy];
    
    NSDictionary *requestHeaders = navigationAction.request.allHTTPHeaderFields;
    
    //我们项目使用的token同步的，cookie的话类似
    if (requestHeaders[@"cookie"]) {
        
        decisionHandler(WKNavigationActionPolicyAllow);//允许跳转
    } else {
        
        //这里添加请求头，把需要的都添加进来
        [mutableRequest setValue: [User_Default objectForKey:@"myjsession"] forHTTPHeaderField:@"cookie"];
        //这个我发现不能使用，于是我就直接不写了，但是下边的换了一种写法，结果都能达到同步
        //        navigationAction.request=[mutableRequest copy];
        [webView loadRequest:mutableRequest];
        decisionHandler(WKNavigationActionPolicyAllow);//允许跳转
        
    }
    
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
