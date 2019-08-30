//
//  ETXibBaseView.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/8/30.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETXibBaseView.h"

@implementation ETXibBaseView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self loadXibView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self loadXibView];
    }
    return self;
}

- (void)loadXibView{
    NSString *xibName= NSStringFromClass([self class]);
    ETXibBaseView * xibView = [[NSBundle mainBundle] loadNibNamed:xibName owner:self options:nil].firstObject;
    xibView.frame = self.bounds;
    [self addSubview:xibView];
    [self initOthers];
}
///xib加载后 其他一些初始化操作 由子类去实现
- (void)initOthers{
    
}

@end
