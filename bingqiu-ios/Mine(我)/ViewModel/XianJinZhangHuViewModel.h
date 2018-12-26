//
//  XianJinZhangHuViewModel.h0
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/17.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XianJinZhangHuModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XianJinZhangHuViewModel : NSObject

-(void)getXianJinZhangHuWithPageNo:(NSNumber *)pageNo PageSize:(NSNumber *)pageSize accountRecordType:(NSString *)accountRecordType Success:(void(^)(XianJinZhangHuModel *xjzhModel))success  Failture:(void(^)(XianJinZhangHuModel *xjzhError))failture;

@end

NS_ASSUME_NONNULL_END
