//
//  MyMemberInfoDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/16.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyMemberInfoDetailModel : NSObject

@property(nonatomic,copy)NSString *birthday;
@property(nonatomic,copy)NSString *no;
@property(nonatomic,copy)NSString *guardianName;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *bindMobile;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *position;
@property(nonatomic,copy)NSString *membershipCategoryText;
@property(nonatomic,copy)NSString *genderText;
@property(nonatomic,assign)NSNumber *titleID;
@property(nonatomic,assign)NSNumber *height;
@property(nonatomic,assign)NSNumber *weight;
@property(nonatomic,assign)NSNumber *heatRate;

@end

NS_ASSUME_NONNULL_END
