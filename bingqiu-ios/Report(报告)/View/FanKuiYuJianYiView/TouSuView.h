//
//  TouSuView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/5.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TouSuView : UITableViewCell<UITextViewDelegate>

@property(nonatomic,strong)UITextView  *textV;
@property(nonatomic,strong)UILabel     *contentLab;
@property(nonatomic,strong)UILabel     *ziShuLab;

@end

NS_ASSUME_NONNULL_END
