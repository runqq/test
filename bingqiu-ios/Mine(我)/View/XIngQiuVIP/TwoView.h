//
//  TwoView.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/12/10.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TwoView : UIView<UITextFieldDelegate>

@property(nonatomic,strong)UILabel *titLab;
@property(nonatomic,strong)UITextField *textField;

@end

NS_ASSUME_NONNULL_END
