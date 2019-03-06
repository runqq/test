//
//  StrategyTwoTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StrategyTwoTableViewCell : UITableViewCell


@property(nonatomic,strong) UIImageView *leftImg;
@property(nonatomic , strong)UILabel    *lineLab;
@property(nonatomic,strong) UILabel *zhuLab;
@property(nonatomic,strong) UILabel *fuLab;
@property(nonatomic,strong) UIButton *eyeBtn;
@property(nonatomic,strong) UILabel *numLab;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
