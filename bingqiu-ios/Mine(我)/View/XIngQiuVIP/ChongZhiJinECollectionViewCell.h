//
//  ChongZhiJinECollectionViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BecomeVIPDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChongZhiJinECollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UILabel *monthLab;
@property(nonatomic,strong)UILabel *moneyLab;
@property(nonatomic,strong)UILabel *lab;
@property(nonatomic , strong)BecomeVIPDetailModel  *detailModel;
@end

NS_ASSUME_NONNULL_END
