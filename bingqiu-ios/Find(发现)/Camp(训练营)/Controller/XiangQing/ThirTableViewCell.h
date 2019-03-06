//
//  ThirTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThirTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *trainTimeLab;// 训练时间
@property(nonatomic,strong)UILabel *trainDateLab;
@property(nonatomic,strong)UILabel *applyTimeLab;// 报名时间
@property(nonatomic,strong)UILabel *applyDateLab;
@property(nonatomic,strong)UILabel *lineLab;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
