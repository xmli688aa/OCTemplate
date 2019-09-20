//
//  BaseViewController.h
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/20.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController
///显示导航栏
- (void)showNaVigationView;
///隐藏导航栏右边按钮
- (void)hideNaVigationViewRightItem;
///隐藏导航栏
- (void)hideNavigationView;
///设置导航栏右侧按钮的图片
- (void)setNavigationRightItemImage:(NSString *)imageName;

///点击了设置 由子控制器重写
- (void)clickSet;

@end

NS_ASSUME_NONNULL_END
