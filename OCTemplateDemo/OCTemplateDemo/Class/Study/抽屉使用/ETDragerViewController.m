
//
//  ETDragerViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/10/15.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETDragerViewController.h"
#import "ETTestBaseViewVC.h"
@interface ETDragerViewController ()

@end

@implementation ETDragerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //如果想要在原始封装通用当中添加一些属性自己的业务逻辑,继承原来的类.自己的业务逻辑写到子类当中.
    ETTestBaseViewVC *tableVC = [[ETTestBaseViewVC alloc] init];
    tableVC.view.frame = self.mainV.bounds;
    //如果说一个控制器的View成为另一个控制器View的子控件.
    //那么当前控制器也要成为另一个控制器的子控制器.
    [self.mainV addSubview:tableVC.view];
    [self addChildViewController:tableVC];
    
    [self open];
    
    
}




@end
