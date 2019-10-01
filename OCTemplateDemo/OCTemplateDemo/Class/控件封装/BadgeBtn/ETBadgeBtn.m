//
//  ETBadgeBtn.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/30.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETBadgeBtn.h"

@implementation ETBadgeBtn

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat badgeValueViewWH = 20;
    CGFloat x = self.width - badgeValueViewWH/2;
    CGFloat y = - badgeValueViewWH/2;
    _badgeValueView.frame = CGRectMake(x, y,badgeValueViewWH, badgeValueViewWH);
    _badgeValueView.layer.cornerRadius = badgeValueViewWH/2;
    _badgeValueView.layer.masksToBounds = YES;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createBadgeValueView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self createBadgeValueView];
    }
    return self;
}

#pragma mark - 创建BadgeValueView
- (void)createBadgeValueView {
    _badgeValueView = [[UIButton alloc] init];
    [_badgeValueView setBackgroundColor:UIColor.redColor];
    _badgeValueView.titleLabel.font = [UIFont systemFontOfSize:10];
    [_badgeValueView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _badgeValueView.hidden = YES;
    [self addSubview:_badgeValueView];
}

#pragma mark - 设置小红圈里的数字
- (void)setItemBadgeNumber:(NSInteger)number{
    if (number != 0) {
        if (self.badgeValueView.hidden) {
            self.badgeValueView.hidden = NO;
        }
        [self.badgeValueView setTitle:[NSString stringWithFormat:@"%ld",(long)number] forState:(UIControlStateNormal)];
    }else{
        self.badgeValueView.hidden = YES;
    }
}
#pragma mark - 显示小红圈
- (void)showBadge{
    self.badgeValueView.hidden = NO;
}
#pragma mark - 隐藏小红圈
- (void)hideBadge{
    self.badgeValueView.hidden = YES;
}
@end
