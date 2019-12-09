//
//  ETFlowView.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/12/9.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETFlowView.h"

@implementation ETFlowView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //背景色和绘制背景色必须同时设置
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {

    //通过UIGraphicsGetCurrentContext来获取需要处理的上下文线条。
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置绘制的背景色(不设置默认为黑色)
    [[UIColor clearColor] set];
    CGContextFillRect(context, rect);

    //设置线条的宽度。
//    CGContextSetLineWidth(context, 5.0);
    //设置线条的颜色
//    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    //设置虚线
//    CGFloat dashArray[] = {1, 3};
//    CGContextSetLineDash(context, 1, dashArray, 2);
    //绘制不规则图形方法
    //创建6个点
    CGFloat space = 5;
    CGPoint startPoint = CGPointMake(0, self.height-space);
    CGPoint point2 = CGPointMake(0, self.height);
    CGPoint point3 = CGPointMake(space, self.height);
    CGPoint point4 = CGPointMake(self.width, space);
    CGPoint point5 = CGPointMake(self.width, 0);
    CGPoint point6 = CGPointMake(self.width-space, 0);

    CGContextMoveToPoint(context, startPoint.x, startPoint.y);
    CGContextAddLineToPoint(context, point2.x, point2.y);
    CGContextAddLineToPoint(context, point3.x, point3.y);
    CGContextAddLineToPoint(context, point4.x, point4.y);
    CGContextAddLineToPoint(context, point5.x, point5.y);
    CGContextAddLineToPoint(context, point6.x, point6.y);
    CGContextAddLineToPoint(context, startPoint.x, startPoint.y);
    
    //绘制圆形方法
//    CGContextAddArc(context, self.width/2, self.height/2, self.width/4, 0, 2*M_PI, 0);

    //填充
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    //绘制路径及填充模式
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
