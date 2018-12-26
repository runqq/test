//
//  NSObject+BRHUD.m
//  bingrui-ios
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "NSObject+BRHUD.h"
#import <SVProgressHUD.h>
#import "BRProgressHUD.h"

@implementation NSObject (BRHUD)

- (void)showLoadingWithText:(NSString *)aText
{
    [BRProgressHUD showWithStatus:aText];
}


- (void)showErrorText:(NSString *)aText
{
    [BRProgressHUD showErrorWithStatus:aText];
    
}

- (void)showSuccessText:(NSString *)aText
{
    [BRProgressHUD showSuccessWithStatus:aText];
}

- (void)showLoading
{
    [BRProgressHUD show];
}


- (void)dismissLoading
{
    [BRProgressHUD dismiss];
}

- (void)showProgress:(NSInteger)progress
{
    [BRProgressHUD showProgress:progress/100.0 status:[NSString stringWithFormat:@"%li%%",(long)progress]];
}

- (void)showImage:(UIImage*)image text:(NSString*)aText
{
    [BRProgressHUD showImage:image status:aText];
}

@end
