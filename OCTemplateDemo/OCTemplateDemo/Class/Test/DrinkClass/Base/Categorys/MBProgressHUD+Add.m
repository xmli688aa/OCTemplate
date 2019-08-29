//
//  MBProgressHUD+Add.m
//  视频客户端
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+Add.h"
static const NSInteger loadingTag = 10101;

@implementation MBProgressHUD (Add)

//只显示一个loading
+ (void)showLoadingSingleInView:(UIView *)view animated:(BOOL)animated {
    [self showLoadingInView:view text:nil animated:animated];
}
+ (void)showLoadingInView:(UIView *)view text:(NSString *)text animated:(BOOL)animated {
    for (MBProgressHUD *subview in view.subviews) {
        if (subview.tag == loadingTag) {
            return;
        }
    }
    MBProgressHUD *hud = [[self alloc] initWithView:view];
    hud.mode = MBProgressHUDModeCustomView;
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:.8f];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hud_loading"]];
    CABasicAnimation *animation= [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation.toValue = [NSNumber numberWithFloat:M_PI*2];
    animation.duration = 0.8;
    animation.repeatCount = MAXFLOAT;
    [img.layer addAnimation:animation forKey:nil];
    hud.customView = img;
    
    if (text.length > 10) {
        hud.detailsLabel.text = text;
        hud.detailsLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightLight];
    }else{
        hud.label.text = text;
        hud.label.font = [UIFont systemFontOfSize:15 weight:UIFontWeightLight];
    }
    hud.removeFromSuperViewOnHide = YES;
    hud.tag = loadingTag;
    [view addSubview:hud];
    [hud showAnimated:animated];
}

#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:.8f];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    
    [view bringSubviewToFront:hud];
    if (text.length > 10) {
        hud.detailsLabel.text = text;
        hud.detailsLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightLight];
    }else{
        hud.label.text = text;
        hud.label.font = [UIFont systemFontOfSize:15 weight:UIFontWeightLight];
    }
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.margin = 11; //文字与背景的四周间距
    hud.minSize = CGSizeMake(160, 30);
    [hud hideAnimated:YES afterDelay:1.5];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"message_error" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"message_success" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [UIApplication sharedApplication].keyWindow;
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:2.0f];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.contentColor = [UIColor whiteColor];
    
    [view bringSubviewToFront:hud];
    hud.label.text = message;
    hud.label.font = [UIFont systemFontOfSize:15 weight:UIFontWeightLight];
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    //hud.dimBackground = NO;
    
    return hud;
}
@end
