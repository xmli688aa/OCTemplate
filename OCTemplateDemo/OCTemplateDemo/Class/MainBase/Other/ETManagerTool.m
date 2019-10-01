
//
//  ETManagerTool.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/29.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETManagerTool.h"

@implementation ETManagerTool
//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC {
    UIViewController *result = nil;
    UIViewController *rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    do {
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navi = (UINavigationController *)rootVC;
            UIViewController *vc = [navi.viewControllers lastObject];
            result = vc;
            rootVC = vc.presentedViewController;
            continue;
        } else if([rootVC isKindOfClass:[UITabBarController class]]) {
            UITabBarController *tab = (UITabBarController *)rootVC;
            result = tab;
            rootVC = [tab.viewControllers objectAtIndex:tab.selectedIndex];
            continue;
        } else if([rootVC isKindOfClass:[UIViewController class]]) {
            result = rootVC;
            rootVC = nil;
        }
    } while (rootVC != nil);
    
    return result;
}

+ (UIImage *)screenShot{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    UIGraphicsBeginImageContext(screenRect.size);
    UIGraphicsGetCurrentContext();
    UIViewController *currentVC = [self getCurrentVC];
    [currentVC.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();        //image就是截取的图片
    UIGraphicsEndImageContext();
    return image;
}

//传入需要截取的view
+ (UIImage *)screenShotView:(UIView *)view{
    UIImage *imageRet = [[UIImage alloc]init];
    UIGraphicsBeginImageContextWithOptions(view.frame.size, false, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    imageRet = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageRet;
}
@end
