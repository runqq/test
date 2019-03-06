//
//  Encryption.h
//  bingtui-ios
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encryption : NSObject

//md5加密方法
//+ (NSString *)md5EncryptWithString:(NSString *)string;
+(NSString *)md5:(NSString *)input;

@end
