//
//  ShaiziViewController.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/20.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ShaiziHomeVC.h"
#import "ShaiziGameVC.h"

@interface ShaiziHomeVC ()

@end

@implementation ShaiziHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self hideNaVigationViewRightItem];
}
///789
- (IBAction)goto789Game:(id)sender {
    ShaiziGameVC *gameVC = [ShaiziGameVC new];
    gameVC.gameType = Game_789;
    [self.navigationController pushViewController:gameVC animated:YES];
}
///猜大小
- (IBAction)gotoBigOrSmall:(id)sender {
    ShaiziGameVC *gameVC = [ShaiziGameVC new];
    gameVC.gameType = Game_BigOrSmall;
    [self.navigationController pushViewController:gameVC animated:YES];
}
///大话
- (IBAction)gotoDahua:(id)sender {
    ShaiziGameVC *gameVC = [ShaiziGameVC new];
    gameVC.gameType = Game_Dahua;
    [self.navigationController pushViewController:gameVC animated:YES];
}

@end
