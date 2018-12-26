//
//  VideoTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/21.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *bgView;
@property(nonatomic,strong)UIButton *videoBtn;
@property(nonatomic,strong)UILabel *leftLab;
@property(nonatomic,strong) UIButton *eyeBtn;
@property(nonatomic,strong) UILabel *numLab;
@property(nonatomic,strong) UIButton *dianZBtn;
@property(nonatomic,strong) UILabel *dianZanLab;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
