//
//  ReportTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLCircleProgress.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReportTableViewCell : UITableViewCell

@property(nonatomic,strong)UIView *bgView;

@property(nonatomic,strong)UIImageView *leftImg;
@property(nonatomic,strong)UILabel *titlLab;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UILabel *oneLab;

@property(nonatomic,strong)UILabel *twoLab;
@property(nonatomic,strong)UILabel *leftNum;
@property(nonatomic,strong)UILabel *timeLab;
@property(nonatomic,strong)UILabel *rightNum;
@property(nonatomic,strong)UILabel *minuteLab;

@property(nonatomic,strong)UILabel *threeLab;
@property(nonatomic,strong)UIImageView *growImg;
@property(nonatomic,strong)UILabel *growLab;
@property(nonatomic,strong)UIButton *arrowsBtn;


@property(nonatomic,strong)XLCircleProgress *_circle;

@end

NS_ASSUME_NONNULL_END
