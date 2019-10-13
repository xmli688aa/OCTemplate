//
//  GatewayViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "ETYouHuiVC.h"
#import "UIBarButtonItem+ETExtension.h"


@interface ETYouHuiVC ()


@end

@implementation ETYouHuiVC


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviItem];

}
- (void)setNaviItem{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTitle:nil target:self action:@selector(clickLeft) image:@"tab_message_click"];
     //    _rightItem = rightItem;
     self.navigationItem.leftBarButtonItem = leftItem;
    
    
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithTitle:@"添加" target:self action:@selector(clickRight) image:nil];
    //    _rightItem = rightItem;
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)clickRight{
    NSLog(@"点击右上角");
}
- (void)clickLeft{
    NSLog(@"点击左上角");
}


@end
