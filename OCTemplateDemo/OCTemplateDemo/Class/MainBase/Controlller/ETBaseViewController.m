//
//  ETBaseViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
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
        AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appDelegate.allowLandscape = NO;//关闭横屏仅允许竖屏
        [self setNewOrientation:NO];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)setNewOrientation:(BOOL)landscape{
    
    _landscape = landscape;
    if (landscape) {
        AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        appDelegate.allowLandscape = YES;//APP横屏
        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    }else{

        NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationPortrait];
        [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    }
}

@end
