//
//  ETBaseView.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/18.
//  Copyright © 2019  . All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETDrinkBaseView : UIView

/**
 纯代码创建View
 */
+ (instancetype )loadViewWithFrame:(CGRect )frame;

/**
 xib创建视图
 */
+ (instancetype )loadXibWithFrame:(CGRect )frame;

/**
 子类重写 添加其他子控件
 */
- (void)addOtherSubviews;


@end

NS_ASSUME_NONNULL_END
