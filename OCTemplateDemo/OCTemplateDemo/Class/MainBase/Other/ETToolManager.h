//
//  ETManagerTool.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/29.
//  Copyright © 2019 zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETToolManager : NSObject


///获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;

///获取屏幕截图
+ (UIImage *)screenShot;
///传入需要截取的view
+ (UIImage *)screenShotView:(UIView *)view;


/// 设置view渐变色
/// @param view 需要设置的view
/// @param startColor 起始颜色
/// @param endColor 结束颜色
/// @param isVertical 是否是竖直方向变化 YES:是 NO:水平方向
+ (void)addGradientColorWithView:(UIView *)view startColor:(UIColor *)startColor endColor:(UIColor *)endColor isVertical:(BOOL )isVertical;

///给UILabel设置行间距
+ (void)setLabelSpace:(UILabel*)label withString:(NSString*)str  lineSpace:(CGFloat )lineSpae;

///获取label的行数和内容
+ (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label;

@end

NS_ASSUME_NONNULL_END
