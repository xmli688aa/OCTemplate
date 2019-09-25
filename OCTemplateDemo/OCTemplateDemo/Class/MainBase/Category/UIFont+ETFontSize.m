//
//  UIFont+ETFontSize.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/25.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "UIFont+ETFontSize.h"
#import <objc/runtime.h>

#define kScale MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) / 375
@implementation UIFont (ETFontSize)

//只执行一次的方法，在这个地方 替换方法
+(void)load{
    
    //保证线程安全
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        //拿到系统方法
        Method orignalMethod = class_getClassMethod(class, @selector(systemFontOfSize:));
        //拿到自己定义的方法
        Method myMethod = class_getClassMethod(class, @selector(test_systemFontOfSize:));
        //交换方法
        method_exchangeImplementations(orignalMethod, myMethod);
    });
}

+ (UIFont *)test_systemFontOfSize:(CGFloat)fontSize{
    UIFont *font = [UIFont test_systemFontOfSize:fontSize*kScale];
    return font;
}
@end
