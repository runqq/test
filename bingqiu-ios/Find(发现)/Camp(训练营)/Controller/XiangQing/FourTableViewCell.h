//
//  FourTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FourTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *amHour;// 上午课时
@property(nonatomic,strong)UILabel *amTime1;
@property(nonatomic,strong)UILabel *amTime2;

@property(nonatomic,strong)UILabel *pmHour;// 下午课时
@property(nonatomic,strong)UILabel *pmTime1;
@property(nonatomic,strong)UILabel *pmTime2;

@property(nonatomic,strong)UILabel *line;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
