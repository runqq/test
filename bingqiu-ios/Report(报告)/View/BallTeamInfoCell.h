//
//  BallTeamInfoCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BallTeamInfoCell : UITableViewCell

@property(nonatomic,strong)UIView *bgView;

@property(nonatomic,strong)UIImageView *ballTeamImg;
@property(nonatomic,strong)UILabel *ballTeamLab;
@property(nonatomic,strong)UILabel *topLab;

@property(nonatomic,strong)UILabel *leftLab;
@property(nonatomic,strong)UILabel *rightLab;

@property(nonatomic,strong)UIView *leftView;
@property(nonatomic,strong)UIImageView *positionImg;
@property(nonatomic,strong)UILabel *titLeftLab;
@property(nonatomic,strong)UILabel *subLeftLab;

@property(nonatomic,strong)UIView *midView;
@property(nonatomic,strong)UIImageView *jerseyImg;
@property(nonatomic,strong)UILabel *timidLab;
@property(nonatomic,strong)UILabel *submidLab;

@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UIImageView *racemunImg;
@property(nonatomic,strong)UILabel *titlRightLab;
@property(nonatomic,strong)UILabel *subRightLab;
@property(nonatomic,strong)UILabel *bottomLab;


@property(nonatomic,strong)UILabel *midLab;
@property(nonatomic,strong)UIView *leftBotView;
@property(nonatomic,strong)UIImageView *teamImg;
@property(nonatomic,strong)UILabel *teamLab;
@property(nonatomic,strong)UILabel *teamSubLab;

@property(nonatomic,strong)UIView *rightBotView;
@property(nonatomic,strong)UIImageView *clubImg;
@property(nonatomic,strong)UILabel *clubLab;
@property(nonatomic,strong)UILabel *clubSubLab;

@end

NS_ASSUME_NONNULL_END
