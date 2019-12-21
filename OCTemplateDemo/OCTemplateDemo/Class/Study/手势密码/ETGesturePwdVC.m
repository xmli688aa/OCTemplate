//
//  HomeViewController.m
//  PCGestureUnlock
//
//  Created by panchao on 2017/6/21.
//  Copyright © 2017年 coderMonkey. All rights reserved.
//

#import "ETGesturePwdVC.h"
#import "GestureViewController.h"
#import "GestureVerifyViewController.h"
#import "PCCircleViewConst.h"

@interface ETGesturePwdVC ()

@end

@implementation ETGesturePwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //PCGestureUnlock 目前最全面最高仿支付宝的手势解锁，而且提供方法进行参数修改，能解决项目开发中所有手势解锁的开发
    //https://github.com/iosdeveloperpanc/PCGestureUnlock
}
- (IBAction)setPwd:(id)sender {
    GestureViewController *gestureVc = [[GestureViewController alloc] init];
              gestureVc.type = GestureViewControllerTypeSetting;
              [self.navigationController pushViewController:gestureVc animated:YES];
}
- (IBAction)login:(id)sender {
    if ([[PCCircleViewConst getGestureWithKey:gestureFinalSaveKey] length]) {
        GestureViewController *gestureVc = [[GestureViewController alloc] init];
        [gestureVc setType:GestureViewControllerTypeLogin];
        [self.navigationController pushViewController:gestureVc animated:YES];
    } else {

        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"提示" message:@"暂未设置手势密码，是否前往设置？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *set = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            GestureViewController *gestureVc = [[GestureViewController alloc] init];
            gestureVc.type = GestureViewControllerTypeSetting;
            [self.navigationController pushViewController:gestureVc animated:YES];
        }];
        [alertVc addAction:cancel];
        [alertVc addAction:set];
        [self presentViewController:alertVc animated:YES
                         completion:nil];
    }
}
- (IBAction)check:(id)sender {
    GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
    [self.navigationController pushViewController:gestureVerifyVc animated:YES];

}
- (IBAction)update:(id)sender {
    GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
    gestureVerifyVc.isToSetNewGesture = YES;
    [self.navigationController pushViewController:gestureVerifyVc animated:YES];

}


@end
