//
//  MovieAddComment.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/10/26.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieAddComment : UIView

@property (strong,nonatomic) UIView *v_addcomment;

@property(strong,nonatomic) UIView *v_star;
@property(strong,nonatomic) UIView *v_count;

@property(strong,nonatomic)  UIImageView *img_star1;
@property(strong,nonatomic)  UIImageView *img_star2;
@property(strong,nonatomic)  UIImageView *img_star3;
@property(strong,nonatomic)  UIImageView *img_star4;
@property(strong,nonatomic)  UIImageView *img_star5;

@property NSInteger count;
@property BOOL canAddStar;

- (id)initWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
