//
//  SixTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SixTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *titleLab; // 训练内容

@property(nonatomic,strong)UITextView *textV;

//@property(nonatomic,strong)UILabel *contentLabOne;
//@property(nonatomic,strong)UILabel *contentLabTwo;
//@property(nonatomic,strong)UILabel *contentLabThree;
//@property(nonatomic,strong)UILabel *contentLabFour;

@property(nonatomic,strong)UILabel *line;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
