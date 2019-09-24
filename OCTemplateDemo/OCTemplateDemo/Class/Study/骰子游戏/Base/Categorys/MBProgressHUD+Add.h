//
//  MBProgressHUD+Add.h
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)
//只显示一个loading
+ (void)showLoadingSingleInView:(UIView *)view animated:(BOOL)animated;
//显示带文字的loading
+ (void)showLoadingInView:(UIView *)view text:(NSString *)text animated:(BOOL)animated;
+ (void)showError:(NSString *)error toView:(UIView *)view;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;
@end
