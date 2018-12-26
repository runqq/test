//
//  CircleView.m
//  YKL
//
//  Created by Apple on 15/12/7.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "XLCircleProgress.h"
#import "XLCircle.h"

@implementation XLCircleProgress
{
    XLCircle* _circle;
    UILabel *_percentLabel;
//    UILabel *_percentLabel1;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}


-(void)initUI
{
    float lineWidth = 5;
    _percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 200, 30)];
    _percentLabel.textColor = [UIColor colorWithHexString:@"#188bf0"];
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    _percentLabel.font = BQBOLDFONT(21);
    _percentLabel.text = @"0";
   _percentLabel.center = CGPointMake(self.center.x, 60);
    [self addSubview:_percentLabel];
    
    self.percentLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 105, 200, 20)];
    self.percentLabel1.textColor = [UIColor colorWithHexString:@"#666666"];
    self.percentLabel1.textAlignment = NSTextAlignmentCenter;
    self.percentLabel1.font = BQFONT(11);
    self.percentLabel1.text = @"总滑行距离(米)";
    self.percentLabel1.center = CGPointMake(self.center.x, 88);
    [self addSubview:self.percentLabel1];
    
    _circle = [[XLCircle alloc] initWithFrame:self.bounds lineWidth:lineWidth];
    [self addSubview:_circle];
}

#pragma mark -
#pragma mark Setter方法
-(void)setProgress:(float)progress
{
    _progress = progress;
   _circle.progress = progress;
   _percentLabel.text = [NSString stringWithFormat:@"%.lf",progress*20000];
}

@end
