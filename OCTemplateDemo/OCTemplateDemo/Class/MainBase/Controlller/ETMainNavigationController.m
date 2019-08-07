//
//  MainNavigationController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "ETMainNavigationController.h"

@interface ETMainNavigationController ()<UINavigationControllerDelegate>
@property (nonatomic, strong) id popDelegate;

@end

@implementation ETMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //set NavigationBar 背景颜色&title 颜色
    [self.navigationBar setBarTintColor:NaviBackGroundColour];
    [self.navigationBar  setBackgroundImage:[UIImage imageNamed:@"navi_bg"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    self.delegate = self;
    
}

//导航控制器跳转完成的时候调用
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
    {
        if (viewController == self.viewControllers[0]) { // 是根控制器
            //打开左侧抽屉
//            AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//            LeftSlideViewController *left = tempAppDelegate.LeftSlideVC;
//            [left setPanEnabled:YES];
            //还原滑动手势代理(不还原会出问题)
            self.interactivePopGestureRecognizer.delegate = _popDelegate;
        }else{ // 非根控制器
            //实现滑动返回功能(清空滑动返回手势的代理，就能实现)
            self.interactivePopGestureRecognizer.delegate = nil;
        }
    }
/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
    {
//        AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//        LeftSlideViewController *left = tempAppDelegate.LeftSlideVC;
        if (self.viewControllers.count > 0) { // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
            //设置不能打开左侧抽屉
//            [left setPanEnabled:NO];
            /* 自动显示和隐藏tabbar */
            viewController.hidesBottomBarWhenPushed = YES;
            /* 设置导航栏上面的内容 */
            // 设置左边的返回按钮
            UIButton *leftBtn = [[UIButton alloc] init];
            leftBtn.frame = CGRectMake(0, 0, 25 , 25);
            [leftBtn setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateNormal];
            [leftBtn setImage:[UIImage imageNamed:@"navi_back"] forState:UIControlStateSelected];
            [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
            
        }
        [super pushViewController:viewController animated:animated];
    }
    
- (void)back
{
    [self popViewControllerAnimated:YES];
}


@end
