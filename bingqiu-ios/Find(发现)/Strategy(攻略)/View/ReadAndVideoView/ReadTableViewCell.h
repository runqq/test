//
//  ReadTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReadTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *contentLab;
@property(nonatomic,strong)UILabel *numberLab;

+(instancetype)cellWithTbaleView:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
