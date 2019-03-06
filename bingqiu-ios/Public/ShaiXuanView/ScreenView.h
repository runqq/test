//
//  ScreenView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScreenView : UIView<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *leftTable;
@property(nonatomic,strong)UITableView *rightTable;

@property(nonatomic,strong)UIButton *cancelBtn;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)UILabel *topLine;
@property(nonatomic,strong)UILabel *midLine;

@property(nonatomic,assign)NSIndexPath *selIndex;//单选，当前选中的行

@property(nonatomic , copy)NSString  *yearStr; // 年
@property(nonatomic , copy)NSString *monthStr; // 月

// 展示自定义筛选试图
-(void)showCustomScreenView:(UIView *)view;
// 返回自定义view
-(void)dissmissCustomScreenView;


@end

NS_ASSUME_NONNULL_END
