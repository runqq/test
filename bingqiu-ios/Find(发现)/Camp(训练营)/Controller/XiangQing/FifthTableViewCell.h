//
//  FifthTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FifthTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *trainSiteLab;// 训练地点
@property(nonatomic,strong)UILabel *siteLab1;
@property(nonatomic,strong)UILabel *siteLab2;
@property(nonatomic,strong)UILabel *line;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
