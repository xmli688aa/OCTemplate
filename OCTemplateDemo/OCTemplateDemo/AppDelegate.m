//
//  AppDelegate.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "AppDelegate.h"
#import "ETTabbarViewController.h"
#import "ETMainNavigationController.h"
#import "ETLeftMenuViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import "ETGuidePagesViewController.h"

@interface AppDelegate ()

@property (nonatomic,strong) MMDrawerController * drawerController;

@end

@implementation AppDelegate

- (MMDrawerController *)drawerController{
    if (_drawerController == nil) {
        ETTabbarViewController *tabbarVC = [[ETTabbarViewController alloc] init];
        ETLeftMenuViewController *leftMenuViewController = [[ETLeftMenuViewController alloc] init];

        self.drawerController = [[MMDrawerController alloc]
                                 initWithCenterViewController:tabbarVC
                                 leftDrawerViewController:leftMenuViewController
                                 rightDrawerViewController:nil];
        [self.drawerController setShowsShadow:NO];
        [self.drawerController setRestorationIdentifier:@"MMDrawer"];
        [self.drawerController setMaximumLeftDrawerWidth:kScreenWidth -100];
        self.drawerController.shouldStretchDrawer = NO;
        [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
        [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
        [self.drawerController
         setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
             MMDrawerControllerDrawerVisualStateBlock block;
             block = [MMDrawerVisualState slideVisualStateBlock];//是否跟随视图移动
             if(block){
                 block(drawerController, drawerSide, percentVisible);
             }
         }];
        
    }
    return _drawerController;
}
- (void)setDrawerPanEnabled:(BOOL)drawerPanEnabled{
    _drawerPanEnabled = drawerPanEnabled;
    if (!_drawerPanEnabled) {
        [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
        [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeNone];
    }else{
        [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
        [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //设置跟视图控制器
    self.window.rootViewController = self.drawerController;
    //    ETTabbarViewController *tabbarVC = [[ETTabbarViewController alloc] init];

    //新手引导页
    if (ETGuidePagesViewController.isShow) {
        ETGuidePagesViewController *guidePageVC = [ETGuidePagesViewController new];
        self.window.rootViewController = guidePageVC;
        guidePageVC.clickBlock = ^{
            self.window.rootViewController = self.drawerController;
        };
    }
    [self.window makeKeyAndVisible];
//    [self sendRequestTest];

    return YES;
}
- (void)openDrawer{
    [self.drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];

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
