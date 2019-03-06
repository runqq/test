//
//  MovieAddComment.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "MovieAddComment.h"

@implementation MovieAddComment

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.v_addcomment = self;
        self.v_addcomment.frame = CGRectMake(15, 0, SCREEN_W, 30);
        [self addSubview:self.v_count];
        self.v_count.layer.cornerRadius = self.v_count.frame.size.height/2;
        self.v_count.layer.borderWidth = 1.0;
        self.v_count.layer.borderColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1.0].CGColor;
        self.count = -1;
        [self cleamCount];
    }
    return self;
}

-(void)cleamCount{
    self.v_count.hidden = NO;
    self.count = -1;
    [self.img_star1 setImage:[UIImage imageNamed:@"icon_evaluatewindow_nor"]];
    [self.img_star2 setImage:[UIImage imageNamed:@"icon_evaluatewindow_nor"]];
    [self.img_star3 setImage:[UIImage imageNamed:@"icon_evaluatewindow_nor"]];
    [self.img_star4 setImage:[UIImage imageNamed:@"icon_evaluatewindow_nor"]];
    [self.img_star5 setImage:[UIImage imageNamed:@"icon_evaluatewindow_nor"]];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.v_star];
    if((point.x>0 && point.x<self.v_star.frame.size.width)&&(point.y>0 && point.y<self.v_star.frame.size.height)){
        self.canAddStar = YES;
        [self changeStarForegroundViewWithPoint:point];
        
    }else{
        self.canAddStar = NO;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(self.canAddStar){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.v_star];
        [self changeStarForegroundViewWithPoint:point];
    }
    return;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.canAddStar){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self.v_star];
        [self changeStarForegroundViewWithPoint:point];
        
    }
    self.canAddStar = NO;
    
    return;
}

-(void)changeStarForegroundViewWithPoint:(CGPoint)point{
    if(self.v_count.hidden){
        self.v_count.hidden = YES;
    }
    NSInteger count = 0;
    count = count + [self changeImg:point.x image:self.img_star1];
    count = count + [self changeImg:point.x image:self.img_star2];
    count = count + [self changeImg:point.x image:self.img_star3];
    count = count + [self changeImg:point.x image:self.img_star4];
    count = count + [self changeImg:point.x image:self.img_star5];
    if(count==0){
        count = 0;
        [self.img_star1 setImage:[UIImage imageNamed:@"icon_evaluatewindow_nor"]];
    }
    self.count = count;

}

-(NSInteger)changeImg:(float)x image:(UIImageView*)img{
    
    if(x> img.frame.origin.x + img.frame.size.width/2){
        [img setImage:[UIImage imageNamed:@"icon_evaluatewindow_sel"]];
        return 2;
    }else{
        [img setImage:[UIImage imageNamed:@"icon_evaluatewindow_nor"]];
        return 0;
    }
}

-(void)setImageAnimation:(UIView *)v{
    CGRect rec = v.frame;
    [UIView animateWithDuration:0.1 animations:^{
        v.frame = CGRectMake(v.frame.origin.x, v.frame.origin.y -3, v.frame.size.width, v.frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            v.frame = rec;
        } completion:^(BOOL finished) {
            v.frame = rec;
        }];
    }];
}


@end
