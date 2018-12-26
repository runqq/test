//
//  ViewController.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/15.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "ViewController.h"
#import "FindViewController.h"
#import "RootViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)NSArray *imgArr;
@property(nonatomic,strong)UIScrollView *scrollV;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollV];
    

}

#pragma mark --> 懒加载
-(NSArray *)imgArr{
    if (!_imgArr) {
        _imgArr = [NSArray arrayWithObjects:@"bootpage1",@"bootpage2",@"bootpage3", nil];
    }
    return _imgArr;
}
-(UIScrollView *)scrollV{
    if (!_scrollV) {
        // 滚动试图
        _scrollV = [[UIScrollView alloc]initWithFrame:self.view.frame];
        // 滚动的范围
        _scrollV.contentSize = CGSizeMake(SCREEN_W * self.imgArr.count , SCREEN_H);
        // 设置分页
        _scrollV.pagingEnabled = YES;
        // 隐藏水平滚动条
        _scrollV.showsHorizontalScrollIndicator = NO;
        // 取消弹簧效果
        _scrollV.bounces = NO;
        // 设置滚动试图的代理
        _scrollV.delegate = self;
        // 创建了四个图片框
        for (int i = 0 ; i < self.imgArr.count ; i++)
        {
            UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(i * SCREEN_W, 0, SCREEN_W, SCREEN_H)];
            // 设置图片
            imgV.image = [UIImage imageNamed:self.imgArr[i]];
            // 设置图片与用户交互
            imgV.userInteractionEnabled = YES;
            if (i == 2)
            {
                UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_H-120, SCREEN_W, 100)];
                btn.backgroundColor = [UIColor clearColor];
                // 将按钮添加到图片(最后一个)
                [imgV addSubview:btn];
                // 点击事件
                [btn addTarget:self action:@selector(dianji) forControlEvents:UIControlEventTouchUpInside];
            }
            // 将图片添加到滚动试图
            [self.scrollV addSubview:imgV];
        }
    }
    return _scrollV;
}
// 立即体验按钮的点击事件
-(void)dianji{
    RootViewController *rootVC = [[RootViewController alloc]init];
    [self presentViewController:rootVC animated:YES completion:nil];
}
@end
