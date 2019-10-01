//
//  ETBadgeBtn.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/9/30.
//  Copyright © 2019 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETBadgeBtn : UIButton

@property (nonatomic, strong) UIButton *badgeValueView;
///设置右上角小红圈中的数字
- (void)setItemBadgeNumber:(NSInteger)number;
///显示小红圈
- (void)showBadge;
///隐藏小红圈
- (void)hideBadge;


@end

NS_ASSUME_NONNULL_END
