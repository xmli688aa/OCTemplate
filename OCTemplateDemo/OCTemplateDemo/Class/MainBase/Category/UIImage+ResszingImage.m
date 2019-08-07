
//
//  UIImage+ResszingImage.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/4.
//  Copyright © 2019  . All rights reserved.
//

#import "UIImage+ResszingImage.h"

@implementation UIImage (ResszingImage)

+ (UIImage *)resizableImageWithName:(NSString *)name{
    UIImage *image = [UIImage imageNamed:name];
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5, imageW * 0.5) resizingMode:UIImageResizingModeStretch];
    return image;
}
@end
