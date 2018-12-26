//
//  ReadThreeTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/19.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^BtnClickedBlock) (BOOL); //参数表示是否是必读界面

@interface ReadThreeTableViewCell : UITableViewCell

@property(nonatomic,strong)UIButton *readBtn;
@property(nonatomic,strong)UILabel *readLineLab;
@property(nonatomic,strong)UILabel *separatorLab;
@property(nonatomic,strong)UIButton *videoBtn;
@property(nonatomic,strong)UILabel *videoLineLab;
@property(nonatomic,strong)UILabel *lineLab;
@property(nonatomic,copy) BtnClickedBlock btnClickedBlock;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
