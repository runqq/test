//
//  AccountTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *dateLab;
@property(nonatomic,strong)UILabel *zhiChuLab;
@property(nonatomic,strong)UILabel *chongZhiLab;
@property(nonatomic,strong)UIButton *downbtn;

+(instancetype)cellWithTableview:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
