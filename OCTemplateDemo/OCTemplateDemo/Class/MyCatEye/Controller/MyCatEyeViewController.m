//
//  MyCatEyeViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019   All rights reserved.
//

#import "MyCatEyeViewController.h"
#import "AppDelegate.h"
@interface MyCatEyeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation MyCatEyeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //由于UIFont+ETFontSize分类 label在不同尺寸的手机上 字体大小会改变
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 300, 30)];
    label.text = @"测试我的字体大小";
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
    NSLog(@"%f",label.font.pointSize);
    NSLog(@"%f",self.label.font.pointSize);

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 80, 44)];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.resumeEventInterval = 4;
}
- (void)click{
    NSLog(@"点击");
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate openDrawer];
    
}



@end
