//
//  JiangXueJinTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JiangXueJinTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *titLab;
@property(nonatomic,strong)UILabel *subLab;
@property(nonatomic,strong)UILabel *moneyLab;
@property(nonatomic,strong)UIImageView *arrowsImg;
@property(nonatomic,strong)UILabel *lineLab;

+(instancetype)cellWithTableview:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
