//
//  ETBaseView.m
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/18.
//  Copyright © 2019  . All rights reserved.
//

#import "ETDrinkBaseView.h"

@implementation ETDrinkBaseView

- (void)layoutSubviews{
    [super layoutSubviews];
    
}
- (void)awakeFromNib{
    [super awakeFromNib];
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

//纯代码创建view
+ (instancetype )loadViewWithFrame:(CGRect )frame{
    ETDrinkBaseView *baseView = [[self alloc] initWithFrame:frame];
    [baseView addOtherSubviews];
    return baseView;
}

//xib加载view
+ (instancetype )loadXibWithFrame:(CGRect )frame{
    ETDrinkBaseView *baseView = [[self alloc] initWithFrame:frame];
    NSString *xibName = NSStringFromClass([self class]);
    ETDrinkBaseView *xibView =  [[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil].firstObject ;
    xibView.frame = frame;
    [baseView addSubview:xibView];
    [baseView addOtherSubviews];
    return baseView;
}

//添加其他子视图使用
- (void)addOtherSubviews{
    
}





@end
