//
//  ETWordRollView.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ETWordRollView : UIView

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) UIColor *textColor;

/// 初始化方法
/// @param frame Frame
/// @param content 内容
/// @param textFont 文字大小
/// @param color 文字颜色
-(instancetype)initWithFrame:(CGRect)frame contentText:(NSString*)content textFont:(UIFont *)textFont textColor:(UIColor*)color;

/**
 *开始滚动动画
 */
-(void)startRollAnimation;

/**
 *停止滚动动画
 */
-(void)stoprollAnimation;
@end
