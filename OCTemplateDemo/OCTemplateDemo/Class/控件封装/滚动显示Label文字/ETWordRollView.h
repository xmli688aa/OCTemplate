//
//  ETWordRollView.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ETWordRollView : UIView
/**
 *初始化方法,指定view的frame，title,titleColor
 */
-(instancetype)initWithFrame:(CGRect)frame title:(NSString*)title TextColor:(UIColor*)color;

/**
 *开始滚动动画
 */
-(void)startRollAnimation;

/**
 *停止滚动动画
 */
-(void)stoprollAnimation;
@end
