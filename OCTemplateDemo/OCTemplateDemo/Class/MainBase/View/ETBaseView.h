//
//  ETBaseView.h
//  OCTemplateDemo
//
//  Created by Ethon.Z on 2019/7/18.
//  Copyright © 2019 zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ETBaseView : UIView

/**
 纯代码创建View
 */
+ (instancetype )loadViewWithFrame:(CGRect )frame;

/**
 初始化UI控件(如添加子控件)
 */
- (void)setUI;

/**
 xib创建视图
 */
+ (instancetype )loadXibWithFrame:(CGRect )frame;

@end

NS_ASSUME_NONNULL_END
