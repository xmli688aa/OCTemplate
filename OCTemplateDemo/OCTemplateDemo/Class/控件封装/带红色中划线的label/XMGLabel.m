//
//  XMGLabel.m
//  08-分页
//
//  Created by xiaomage on 15/5/29.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGLabel.h"

@implementation XMGLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)setup
{
    self.textColor = [UIColor redColor];
    self.textAlignment = NSTextAlignmentCenter;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [self.textColor set];
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    UIRectFill(CGRectMake(0, h * 0.3, w, 1));
}

@end
