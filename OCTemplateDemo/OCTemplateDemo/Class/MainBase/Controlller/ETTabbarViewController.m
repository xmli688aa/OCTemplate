//
//  ETTabbarViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETTabbarViewController.h"
#import "LockViewController.h"
#import "MyCatEyeViewController.h"
#import "GatewayViewController.h"
#import "MineViewController.h"
#import "ETMainNavigationController.h"



@interface ETTabbarViewController ()

@end

@implementation ETTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.初始化子控制器
    [self addChildViewControllers];
}
- (void)addChildViewControllers{
    LockViewController *lockVC = [LockViewController new];
    MyCatEyeViewController *catEyeVC = [MyCatEyeViewController new];
    GatewayViewController *gatewayVC = [GatewayViewController new];
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
    // 先给外面传进来的小控制器 包装 一个导航控制器
    ETMainNavigationController *nav = [[ETMainNavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:nav];
}
    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
