//
//  ETCornerCell.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/4.
//  Copyright © 2019  . All rights reserved.
//

#import "ETCornerCell.h"

@implementation ETCornerCell

- (void)setUI{
    //布局UI
}

/**
 设置圆角
 */
- (void)setCorners{
    switch (self.postion) {
        case Solo:
            [self addBezizerPathWithUIRectCorner:UIRectCornerAllCorners];
            break;
        case First:
            [self addBezizerPathWithUIRectCorner:UIRectCornerTopLeft | UIRectCornerTopRight];
            break;
        case Last:
            [self addBezizerPathWithUIRectCorner:UIRectCornerBottomLeft | UIRectCornerBottomRight];
            break;
        case Middle://中间的话就不切圆角
//            [self addBezizerPathWithUIRectCorner:UIRectCornerAllCorners];
            break;
            
        default:
            break;
    }
}

/**
 设置cell的宽度
 */
- (void)setFrame:(CGRect)frame {
    CGFloat space = 20;
    frame.origin.x += space;
    frame.size.width -= 2 * space;
    [super setFrame:frame];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self setCorners];
}
- (void)addBezizerPathWithUIRectCorner:(UIRectCorner)rectCorner{
    //圆率
    CGFloat cornerRadius = 8.0;
    //绘制曲线
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = bezierPath.CGPath;
    self.layer.mask = layer;

}


@end
