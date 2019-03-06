//
//  InformationTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InformationTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *imageV;                      // 表格图片视图
@property (nonatomic, strong) UILabel *titleLabel;                      // 头标题
@property (nonatomic, strong) UIImageView *readImage;                  // 阅读图片
@property (nonatomic, strong) UIImageView *zanImage;                  // 点赞图片
@property (nonatomic, strong) UILabel *readLabel;                       // 阅读量
@property (nonatomic, strong) UILabel *zanLabel;                      // 点赞量
@property(nonatomic , strong) UILabel *bottomLine;                     // 底部线条

+(instancetype)cellWithTableVIew:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
