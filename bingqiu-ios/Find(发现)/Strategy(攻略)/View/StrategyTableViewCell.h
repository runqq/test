//
//  StrategyTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StrategyTableViewCell : UITableViewCell

@property(nonatomic,strong) UILabel *titLab;

@property(nonatomic,strong)UIButton *leftBtn,*rightBtn;
@property(nonatomic,strong) UIImageView *leftImg,*rightImg;
@property(nonatomic,strong) UILabel *leftLab,*rightLab;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
