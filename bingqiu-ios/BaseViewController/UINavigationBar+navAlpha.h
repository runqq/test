//
//  UINavigationBar+navAlpha.h
//  导航栏隐藏
//
//  Created by apple on 18/10/17.
//  Copyright © 2018年 杰哥. All rights reserved.
//

#import <UIKit/UIKit.h>
#define NavigationBarBGColor [UIColor colorWithRed:32/255.0f green:177/255.0f blue:232/255.0f alpha:1]
@interface UINavigationBar (navAlpha)

// 改变透明度的view
@property (nonatomic, strong) UIView *alphaView;

// 根据颜色改变透明度
- (void)changeNavigationBarAlphaWith:(UIColor *)color;
- (void) resetNavBar;

@end
