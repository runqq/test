//
//  MessageTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/30.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *photoImg;
@property(nonatomic,strong)UILabel *titlLab;
@property(nonatomic,strong)UILabel *subLab;
@property(nonatomic,strong)UILabel *dateLab;

@end

NS_ASSUME_NONNULL_END
