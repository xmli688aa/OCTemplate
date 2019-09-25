//
//  UILabel+ETFontSize.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/25.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "UILabel+ETFontSize.h"
#import <objc/runtime.h>

#define kScale MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) / 375

@implementation UILabel (ETFontSize)

//只执行一次的方法，在这个地方 替换方法
+ (void)load{
    //保证线程安全
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        //拿到系统方法
        SEL orignalSel3 = @selector(awakeFromNib);
        Method orignalM3 = class_getInstanceMethod(class, orignalSel3);
        SEL swizzledSel3 = @selector(testFontAwakeFromNib);
        Method swizzledM3 = class_getInstanceMethod(class, swizzledSel3);
        BOOL didAddMethod3 = class_addMethod(class, orignalSel3, method_getImplementation(swizzledM3), method_getTypeEncoding(swizzledM3));
        if (didAddMethod3) {
            class_replaceMethod(class, swizzledSel3, method_getImplementation(orignalM3), method_getTypeEncoding(orignalM3));
        }else{
            method_exchangeImplementations(orignalM3, swizzledM3);
        }
    });
}
#pragma mark -使用的替换方法
- (void)testFontAwakeFromNib{
    [self testFontAwakeFromNib];
    
    self.font = [UIFont systemFontOfSize:self.font.pointSize];
}
@end
