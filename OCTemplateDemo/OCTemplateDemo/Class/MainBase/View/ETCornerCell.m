//
//  ETCornerCell.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/4.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETCornerCell.h"

@implementation ETCornerCell

- (void)setUI{
    _postion = Middle;
   
    [self setCorners];

}

- (void)setCorners{
    CGFloat cornerRadius = 4;

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
        case Middle:
//            [self addBezizerPathWithUIRectCorner:UIRectCornerAllCorners];
            break;
            
        default:
            break;
    }
}
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 10;
    
    frame.size.width -= 2 * 10;
    
    [super setFrame:frame];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [self setCorners];
    
}
- (void)addBezizerPathWithUIRectCorner:(UIRectCorner)rectCorner{
    //圆率
    CGFloat cornerRadius = 10.0;
    //绘制曲线
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    //cell的背景色透明
    self.backgroundColor = [UIColor clearColor];
    //新建一个图层
    CAShapeLayer *layer = [CAShapeLayer layer];
    //图层边框路径
    layer.path = bezierPath.CGPath;
    //图层填充色，也就是cell的底色
    layer.fillColor = [UIColor whiteColor].CGColor;
    //图层边框线条颜色
    /*
     如果self.tableView.style = UITableViewStyleGrouped时，每一组的首尾都会有一根分割线，目前我还没找到去掉每组首尾分割线，保留cell分割线的办法。
     所以这里取巧，用带颜色的图层边框替代分割线。
     这里为了美观，最好设为和tableView的底色一致。
     设为透明，好像不起作用。
     */
    layer.strokeColor = [UIColor grayColor].CGColor;
    //将图层添加到cell的图层中，并插到最底层
    [self.layer insertSublayer:layer atIndex:0];
}


@end
