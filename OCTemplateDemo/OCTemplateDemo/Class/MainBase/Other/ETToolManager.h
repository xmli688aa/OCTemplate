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


/// 获得日期组件，可以拿到 年、月、日、星期、时、分、秒等
+ (NSDateComponents*)dateComponentsWithDate:(NSDate *)inputDate;
/// 日期格式转换为字符串显示
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString*)format;
/// 字符串转换为日期格式
+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString*)format;
///计算两个日期相隔时间(多少秒)
+ (NSTimeInterval )calculateTimeBetweenBeginTime:(NSString *)beginTime endTime:(NSString *)endTime;

/** 正则表达式验证手机号码 YES 合法，NO 不合法*/
+ (BOOL)isValidatePhone:(NSString *)phone;
/**正则表达式验证邮箱是否合法 @return YES 合法，NO 不合法*/
+ (BOOL)isValidateEmail:(NSString *)originalEmail;
/** 正则表达式验证密码是否合法 YES 合法，NO 不合法 */
+ (BOOL)isValidatePwd:(NSString *)originalPwd;

/** 转换货币字符串 */
+ (NSString *)getMoneyString:(double)money;


@end

NS_ASSUME_NONNULL_END
