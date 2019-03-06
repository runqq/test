//
//  LeftTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LeftTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *photoImg;
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UIButton *arrowsBtn;
@property(nonatomic,strong)UILabel *bottomLine;
@property(nonatomic,strong)UILabel *rightLine;

@end

NS_ASSUME_NONNULL_END
