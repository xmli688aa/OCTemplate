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


@end
