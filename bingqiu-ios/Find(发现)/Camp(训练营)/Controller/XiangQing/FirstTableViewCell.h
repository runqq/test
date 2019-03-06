//
//  FirstTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *titLab1;
@property(nonatomic,strong)UILabel *titLab2;
@property(nonatomic,strong)UILabel *titLab3;
@property(nonatomic,strong)UILabel *numLab1;
@property(nonatomic,strong)UILabel *numLab2;
@property(nonatomic,strong)UILabel *numLab3;
@property(nonatomic,strong)UILabel *dayLab;
@property(nonatomic,strong)UILabel *hourLab;
@property(nonatomic,strong)UILabel *moneyLab;


+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
