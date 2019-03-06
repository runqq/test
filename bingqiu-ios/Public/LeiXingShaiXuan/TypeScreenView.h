//
//  TypeScreenView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/7.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TypeScreenView : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *typeScreenTbv;
@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)UILabel *topLine;
@property(nonatomic,strong)UILabel *midLine;


@property(nonatomic,strong)NSString *typeStr;

@property(nonatomic,assign)NSIndexPath *selIndex;//单选，当前选中的行

// 展示自定义筛选试图
-(void)showCustomScreenView:(UIView *)view;
// 返回自定义view
-(void)dissmissCustomScreenView;

@end

NS_ASSUME_NONNULL_END
