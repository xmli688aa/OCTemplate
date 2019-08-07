//
//  UIImage+ResszingImage.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/4.
//  Copyright © 2019  . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ResszingImage)

/**
 防止图片拉伸

 @param name 图片名称
 @return 新的没有拉伸的图片
 */
+ (UIImage *)resizableImageWithName:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
