//
//  BiDuAndVideoKongJieMian.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BiDuAndVideoKongJieMian : UIView

@property(nonatomic,strong)UIImageView *img;
@property(nonatomic,strong)UILabel *titleLab;
// 展示自定义View
-(void)showCustomBiDuAndVideoKongJieMianView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
