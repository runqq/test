//
//  TopTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/14.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TopTableViewCell : UITableViewCell

@property(nonatomic,strong) UIButton *firstBtn;
@property(nonatomic , strong)UIView  *bgView;
@property(nonatomic,strong)NSMutableArray *btnArr;

@property(nonatomic,copy) void(^btnClickBlock)(NSInteger index);

+(instancetype)cellWithTableVIew:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
