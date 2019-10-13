//
//  ETBaseView.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/18.
//  Copyright © 2019  . All rights reserved.
//

#import "ETBaseView.h"

@implementation ETBaseView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addOtherSubviews];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self addOtherSubviews];
    }
    return self;
}
//添加其他子视图使用
- (void)addOtherSubviews{
    
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    if (self.clipsToBounds || self.hidden || (self.alpha == 0.f)) {
//        return nil;
//    }
//    UIView *result = [super hitTest:point withEvent:event];
//    // 如果事件发生在tabbar里面直接返回
//    if (result) {
//        return result;
//    }
//    // 这里遍历那些超出的部分就可以了，不过这么写比较通用。
//    for (UIView *subview in self.subviews) {
//      
//        // 把这个坐标从tabbar的坐标系转为subview的坐标系
//        CGPoint subPoint = [subview convertPoint:point fromView:self];
//        result = [subview hitTest:subPoint withEvent:event];
//        // 如果事件发生在subView里就返回
//        if (result) {
//            return result;
//        }
//        for (UIView *subView2 in subview.subviews) {
//           CGPoint subPoint = [subView2 convertPoint:point fromView:self];
//            result = [subView2 hitTest:subPoint withEvent:event];
//            // 如果事件发生在subView里就返回
//            if (result) {
//                return result;
//            }
//          }
//    }
//    return nil;
//}
@end
