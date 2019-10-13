//
//  ETTabbarViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "ETTabbarViewController.h"
#import "LockViewController.h"
#import "ETAboutVC.h"
#import "ETYouHuiVC.h"
#import "MineViewController.h"
#import "ETMainNavigationController.h"
#import "ETCustomTabbar.h"
#import "AppDelegate.h"

@interface ETTabbarViewController ()

@end

@implementation ETTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 利用KVO来使用自定义的tabBar
    [self setValue:[[ETCustomTabbar alloc] init] forKey:@"tabBar"];

    // 1.初始化子控制器
    [self addChildViewControllers];
}
- (void)addChildViewControllers{
    LockViewController *lockVC = [LockViewController new];
    ETAboutVC *catEyeVC = [ETAboutVC new];
    ETYouHuiVC *gatewayVC = [ETYouHuiVC new];
    MineViewController *mineVC = [[MineViewController alloc] init];
    [self addChildVc:lockVC title:@"首页" image:@"tabbar_mylock_normal" selectedImage:@"tabbar_mylock_select"];
    [self addChildVc:catEyeVC title:@"关于" image:@"tabbar_mycateye_normal" selectedImage:@"tabbar_mycateye_select"];
    [self addChildVc:gatewayVC title:@"优惠" image:@"tabbar_mygateway_normal" selectedImage:@"tabbar_mygateway_select"];
    [self addChildVc:mineVC title:@"我的" image:@"tabbar_mine_normal" selectedImage:@"tabbar_mine_select"];

}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    // 设置子控制器的文字
    childVc.title = title;
    childVc.tabBarItem.title = title;
    // 设置子控制器的图片
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(-3, 0, 3,0);
    //设置tabBarItem文字大小和颜色
//    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kRGB(102,102,102),NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
//    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kRGB(223,65,51),NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    ETMainNavigationController *nav = [[ETMainNavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:nav];
}


@end
