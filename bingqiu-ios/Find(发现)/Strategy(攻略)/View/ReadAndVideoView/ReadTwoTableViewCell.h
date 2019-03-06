//
//  ReadTwoTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReadTwoTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *titLab;
@property(nonatomic,strong)UILabel *leftLab;
@property(nonatomic,strong)UITextView *contentTV;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
