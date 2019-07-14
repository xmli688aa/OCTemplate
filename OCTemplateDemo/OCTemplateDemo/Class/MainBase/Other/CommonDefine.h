//
//  CommonDefine.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//

#ifndef CommonDefine_h
#define CommonDefine_h

#pragma mark - 代码简写
#define KDSNotificationCenter       [NSNotificationCenter defaultCenter]
#define KDSUserDefaults             [NSUserDefaults standardUserDefaults]
#define KDSWeakSelf(type)           __weak typeof(type) weak##type = type;

#pragma mark - log开关
#ifdef  DEBUG
#define KDSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define KDSLog(...)
#endif

#pragma mark - 颜色相关
#define KDSRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16 )) / 255.0 green:((( s & 0xFF00 ) >> 8 )) / 255.0 blue:(( s & 0xFF )) / 255.0 alpha:1.0]
#define NaviBackGroundColour       KDSRGBColor(69, 133, 174)
#define ButtonBackGroundColour       KDSRGBColor(52, 115, 160)


#pragma mark - 屏幕相关设置
// 屏幕宽度
#define KDSScreenWidth ((CGRectGetWidth([UIScreen mainScreen].bounds) > CGRectGetHeight([UIScreen mainScreen].bounds))?(CGRectGetHeight([UIScreen mainScreen].bounds)):(CGRectGetWidth([UIScreen mainScreen].bounds)))
// 屏幕高度
#define KDSScreenHeight ((CGRectGetWidth([UIScreen mainScreen].bounds) > CGRectGetHeight([UIScreen mainScreen].bounds))?(CGRectGetWidth([UIScreen mainScreen].bounds)):(CGRectGetHeight([UIScreen mainScreen].bounds)))
//因设计图为1080*1960所以理论上414*736暂变为360*640
// 屏幕高度自适应(ipone6p)
#define KDSAdpatHeightIPhone6P(value) (value * KDSScreenHeight / (KDSScreenHeight != 640.0f ? 640.0f : KDSScreenHeight))
// 屏幕宽度自适应(ipone6p)
#define KDSAdpatWidthIPhone6P(value) (value * KDSScreenWidth / (KDSScreenWidth != 360.0f ? 360.0f : KDSScreenWidth))
// 屏幕高度自适应(ipone6)
#define KDSAdpatHeight(value) (value * KDSScreenHeight / (KDSScreenHeight != 667.0f ? 667.0f : KDSScreenHeight))
// 屏幕宽度自适应(ipone6)
#define KDSAdpatWidth(value) (value * KDSScreenWidth / (KDSScreenWidth != 375.0f ? 375.0f : KDSScreenWidth))
// 屏幕高度自适应(ipone5)
#define KDSAdpatHeightIpone5(value) (value * KDSScreenHeight / (KDSScreenHeight != 568.0f ? 568.0f : KDSScreenHeight))
// 屏幕宽度自适应(ipone5)
#define KDSAdpatWidthIpone5(value) (value * KDSScreenWidth / (KDSScreenWidth != 320.0f ? 320.0f : KDSScreenWidth))

#pragma mark - 版本判断
#define IOS11_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)
#define IOS10_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)
#define IOS9_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define IOS8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IOS7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)




#endif /* CommonDefine_h */
