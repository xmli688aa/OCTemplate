//
//  UIButton+Extension.h
//  SQLTest01
//
//  Created by WDeng on 2017/8/10.
//  Copyright © 2017年 WDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)
//给button增加一个点击范围属性
@property (nonatomic,assign) UIEdgeInsets touchAreaInsets;

@end
