//
//  ChongZhiMiMaViewModel.h
//  bingqiu-ios
//
//  Created by MacBook Air on 2018/11/20.
//  Copyright © 2018年 MacBook Air. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ChongZhiMiMaModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ChongZhiMiMaViewModel : NSObject

-(void)getChongZhiMiMaWithPassword:(NSString *)password Success:(void(^)(ChongZhiMiMaModel *zhongZhiModel))success  Failture:(void(^)(ChongZhiMiMaModel *chongZhiError))failture;

@end

NS_ASSUME_NONNULL_END
