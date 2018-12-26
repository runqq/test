//
//  HelpListDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/22.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HelpTypeListDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HelpListDetailModel : NSObject

@property(nonatomic,strong)NSMutableArray  *helpTypeList;
@property(nonatomic,copy)NSString *helpTypeText;
@property(nonatomic,copy)NSString *helpType;

@end

NS_ASSUME_NONNULL_END
