//
//  UIColor+JYColor.h
//  JingYu
//
//  Created by issuser on 2018/3/8.
//  Copyright © 2018年 com.creditease.yirendai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JYColor)

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)
+ (UIColor *) colorWithHexString: (NSString *)color;

@end
