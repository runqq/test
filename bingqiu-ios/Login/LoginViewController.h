//
//  LoginViewController.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

//请求成功回调block
typedef void (^requestSuccessBlock)(void);
@property (nonatomic,copy)requestSuccessBlock successBlock;
- (instancetype)initWithLoginSuccessBlock:(requestSuccessBlock) successBlock;

@property (nonatomic,copy)requestSuccessBlock  dismissBlock;


@end

NS_ASSUME_NONNULL_END
