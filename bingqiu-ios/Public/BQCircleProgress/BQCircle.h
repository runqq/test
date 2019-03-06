//
//  BQCircle.h
//  XLCircleProgressDemo
//
//  Created by MacBook Air on 2018/12/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BQCircle : UIView

-(instancetype)initWithFrame:(CGRect)frame lineWidth:(float)lineWidth;

@property (assign,nonatomic) float progress;

@property (assign,nonatomic) CGFloat lineWidth;

@end

NS_ASSUME_NONNULL_END
