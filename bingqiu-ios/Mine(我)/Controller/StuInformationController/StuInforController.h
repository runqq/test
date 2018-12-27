//
//  StuInforController.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StuInforController : UIViewController

//声明回传头像的block
@property(nonatomic, copy) void(^headerImgBlock)(UIImage *img);
@property(nonatomic,strong) UIImage *headImg;

@end

NS_ASSUME_NONNULL_END
