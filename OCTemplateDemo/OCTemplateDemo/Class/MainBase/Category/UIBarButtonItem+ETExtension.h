//
//  UIBarButtonItem+ETExtension.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/10/13.
//  Copyright © 2019 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (ETExtension)

///内部添加UIButton控件 由insideBtn来设置UIBarButtonItem
@property (nonatomic, strong) UIButton *insideBtn;

/// 快速创建 UIBarButtonItem
/// @param title 标题(如果只使用图片 文字传空即可)
/// @param target target
/// @param action 方法
/// @param image 图片(如果只使用文字 图片传空即可)
+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action image:(NSString *)image;

@end

NS_ASSUME_NONNULL_END
