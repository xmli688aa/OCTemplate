
//
//  ETTestXibView.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/8/7.
//  Copyright (c) Hello  All rights reserves.
//
        

#import "ETTestXibView.h"

@interface ETTestXibView ()


@end

@implementation ETTestXibView

- (void)initOthers{
    UIView *redV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    redV.backgroundColor = [UIColor redColor];
    [self addSubview:redV];
}

- (IBAction)clickBtn:(id)sender {
    if (self.blcok) {
        self.blcok(2);
    }
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    //判断点在不在blueBtn身上
    CGPoint blueBtnP = [self convertPoint:point toView:self.btn];
    if ([self.btn pointInside:blueBtnP withEvent:event]) {
        //点在blueBtn身上
        return self.btn;
    }
    //如果不在,保持原有做法
    return [super hitTest:point withEvent:event];

}

@end
