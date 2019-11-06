
//
//  SecondViewController.m
//  RACDemo
//
//  Created by Ethon.Z on 2019/4/23.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)clickBtn:(id)sender {
    //按钮被点击了
//    if (self.subject) {
        [self.subject sendNext:@"第二个控制器传递的数据"];
//    }
}

@end
