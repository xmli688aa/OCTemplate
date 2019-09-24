
//
//  ETDragRedView.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/25.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETDragRedView.h"

@implementation ETDragRedView


//当触摸移动时调用
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取UITouch对象
    UITouch *touch = [touches anyObject];
    //上一个点:prePoint
    //当前点:curPoint
    //获取上一点
    CGPoint preP = [touch previousLocationInView:self];
    //获取当前点
    CGPoint cur = [touch locationInView:self];
    NSLog(@"preP = %@",NSStringFromCGPoint(preP));
    NSLog(@"cur = %@",NSStringFromCGPoint(cur));
    //x偏移量 = 当前点.x – 上一个点的.x
    CGFloat offsetX = cur.x - preP.x;
    //y偏移量 = 当前点.y – 上一个点的.y
    CGFloat offsetY = cur.y - preP.y;
    
    //让当前View跟着手指移动
    //Transform->平移
    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    
}
@end
