//
//  WantToSeeDetailModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/2.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WantToSeeDetailModel : NSObject

@property(nonatomic , copy)NSString  *photo;
@property(nonatomic ,strong)NSString  *title;
@property(nonatomic , assign)NSNumber  *titleID;

@end

NS_ASSUME_NONNULL_END
