//
//  MiddleTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MiddleTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *zLabel;
@property(nonatomic,strong)UILabel *fLabel;

+(instancetype)cellWithTableView:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
