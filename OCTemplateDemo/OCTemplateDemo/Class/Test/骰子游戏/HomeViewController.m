//
//  HomeViewController.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/20.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "HomeViewController.h"
#import "ShaiziHomeVC.h"
#import "NavigationView.h"
#import "DaZhuanPanVC.h"
#import "TruthOrDareVC.h"
#import "RenSongVC.h"
#import "IQKeyboardManager.h"

@implementation HomeViewController

- (instancetype)init{
    if (self = [super init]) {
        [self configIQKeyboardManager];

    }
    return self;
}
- (void)configIQKeyboardManager {
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [[IQKeyboardManager sharedManager] setShouldResignOnTouchOutside:YES];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //隐藏导航栏
    [self hideNavigationView];
}
///骰子游戏
- (IBAction)clickSaiziGame:(id)sender {
    [self.navigationController pushViewController:[ShaiziHomeVC new] animated:YES];
    
}
///真心话
- (IBAction)clickTrueWords:(id)sender {
    [self.navigationController pushViewController:[TruthOrDareVC new] animated:YES];
}
///认怂
- (IBAction)clickRenSong:(id)sender {
    
    [self.navigationController pushViewController:[RenSongVC new] animated:YES];

}
///大转盘
- (IBAction)clickDaZhuanpan:(id)sender {
    [self.navigationController pushViewController:[DaZhuanPanVC new] animated:YES];

}
@end
