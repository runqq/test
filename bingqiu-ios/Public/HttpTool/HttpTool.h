//
//  HttpTool.h
//  bingrui-ios
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock) (id responseObject);
typedef void (^FailedBlock) (id errorResponseObject);

@interface HttpTool : NSObject
/** Post 请求 */
+(void)PostHttpDataWithUrlStr:(NSString *)url Dic:(NSDictionary *)dic SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailedBlock)failureBlock;

/** Get 请求 */
+(void)GetHttpDataWithUrlStr:(NSString *)url Dic:(NSDictionary *)dic SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailedBlock)failureBlock;



/**
 *  文件上传
 *  @param url     请求URL
 *  @param params  普通的请求参数
 *  @param files   文件参数(里面都是HWHttpFile模型)
 *  @param success 请求成功后的回调
 *  @param failure 请求失败后的回调
 */
+ (void)upLoad:(NSString *)url
        params:(id)params
         files:(NSArray *)files
      progress:(void (^)(id uploadProgress))progress
       success:(void (^)(id responseObject))success
       failure:(void (^)(NSError *error))failure;

@end


@interface HttpFile : NSObject

/** 文件参数名 */
@property (nonatomic, copy) NSString *name;
/** 文件数据 */
@property (nonatomic, strong) NSData *data;
/** 文件类型 */
@property (nonatomic, copy) NSString *mimeType;
/** 文件名 */
@property (nonatomic, copy) NSString *filename;


+ (instancetype)fileWithName:(NSString *)name
                        data:(NSData *)data
                        mimeType:(NSString *)mimeType
                        filename:(NSString *)filename;

@end;
