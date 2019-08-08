//
//  AppDelegate.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "AppDelegate.h"
#import "ETTabbarViewController.h"
#import "RESideMenu.h"
#import "ETMainNavigationController.h"
#import "ETLeftMenuViewController.h"
@interface AppDelegate ()

@property (strong, nonatomic) RESideMenu *sideMenuViewController;

@end

@implementation AppDelegate

- (RESideMenu *)sideMenuViewController{
    if (_sideMenuViewController == nil) {
        ETTabbarViewController *tabbarVC = [[ETTabbarViewController alloc] init];
        ETLeftMenuViewController *leftMenuViewController = [[ETLeftMenuViewController alloc] init];
        _sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:tabbarVC leftMenuViewController:leftMenuViewController rightMenuViewController:nil];
        //    sideMenuViewController.delegate = self;
        //设置内容视图不缩放
        _sideMenuViewController.contentViewScaleValue = 1.0f;
        //侧滑出来的视图是否支持缩放
        _sideMenuViewController.scaleMenuView = NO;
//        _sideMenuViewController.menuViewControllerTransformation = CGAffineTransformMakeTranslation(-([UIScreen mainScreen].bounds.size.width / 2.f), 0);
        //是否显示阴影
        _sideMenuViewController.fadeMenuView = YES;
        //控制contentView显示范围
        _sideMenuViewController.contentViewInPortraitOffsetCenterX  = kScreenWidth/2 - 100;
        // 侧滑对象的视差是否开启
        _sideMenuViewController.parallaxEnabled = NO;
    }
    return _sideMenuViewController;
}
- (void)setDrawerPanEnabled:(BOOL)drawerPanEnabled{
    _drawerPanEnabled = drawerPanEnabled;
    [_sideMenuViewController setPanGestureEnabled:drawerPanEnabled];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //设置跟视图控制器
    self.window.rootViewController = self.sideMenuViewController;
//    ETTabbarViewController *tabbarVC = [[ETTabbarViewController alloc] init];
//    self.window.rootViewController = tabbarVC;
    [self.window makeKeyAndVisible];
//    [self sendRequestTest];

    return YES;
}
- (void)sendRequestTest{
    NSMutableDictionary *params = @{}.mutableCopy;
    
    NSString *url = @"users";
    ETHTTPManager *manager = [ETHTTPManager manager] ;
    manager.method = KYHTTPMethodGET;
    
    [manager sendRequestWithUrl:url parameters:params cache:YES  callBack:^(BOOL isCache, id  _Nullable response, NSError * _Nullable error) {
        if (isCache) {
            NSLog(@"缓存数据:%@",response);
        }else{
            NSLog(@"请求原始数据:%@",response);
        }
    } originCallBack:^(id  _Nullable response, NSError * _Nullable error) {
        NSLog(@"请求原始数据:%@",response);
        
    }];
    
}
- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window{
    
    if (_allowLandscape == YES) {   // 如果属性值为YES,仅允许屏幕向左旋转,否则仅允许竖屏
        return UIInterfaceOrientationMaskLandscapeRight;  // 这里是屏幕要旋转的方向
    }else{
        return (UIInterfaceOrientationMaskPortrait);
    }
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
