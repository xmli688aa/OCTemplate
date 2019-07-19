//
//  LockViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "LockViewController.h"
#import "ETTestViewController.h"
@interface LockViewController ()

//@property (nonatomic, strong) ETWordRollView *wordView;

@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.navigationController pushViewController:[ETTestViewController new] animated:YES];
}
@end
