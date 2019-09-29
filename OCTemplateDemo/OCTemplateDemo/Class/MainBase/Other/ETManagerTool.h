//
//  ETManagerTool.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/29.
//  Copyright © 2019 zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETManagerTool : NSObject


///获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;

///获取屏幕截图
+ (UIImage *)screenShot;
///传入需要截取的view
+ (UIImage *)screenShotView:(UIView *)view;



@end

NS_ASSUME_NONNULL_END
