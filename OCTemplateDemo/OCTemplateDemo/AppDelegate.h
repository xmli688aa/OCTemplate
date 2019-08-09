//
//  AppDelegate.h
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


/**
 是否强制横屏 YES强制横屏
 */
@property (assign, nonatomic) BOOL allowLandscape;

/**
 抽屉手势 YES开启 NO关闭
 */
@property (assign, nonatomic) BOOL drawerPanEnabled;

/**
 开启抽屉
 */
- (void)openDrawer;


@end

