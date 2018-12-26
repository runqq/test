//
//  HttpTool.m
//  bingrui-ios
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool

/** Post 请求 */
+(void)PostHttpDataWithUrlStr:(NSString *)url Dic:(NSDictionary *)dic SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailedBlock)failureBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    
    [manager.requestSerializer setValue:[User_Default objectForKey:@"myjsession"] forHTTPHeaderField:@"Cookie"];
    
    //    [manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
    //
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //
    //
    //        NSString  *urlStr = url;
    //        NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:urlStr]];
    //        NSString *jsession ;
    //
    //        for (NSHTTPCookie *cookie in cookiesArray) {
    //            if ([cookie.name isEqualToString:@"JSESSIONID"]) {
    //                jsession = nil;
    //                jsession = cookie.value;
    //
    //                NSString *ss = @"JSESSIONID=";
    //                NSString *jsessionid = [ss stringByAppendingString:jsession];
    //
    //                [User_Default setObject:jsessionid forKey:@"myjsession"];
    //                BRLog(@"%@",jsessionid);
    //                break;
    //            }
    //        }
    //
    //        if (successBlock) {
    //            successBlock(responseObject);
    //        }
    //
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //
    //        if (failureBlock) {
    //            failureBlock(error);
    //        }
    //    }];
    [manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString  *urlStr = url;
        NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:urlStr]];
        
        NSString *jsession ;
        if ([responseObject[@"success"] integerValue]==1) {
            for (NSHTTPCookie *cookie in cookiesArray) {
                if ([cookie.name isEqualToString:@"JSESSIONID"]) {
                    jsession = nil;
                    jsession = cookie.value;
                    
                    NSString *ss = @"JSESSIONID=";
                    NSString *jsessionid = [ss stringByAppendingString:jsession];
                    
                    [User_Default setObject:jsessionid forKey:@"myjsession"];
    //                BQLog(@"---------------%@",jsessionid);
                    break;
                }
            }
        }
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, id  _Nullable ErrorResponseObject) {
        
        if (failureBlock) {
            failureBlock(ErrorResponseObject);
        }
    }];
}

/** Get 请求 */
+(void)GetHttpDataWithUrlStr:(NSString *)url Dic:(NSDictionary *)dic SuccessBlock:(SuccessBlock)successBlock FailureBlock:(FailedBlock)failureBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html", nil];
    [manager.requestSerializer setValue:[User_Default objectForKey:@"myjsession"] forHTTPHeaderField:@"Cookie"];
    //    [manager GET:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
    //
    //    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        NSString  *urlStr = url;
    //        NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:urlStr]];
    //        NSString *jsession ;    //        for (NSHTTPCookie *cookie in cookiesArray) {
    //            if ([cookie.name isEqualToString:@"JSESSIONID"]) {
    //                jsession = nil;
    //                jsession = cookie.value;
    //                NSString *ss = @"JSESSIONID=";
    //                NSString *jsessionid = [ss stringByAppendingString:jsession];
    //                [User_Default setObject:jsessionid forKey:@"myjsession"];
    //                BRLog(@"%@",jsessionid);
    //                break;
    //            }
    //        }
    //        /** 这里是处理事件的回调 */
    //        if (successBlock) {
    //            successBlock(responseObject);
    //        }
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //        /** 这里是处理事件的回调 */
    //        if (failureBlock) {
    //            BRLog(@"%@",error);
    //            failureBlock(error);
    //        }
    //    }];
    [manager GET:url parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString  *urlStr = url;
        NSArray *cookiesArray = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:[NSURL URLWithString:urlStr]];
        NSString *jsession ;
        
        if ([responseObject[@"success"] integerValue]==1) {
            
            for (NSHTTPCookie *cookie in cookiesArray) {
                //              BQLog(@"=========---------=======%@",cookie);
                if ([cookie.name isEqualToString:@"JSESSIONID"]) {
                    jsession = nil;
                    jsession = cookie.value;
                    NSString *ss = @"JSESSIONID=";
                    NSString *jsessionid = [ss stringByAppendingString:jsession];
                    
                    [User_Default setObject:jsessionid forKey:@"myjsession"];
                    //                BQLog(@"================%@",jsessionid);
                    break;
                }
            }
        }
        

        
        /** 这里是处理事件的回调 */
        if (successBlock) {
            successBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, id  _Nullable errorResponseObject) {
        
        /** 这里是处理事件的回调 */
        if (failureBlock) {
//            BQLog(@"%@",errorResponseObject);
            failureBlock(errorResponseObject);
        }
    }];
    
}

+ (void)upLoad:(NSString *)url
        params:(id)params
         files:(NSArray *)files
      progress:(void (^)(id))progress
       success:(void (^)(id))success
       failure:(void (^)(NSError *))failure
{
    // 1.创建一个请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    AFJSONResponseSerializer *jsonResponseS = (AFJSONResponseSerializer *)mgr.responseSerializer;
    jsonResponseS.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    // 2.发送请求
    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (HttpFile *file in files) {
            [formData appendPartWithFileData:file.data name:file.name fileName:file.filename mimeType:file.mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        progress(uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end

@implementation HttpFile

+ (instancetype)fileWithName:(NSString *)name
                        data:(NSData *)data
                    mimeType:(NSString *)mimeType
                    filename:(NSString *)filename
{
    HttpFile *file = [[self alloc] init];
    file.name = name;
    file.data = data;
    file.mimeType = mimeType;
    file.filename = filename;
    return file;
}





@end
