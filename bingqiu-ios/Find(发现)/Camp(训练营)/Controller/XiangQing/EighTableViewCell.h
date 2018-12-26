//
//  EighTableViewCell.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EighTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel    *titleLab;
@property(nonatomic,strong)UIButton   *boultBtn;// 箭头按钮
@property(nonatomic,strong)UITextView *attionView;
@property(nonatomic,strong)UILabel    *lineLab;

//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
