//
//  UIImage+ETColor.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/10/3.
//  Copyright © 2019 zhao. All rights reserved.
//



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ETColor)

/// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;


@end

NS_ASSUME_NONNULL_END
