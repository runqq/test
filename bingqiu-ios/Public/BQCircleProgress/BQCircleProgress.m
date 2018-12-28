//
//  BQCircleProgress.m
//  XLCircleProgressDemo
//
//  Created by MacBook Air on 2018/12/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BQCircleProgress.h"
#import "BQCircle.h"
@implementation BQCircleProgress
{
    BQCircle* _circle;
    UILabel *_percentLabel;
    UILabel *_percentLabel1;
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
    _percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.origin.y+110, 200, 40)];
    _percentLabel.textColor = [UIColor colorWithHexString:@"#188bf0"];
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    _percentLabel.font = BQBOLDFONT(21);
    _percentLabel.text = @"0";
    _percentLabel.center = CGPointMake(self.center.x, self.bounds.origin.y + 60);
    [self addSubview:_percentLabel];
    
    _percentLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.origin.y+150, 200, 20)];
    _percentLabel1.textColor = [UIColor colorWithHexString:@"#666666"];
    _percentLabel1.textAlignment = NSTextAlignmentCenter;
    _percentLabel1.text = @"总进球(个)";
    _percentLabel1.font = BQFONT(11);
    _percentLabel1.center = CGPointMake(self.center.x, self.bounds.origin.y + 88);
    [self addSubview:_percentLabel1];
    
    // 圆圈的宽度
    float lineWidth = 5;
    _circle = [[BQCircle alloc] initWithFrame:self.bounds lineWidth:lineWidth];
    
    [self addSubview:_circle];
    
}

#pragma mark -
#pragma mark Setter方法
-(void)setProgress:(float)progress
{
    _progress = progress;
    _circle.progress = progress;
    _percentLabel.text = [NSString stringWithFormat:@"%.0lf",progress*100];
}

@end
