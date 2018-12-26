//
//  Header.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#ifndef Header_h
#define Header_h

//ip接口
//static  NSString  *const  interface = @"http://192.168.0.93:8080/bingyun/api/";
static  NSString  *const  interface = @"http://124.65.238.30:3300/bingyun/api/";
// 攻略 - 头部图片地址
static  NSString  *const  photoPort = @"strategy/getTop";
// 攻略 - 可能想看的网址
static  NSString  *const  wantToSeePort = @"strategy/listWantSeeNotLogged";
// 攻略 - 本周最热 网址
static  NSString  *const  hotPort = @"strategy/listWeekHottest";
// 攻略 - 查看攻略 网址
static  NSString  *const  chaKanGongLueUrl = @"strategy/saveReading";
// 攻略 - 攻略分类列表
static NSString *const allStrategy = @"enumeration/list?type=StrategyType";
// 攻略 - 根据攻略分类过滤攻略列表 网址
static  NSString  *const  feiLeiPort = @"strategy/page";
// 攻略 - 获取攻略下咨询列表 网址
static  NSString  *const  requiredUrl = @"news/pageNewsByStrategy";
// 攻略 - 视频 网址
static  NSString  *const  videoUrl = @"video/pageQiu";

// 训练营 - 训练营列表 网址
static  NSString  *const  campUrl = @"trainingCamp/page";
// 训练营 - 查看训练营 网址
static  NSString  *const  xqUrl = @"trainingCamp/get";
// 训练营报名  网址
static  NSString  *const  baoMingUrl = @"trainingCamp/saveSignUp";
// 资讯 - 资迅分类列表
static  NSString  *const  consultPort = @"enumeration/list?type=NewsClassify";
// 资讯 - 根据资讯分类过滤资讯列表
static  NSString  *const  consultUrl = @"news/pageQiu";


// 密码登录的网址
static  NSString  *const  loginUrl = @"user/login";
// 获取手机验证码网址
static  NSString  *const  yzmUrl = @"user/sendSms";
// 短信验证码登录网址
static  NSString  *const  smsUrl = @"user/login";
// 退出登录 网址
static  NSString  *const  tuiChuLoginUrl = @"user/logout";


// 报告 - 主页内容,获取球员个人信息 网址
static NSString   *const  homePageUrl = @"member/getReportMemberInfo";
// 报告 - 日常训练数据列表
static NSString   *const everyDayTrainUrl = @"courseTrainingRecord/list";
// 报告 - 人员测试列表 网址
static NSString   *const  ceShiDataUrl = @"courseTestingRecord/page";
// 报告 - 比赛列表  网址
static NSString   *const  biSaiListUrl = @"match/listMatchQiu";
// 报告 - 提交反馈与建议
static NSString   *const  fanKuiYuJianYiUrl = @"suggest/save";
// 我的勋章
static NSString   *const  myMedalStr = @"medal/getMedals";


// 我 - 个人信息+账户信息 网址
static NSString   *const  myHomePage = @"my/getMain";
// 我 - 有效可卡  网址
static NSString   *const  bqSmallCard = @"card/getEffectiveCards";
// 我 - 查看个人信息 网址
static NSString   *const  myMemberInfo = @"member/getMyMemberInfo";
// 我 - 根据当前登录用户获取学员列表
static NSString   *const  stuList = @"member/listByGuardian";
// 我 - 切换学员 网址
static NSString   *const  changeStuUrl = @"member/saveChangeMember";
// 我 - 上课记录 网址
static NSString   *const  skjlUrl = @"account/pageMyClass";
// 我 - 根据ID获取学员上课详细信息 网址
static NSString   *const  skxqUrl = @"course/getDetail";
// 我 - 上课投诉 网址
static NSString   *const  touSuUrl = @"courseTrainingRecord/saveComplaints";
// 我 - 购卡记录 网址
static NSString   *const  gkjlUrl = @"card/pagePurchaseCard";
// 我 - 奖学金账户列表 网址
static NSString   *const  jxjUrl = @"account/pageScholarship";
// 我 - 查看奖学金详细信息 网址
static NSString   *const  jxjDetailUrl = @"account/getCashTransactionInfo";
// 帮助列表 网址
static NSString   *const  helpListUrl = @"help/list";


// 我 - 现金账户列表 网址
static NSString   *const  xjzhUrl = @"account/pageCashAccount";
// 我 - 现金账户交易详细信息 网址
static NSString   *const  xiangXiXinXiUrl = @"account/getCashTransactionInfo";
// 重置密码 网址
static NSString   *const  chongZhiMiMaUrl = @"user/updatePass";
// APP版本比较
static NSString   *const  banBenBiJiaoUrl = @"appVersion/comVersion";
// 我  成为数据VIP  产品列表
static NSString   *const  becomeVIPUrl = @"product/list";
// 我  我的订单列表
static NSString   *const  dingDanListUrl = @"saleRecord/list";

/*
 //用于登录，退出登录的宏
 */
//判断有没有登录的宏，如果是YES表示登录了，如果是NO表示没有登录
#define Has_Login [[NSUserDefaults standardUserDefaults] objectForKey:@"user_token"]
//登录成功，将服务器返回的token持久化
#define LoginAndSaveToken(token) [NSUserDefaults standardUserDefaults] setObject:token forKey:@"user_token"];[[NSUserDefaults standardUserDefaults] synchronize];
//退出登录，或token失效，将持久化的token删除
#define LogOutRemoveToken [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"user_token"]
//获取user_token
#define UserToken (Has_Login ? [[NSUserDefaults standardUserDefaults] objectForKey:@"user_token"] : @"")

#endif /* Header_h */
