//
//  GameRecordCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/30.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BQCircleProgress.h"


NS_ASSUME_NONNULL_BEGIN

@interface GameRecordCell : UITableViewCell

@property(nonatomic,strong)UIView *bgView;

@property(nonatomic,strong)UIImageView *leftImg;
@property(nonatomic,strong)UILabel *titlLab;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UILabel *oneLab;



@property(nonatomic,strong)UILabel *gameTimeNum;
@property(nonatomic,strong)UILabel *gameTimeLab;
@property(nonatomic,strong)UILabel *assistNum;
@property(nonatomic,strong)UILabel *assistLab;

@property(nonatomic,strong)UILabel *twoLab;
@property(nonatomic,strong)UILabel *sumGoalNum;
@property(nonatomic,strong)UILabel *sumGoalLab;
@property(nonatomic,strong)UILabel *shouFaNum;
@property(nonatomic,strong)UILabel *shouFaLab;
@property(nonatomic,strong)UILabel *shangChangNum;
@property(nonatomic,strong)UILabel *shangChangLab;

@property(nonatomic,strong)UILabel *huaXingJuLiLab;
@property(nonatomic,strong)UILabel *huaXingJuLiNum;

@property(nonatomic,strong)UILabel *bottomLab;
@property(nonatomic,strong)UIImageView *growImg;
@property(nonatomic,strong)UILabel *growLab;
@property(nonatomic,strong)UIButton *arrowsBtn;

@property(nonatomic,strong)BQCircleProgress *bqCircle;


@end

NS_ASSUME_NONNULL_END
