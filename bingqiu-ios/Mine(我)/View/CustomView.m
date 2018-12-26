//
//  CustomView.m
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/2.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import "CustomView.h"
#import "CustomCollectionViewCell.h"
#import "ClassRecord.h"
#import "XianJinAccount.h"
#import "JiangXueJinController.h"
#import "RecordViewController.h"
#import "LoginViewController.h"
@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        imgArr = @[@"my_class_icon",@"my_cash_icon",@"my_scholarship_icon",@"my_card_icon"];
        labArr = @[@"上课记录",@"现金账户",@"奖学金账户",@"购卡记录"];
        [self addSubview:self.collectionV];
        
    }
    return self;
}

-(UICollectionView *)collectionV{
    if (!_collectionV) {
        //UICollectionViewLayout  --流水布局对象
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        //设置最小的行间距
        layout.minimumLineSpacing = 0;
        //设置最小的列间距
        layout.minimumInteritemSpacing = 0;
        //单元格大小
        layout.itemSize = CGSizeMake(SCREEN_W/4 , 83);
        //滚动方向
        //UICollectionViewScrollDirectionVertical(垂直)
        //UICollectionViewScrollDirectionHorizontal(水平)
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //创建网格
        _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 83) collectionViewLayout:layout];
        _collectionV.scrollEnabled = NO;
        //网格背景色
        _collectionV.backgroundColor = [UIColor whiteColor];
        //注册cell
        [_collectionV registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
        //设置代理
        _collectionV.delegate = self;
        //设置数据源
        _collectionV.dataSource = self;
        
    }
    return _collectionV;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.photoImg.image = [UIImage imageNamed:imgArr[indexPath.row]];
    cell.titlLab.text = labArr[indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            
            if ([User_Default objectForKey:@"myjsession"]) {
                ClassRecord *skjlVC = [[ClassRecord alloc]init];
                UINavigationController *skjlNav = [[UINavigationController alloc]initWithRootViewController:skjlVC];
                [[self viewController] presentViewController:skjlNav animated:NO completion:nil];
                
            }else{
                
                // 不存在跳转到登录界面
                LoginViewController  *loginVC = [[LoginViewController alloc]initWithLoginSuccessBlock:^{
                    ClassRecord *skjlVC = [[ClassRecord alloc]init];
                    UINavigationController *skjlNav = [[UINavigationController alloc]initWithRootViewController:skjlVC];
                    [[self viewController] presentViewController:skjlNav animated:NO completion:nil];
                }];
                [[self viewController] presentViewController:loginVC animated:NO completion:nil];
                
//                LoginViewController *loginVC = [[LoginViewController alloc]init];
//                [[self viewController] presentViewController:loginVC animated:NO completion:nil];
            }
            
        }
            break;
            
        case 1:{
            
            if ([User_Default objectForKey:@"myjsession"]) {
                XianJinAccount *xjzhVC = [[XianJinAccount alloc]init];
                UINavigationController *xjzhNav = [[UINavigationController alloc]initWithRootViewController:xjzhVC];
                [[self viewController] presentViewController:xjzhNav animated:NO completion:nil];
                
            }else{
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                [[self viewController] presentViewController:loginVC animated:NO completion:nil];
            }
            
        }
            break;
        case 2:{
            if ([User_Default objectForKey:@"myjsession"]) {
                JiangXueJinController *jxjVC = [[JiangXueJinController alloc]init];
                UINavigationController *jxjNav = [[UINavigationController alloc]initWithRootViewController:jxjVC];
                [[self viewController] presentViewController:jxjNav animated:NO completion:nil];
                
            }else{
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                [[self viewController] presentViewController:loginVC animated:NO completion:nil];
            }
            
        }
            break;
        case 3:{
            
            if ([User_Default objectForKey:@"myjsession"]) {
                RecordViewController *gkjlVC = [[RecordViewController alloc]init];
                UINavigationController *gkjlNav = [[UINavigationController alloc]initWithRootViewController:gkjlVC];
                [[self viewController] presentViewController:gkjlNav animated:NO completion:nil];
                
            }else{
                LoginViewController *loginVC = [[LoginViewController alloc]init];
                [[self viewController] presentViewController:loginVC animated:NO completion:nil];
            }
            
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - 获取父控制器
- (UIViewController *)viewController{
    //获取当前view的superView对应的控制器
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
            
        }next = [next nextResponder];
        
    } while (next != nil);
    return nil;
    
}

@end
