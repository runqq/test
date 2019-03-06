//
//  ReportHeadView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/29.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportViewController.h"
#import "HomePageModel.h"
#import "HomePageViewModel.h"
#import "HomePageDetailModel.h"


NS_ASSUME_NONNULL_BEGIN


@interface ReportHeadView : UIView

@property(nonatomic,strong)HomePageModel *homePageModel;
@property(nonatomic,strong)HomePageViewModel *homePageViewModel;
@property(nonatomic,strong)HomePageDetailModel *homePageDetailModel;

@property(nonatomic,strong)UIImageView *bgImg;

@property(nonatomic,strong)UIButton *leftBtn;
@property(nonatomic,strong)UILabel *titlLab;
@property(nonatomic,strong)UIButton *rightBtn;

@property(nonatomic,strong)UIButton *bg_medal_Btn;
@property(nonatomic,strong)UIImageView *medal_distance_1_Img;
@property(nonatomic,strong)UIImageView *medal_distance_2_Img;
@property(nonatomic,strong)UILabel *myMedalLab;

@property(nonatomic,strong)NSMutableArray *numArr;


@end

NS_ASSUME_NONNULL_END
