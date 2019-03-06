//
//  RecordTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/24.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecordTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *bImg;

@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *stateLab;
@property(nonatomic,strong)UILabel *cardLab;
@property(nonatomic,strong)UILabel *cardCountLab;

@property(nonatomic,strong)UILabel *knotLab;
@property(nonatomic,strong)UILabel *knotCountLab;
@property(nonatomic,strong)UILabel *usedLab;
@property(nonatomic,strong)UILabel *usedCountLab;
@property(nonatomic,strong)UILabel *surplusLab;
@property(nonatomic,strong)UILabel *surplusCountLab;

+(instancetype)cellWithTableView:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
