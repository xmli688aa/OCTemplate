//
//  UIBarButtonItem+ETExtension.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/10/13.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "UIBarButtonItem+ETExtension.h"
#import <objc/runtime.h>

@implementation UIBarButtonItem (ETExtension)

+ (UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action image:(NSString *)image {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    // 设置尺寸
    btn.size = btn.currentBackgroundImage.size;
    [btn setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    item.insideBtn = btn;
    return item;
}
- (void)setInsideBtn:(UIButton *)insideBtn{
    objc_setAssociatedObject(self, @"insideBtn", insideBtn, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIButton *)insideBtn{
    return objc_getAssociatedObject(self, @"insideBtn");
}
@end
