//
//  StrategyOneTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AllStraDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface StrategyOneTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel *titleLab;
@property(nonatomic,strong) UIButton *firstBtn;
@property(nonatomic , strong)UIView  *bgView;
@property(nonatomic , strong)NSMutableArray  *btnMarr;

@property(nonatomic,copy) void(^btnClickedBlock)(NSInteger index);

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
