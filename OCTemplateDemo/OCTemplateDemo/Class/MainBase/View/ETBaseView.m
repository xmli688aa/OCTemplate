//
//  ETBaseView.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/18.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETBaseView.h"

@implementation ETBaseView

- (void)layoutSubviews{
    [super layoutSubviews];
    
}
+ (instancetype )loadViewWithFrame:(CGRect )frame{
    ETBaseView *baseView = [[self alloc] initWithFrame:frame];
    [baseView setSubViews];
    return baseView;
}
- (void)setSubViews{
    
}

+ (instancetype )loadXibWithFrame:(CGRect )frame{
    ETBaseView *baseView = [[self alloc] initWithFrame:frame];
    [baseView addViewFromXib];
    [baseView setSubViews];
    return baseView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
    }
    return self;
}

- (void)addViewFromXib {
    NSString *xibName = NSStringFromClass([self class]);
    UIView *contentView =  [[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil].firstObject ;
    if (!contentView) {
        return;
    }
    contentView.frame = self.bounds;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth| UIViewAutoresizingFlexibleHeight;
    [self addSubview:contentView];

}




@end
