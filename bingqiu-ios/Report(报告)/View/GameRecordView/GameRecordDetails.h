//
//  GameRecordDetails.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/30.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameRecordDetails : UITableViewCell

@property(nonatomic,strong)UILabel *timeLab;
@property(nonatomic,strong)UIImageView *bg_list_Img;
@property(nonatomic,strong)UILabel *titlLab;
@property(nonatomic,strong)UILabel *firTeam;
@property(nonatomic,strong)UILabel *firNum;
@property(nonatomic,strong)UILabel *secTeam;
@property(nonatomic,strong)UILabel *secNum;

@end

NS_ASSUME_NONNULL_END
