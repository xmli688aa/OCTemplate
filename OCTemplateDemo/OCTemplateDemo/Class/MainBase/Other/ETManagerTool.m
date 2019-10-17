
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


+ (void)addGradientColorWithView:(UIView *)view startColor:(UIColor *)startColor endColor:(UIColor *)endColor isVertical:(BOOL )isVertical{
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = view.bounds;
    gradientLayer.colors = @[(__bridge id)startColor.CGColor,(__bridge id)endColor.CGColor];
    //    startPoint & endPoint设置为(0,0)(1.0,0)代表水平方向渐变,(0,0)(0,1.0)代表竖直方向渐变
    gradientLayer.startPoint = CGPointMake(0, 0);
    
    if (isVertical) {
        gradientLayer.endPoint = CGPointMake(0, 1.0);
    }else{
        gradientLayer.endPoint = CGPointMake(1.0,0);
    }
    gradientLayer.locations = @[@0,@1];
    [view.layer addSublayer:gradientLayer];

}
//给UILabel设置行间距和字间距
+ (void)setLabelSpace:(UILabel*)label withString:(NSString*)str  lineSpace:(CGFloat )lineSpae{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpae; // 行间距
//    [paragraphStyle setMinimumLineHeight:20.0];
//    [paragraphStyle setMaximumLineHeight:20.0];

    NSRange range = NSMakeRange(0, [str length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    label.attributedText = attributedString;
    
//    //设置字间距 NSKernAttributeName:@1.5f
////    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
////    };
//    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str];
//    label.attributedText = attributeStr;
    
}


@end
