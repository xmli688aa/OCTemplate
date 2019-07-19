//
//  UIButton+Extension.m
//  SQLTest01
//
//  Created by WDeng on 2017/8/10.
//  Copyright © 2017年 WDeng. All rights reserved.
//

#import "UIButton+Extension.h"

#import <objc/runtime.h>

static char touchAreaInsetsKey;
@implementation UIButton (Extension)


- (UIEdgeInsets)touchAreaInsets {
    
    return [objc_getAssociatedObject(self, &touchAreaInsetsKey) UIEdgeInsetsValue];
}

- (void)setTouchAreaInsets:(UIEdgeInsets)touchAreaInsets{
    
    NSValue *value = [NSValue valueWithUIEdgeInsets:touchAreaInsets];
    objc_setAssociatedObject(self, &touchAreaInsetsKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    UIEdgeInsets touchAreaInsets = self.touchAreaInsets;
    CGRect bounds = self.bounds;
    bounds = CGRectMake(bounds.origin.x - touchAreaInsets.left, bounds.origin.y - touchAreaInsets.top, bounds.size.width + touchAreaInsets.left + touchAreaInsets.right, bounds.size.height + touchAreaInsets.top + touchAreaInsets.bottom);
    
    return CGRectContainsPoint(bounds, point);
}

@end
