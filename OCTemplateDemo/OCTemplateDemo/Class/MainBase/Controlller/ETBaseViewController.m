//
//  ETBaseViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "ETBaseViewController.h"
#import "AppDelegate.h"
@interface ETBaseViewController ()
@property (assign, nonatomic) BOOL landscape;

@end

@implementation ETBaseViewController

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_landscape) {
     
        [self setNewOrientation:NO];
        //恢复右滑返回
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_landscape) {
        //禁用右滑返回
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    [self.navigationController.navigationBar setHidden:NO];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *title = NSStringFromClass([self class]);
    self.navigationItem.title = title;
}

#pragma mark - 横竖屏设置
- (void)setNewOrientation:(BOOL)landscape{
    _landscape = landscape;
    if (landscape) {
        AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appDelegate.allowLandscape = YES;//APP横屏
        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    }else{
        AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appDelegate.allowLandscape = NO;//关闭横屏仅允许竖屏
        
        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    }
}

#pragma mark - 状态栏设置
//设置样式
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
//设置是否隐藏
- (BOOL)prefersStatusBarHidden {
//    return NO;
    return _landscape;
}
//状态栏隐藏动画
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationNone;
}

@end
