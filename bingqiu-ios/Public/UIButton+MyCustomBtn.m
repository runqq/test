//
//  UIButton+MyCustomBtn.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "UIButton+MyCustomBtn.h"

@implementation UIButton (MyCustomBtn)

-(UIButton *)setMyCustomButton:(NSString *)titStr ButtonIMG:(NSString *)btnImageStr{
    
    /* 获取按钮文字的宽度 获取按钮图片和文字的间距 获取图片宽度 */
    CGFloat    space = 9;// 图片和文字的间距
    NSString    * titleString =titStr;
    CGFloat    titleWidth = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].width;
    UIImage    * btnImage = [UIImage imageNamed:btnImageStr];
    CGFloat    imageWidth = btnImage.size.width;
    
    UIButton  *myButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [myButton setImage:btnImage forState:UIControlStateNormal];
    [myButton setTitle:titleString forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    myButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    /**需要先获取图片和文字的高度**/
    CGFloat    imageHeight = btnImage.size.height;
    CGFloat    titleHeight = [titleString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}].height;
    
    [myButton setImageEdgeInsets:UIEdgeInsetsMake(-(imageHeight*0.5 + space*0.5), titleWidth*0.5, imageHeight*0.5 + space*0.5, -titleWidth*0.5)];
    [myButton setTitleEdgeInsets:UIEdgeInsetsMake(titleHeight*0.5 + space*0.5, -imageWidth*0.5, -(titleHeight*0.5 + space*1.3), imageWidth*0.5)];
    
    return myButton;
}
@end
