//
//  KeChengXiangQing.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KeChengXiangQing : UITableViewCell

@property(nonatomic,strong)UILabel *topLineLab;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *bottomLineLab;

+(instancetype)cellWithTableView:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
