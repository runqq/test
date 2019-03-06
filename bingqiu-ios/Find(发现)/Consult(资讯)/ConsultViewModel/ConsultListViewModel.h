//
//  ConsultListViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/8.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsultListModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface ConsultListViewModel : NSObject

-(void)getConsultListWithPageNum:(NSNumber *)pageNo SizeNum:(NSNumber *)sizenum NewsClassify:(NSString *)newsClassify Success:(void(^)(ConsultListModel  *listModel))success Failture:(void(^)(ConsultListModel *listError))failture;

@end

NS_ASSUME_NONNULL_END
