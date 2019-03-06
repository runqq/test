//
//  StuInformationCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/23.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StuInformationCell : UITableViewCell

@property(nonatomic,strong)UILabel *titLab; // 主标题
@property(nonatomic,strong)UIImageView *detailImg; // 副标题
@property(nonatomic,strong)UIImageView *headImg; // 头像
@property(nonatomic,strong)UILabel *bottomLine;

@end

NS_ASSUME_NONNULL_END
