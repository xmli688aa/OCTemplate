
//
//  UIButton+ETRecurClick.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/5.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "UIButton+ETRecurClick.h"
#import <objc/runtime.h>

@interface UIButton ()
@property (nonatomic, assign) BOOL ignoreEvent;//是否需要设置延时执行

@end

@implementation UIButton (ETRecurClick)


#pragma mark -延时执行
+ (void)load
{
    
    SEL oldSelector = @selector(sendAction:to:forEvent:);
    SEL newSelector = @selector(__resume_sendAction:to:forEvent:);
    
    Method oldMethod = class_getInstanceMethod(self, oldSelector);
    Method newMethod = class_getInstanceMethod(self, newSelector);
    
    
    if (class_addMethod(self,
                        oldSelector,
                        method_getImplementation(newMethod),
                        method_getTypeEncoding(newMethod))) {
        class_replaceMethod(self,
                            newSelector,
                            method_getImplementation(oldMethod),
                            method_getTypeEncoding(oldMethod));
    } else {
        method_exchangeImplementations(oldMethod, newMethod);
    }
}
- (void)__resume_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if (self.ignoreEvent){
        return;
    }
    if (self.resumeEventInterval > 0){
        self.ignoreEvent = YES;
        //GCD多线程延时执行
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.resumeEventInterval * NSEC_PER_SEC));
        dispatch_after(time, dispatch_get_main_queue(), ^{
            self.ignoreEvent = NO;
        });
    }
    [self __resume_sendAction:action to:target forEvent:event];
}

# pragma mark - set get
- (void)setResumeEventInterval:(NSTimeInterval)resumeEventInterval
{
    objc_setAssociatedObject(self, @selector(resumeEventInterval), @(resumeEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSTimeInterval)resumeEventInterval
{
    return [objc_getAssociatedObject(self, @selector(resumeEventInterval)) doubleValue];
}


- (void)setIgnoreEvent:(BOOL)ignoreEvent
{
    objc_setAssociatedObject(self, @selector(ignoreEvent), [NSNumber numberWithBool:ignoreEvent], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)ignoreEvent
{
    
    return [objc_getAssociatedObject(self,  @selector(ignoreEvent)) boolValue];
}



@end
