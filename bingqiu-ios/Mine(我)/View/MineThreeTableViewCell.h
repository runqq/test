//
//  MineThreeTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineThreeTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)UILabel *leftLab;
@property(nonatomic,strong)UILabel *middleLab;
@property(nonatomic,strong)UILabel *rightLab;
@property(nonatomic,strong)UILabel *leftNumLab;
@property(nonatomic,strong)UILabel *middleNumLab;
@property(nonatomic,strong)UILabel *rightNumLab;
@property(nonatomic,strong)UILabel *leftLineLab;
@property(nonatomic,strong)UILabel *rightLineLab;

+(instancetype)cellWitTableView:(UITableView *)tableview;

@end

NS_ASSUME_NONNULL_END
