//
//  Circle.m
//  YKL
//
//  Created by Apple on 15/12/7.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "XLCircle.h"

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
//
//static CGFloat endPointMargin = 1.0f;

@interface XLCircle ()
{
    CAShapeLayer* _trackLayer;
    CAShapeLayer* _progressLayer;
//    UIImageView* _endPoint;//在终点位置添加一个点
}
@end

@implementation XLCircle


-(instancetype)initWithFrame:(CGRect)frame lineWidth:(float)lineWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        _lineWidth = lineWidth;
        [self buildLayout];
    }
    return self;
}

-(void)buildLayout
{
    float centerX = self.bounds.size.width/2.0;
    float centerY = self.bounds.size.height/2.0;
//    半径
   float radius = 59;
    
    //创建贝塞尔路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:radius startAngle:(-0.5f*M_PI) endAngle:1.5f*M_PI clockwise:YES];
    
    //添加背景圆环
    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer.frame = self.bounds;
    backLayer.fillColor =  [[UIColor clearColor] CGColor];
    
     backLayer.strokeColor  = [UIColor colorWithRed:226.0/255.0f green:226.0/255.0f blue:226.0/255.0f alpha:1].CGColor;
    backLayer.lineWidth = _lineWidth;
    backLayer.path = [path CGPath];
    backLayer.strokeEnd = 1;
    [self.layer addSublayer:backLayer];
    
    //创建进度layer
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    //指定path的渲染颜色
    _progressLayer.strokeColor  = [[UIColor blackColor] CGColor];
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = _lineWidth;
    _progressLayer.path = [path CGPath];
    _progressLayer.strokeEnd = 0;
    
    //设置渐变颜色
    self.gradientLayer =  [CAGradientLayer layer];
    self.gradientLayer.frame = self.bounds;
    
   [self.gradientLayer setColors:[NSArray arrayWithObjects:(id)[RGB(170, 122, 244) CGColor],(id)[RGB(24, 139, 240) CGColor], nil]];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    [self.gradientLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
    [self.layer addSublayer:self.gradientLayer];
    
}

-(void)setProgress:(float)progress
{
    _progress = progress;
    _progressLayer.strokeEnd = progress;
    [_progressLayer removeAllAnimations];
}

@end
