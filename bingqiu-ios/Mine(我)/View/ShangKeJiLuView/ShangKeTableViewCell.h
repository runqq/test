//
//  ShangKeTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShangKeTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *titlLab;
@property(nonatomic,strong)UILabel *detailLab;
@property(nonatomic,strong)UILabel *rightLab;
@property(nonatomic,strong)UILabel *rightDetailLab;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UILabel *lineLab;

+(instancetype)cellWithTableView:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
