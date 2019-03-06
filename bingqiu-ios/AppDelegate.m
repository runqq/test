//
//  AppDelegate.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "RootViewController.h"
#import "FindViewController.h"
#import "LoginViewController.h"
#import <Bugly/Bugly.h>
#import <ShareSDK/ShareSDK.h>


@interface AppDelegate ()

@end

@implementation AppDelegate

// 强制竖屏
-(UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    // 竖屏
    return UIInterfaceOrientationMaskPortrait;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 微信,朋友圈,QQ和QQ好友分享
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        //QQ
        [platformsRegister setupQQWithAppId:@"100371282" appkey:@"aed9b0303e3ed1e27bae87c33761161d"];
        //微信
        [platformsRegister setupWeChatWithAppId:@"wx617c77c82218ea2c" appSecret:@"c7253e5289986cf4c4c74d1ccc185fb1"];
        
    }];
    
    [GLobalRealReachability startNotifier];
    //网络判断
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(NetStateChange:) name:kRealReachabilityChangedNotification object:nil];
    
//    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
//    CFShow((__bridge CFTypeRef)(infoDictionary));
//    // app版本
//    NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
//    NSLog(@"当前版本号:%@",app_Version);

    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        //这里进入引导画面
        self.window.rootViewController=[[ViewController alloc] init];
    }else {
        //直接进入主界面
        self.window.rootViewController=[[RootViewController alloc] init];
    }
    
    
    // 初始化Bugly
    [Bugly startWithAppId:@"92141c963a"];
    
//    [self AFNReachability];
    
    return YES;
}

-(void)NetStateChange:(NSNotification *)notification{
    
    __weak typeof(self) weakSelf = self;
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        
        if (status == RealStatusNotReachable) {
            
            [weakSelf showErrorText:@"网络不给力"];
        }
    }];
    
}

-(void)AFNReachability{
    // 判断网络状态需要三步骤:1.创建网络监听管理者 2. 监听网络状态的改变 3.开始监听
    // 创建网络监听管理者
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    /*
     AFNetworkReachabilityStatusUnknown             = 未知
     AFNetworkReachabilityStatusNotReachable        = 没有网络
     AFNetworkReachabilityStatusReachableViaWWAN    = 3G
     AFNetworkReachabilityStatusReachableViaWiFi    = WIFI
     */
    // 监听网络状态的改变
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        BQLog(@"当前网络状态为:%ld",(long)status);
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:{
                [SVProgressHUD showErrorWithStatus:@"未知"];
                [SVProgressHUD dismissWithDelay:1.25];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:{
//                [self showErrorText:@"没有网络,请检查网络状态"];
                [SVProgressHUD showErrorWithStatus:@"没有网络,请检查网络状态"];
                [SVProgressHUD dismissWithDelay:1.25];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:{
//                [self showErrorText:@"当前为移动数据"];
                [SVProgressHUD showSuccessWithStatus:@"当前为移动数据"];
                [SVProgressHUD dismissWithDelay:1.25];
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:{
//                [self showErrorText:@"当前为WIFI状态"];
                [SVProgressHUD showSuccessWithStatus:@"当前为WIFI状态"];
                [SVProgressHUD dismissWithDelay:1.25];
            }
                break;
            default:
                break;
        }
    }];
    // 开始监听
    [manager startMonitoring];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


 
@end
