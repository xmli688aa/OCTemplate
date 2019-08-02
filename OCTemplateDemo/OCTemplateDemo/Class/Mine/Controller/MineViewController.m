//
//  MineViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "MineViewController.h"
#import "ETLandscapeVC.h"
@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}
- (IBAction)gotoLandscapeVC:(id)sender {
    [self.navigationController pushViewController:[ETLandscapeVC new] animated:YES];
//    [self presentViewController:[ETLandscapeVC new] animated:YES completion:nil];

}

@end
