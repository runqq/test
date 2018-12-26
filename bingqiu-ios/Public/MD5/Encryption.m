//
//  Encryption.m
//  bingrui-ios
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "Encryption.h"
#import <CommonCrypto/CommonDigest.h>

//秘钥
static NSString *encryptionKey = @"nha735n197nxn(N′568GGS%d~~9naei';45vhhafdjkv]32rpks;lg,];:vjo(&**&^)";

@implementation Encryption
//
//+ (NSString *)md5EncryptWithString:(NSString *)string{
//    return [self md5:[NSString stringWithFormat:@"%@%@", encryptionKey, string]];
//}
//
//+ (NSString *)md5:(NSString *)string{
//    const char *cStr = [string UTF8String];
//    unsigned char digest[CC_MD5_DIGEST_LENGTH];
//
//    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
//
//    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
//    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
//        [result appendFormat:@"%02X", digest[i]];
//    }
//
//    return result;
//}

+(NSString *)md5:(NSString *)input {
    
    const char *cStr = [input UTF8String];
    
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5( cStr, strlen(cStr), digest ); // This is the md5 call

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        
        [output appendFormat:@"%02x", digest[i]];
   
    return  output;
    
}

@end
