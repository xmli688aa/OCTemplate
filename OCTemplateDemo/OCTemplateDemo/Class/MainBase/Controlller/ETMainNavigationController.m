//
//  MainNavigationController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETMainNavigationController.h"

@interface ETMainNavigationController ()

@end

@implementation ETMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //set NavigationBar 背景颜色&title 颜色
    [self.navigationBar setBarTintColor:NaviBackGroundColour];
    [self.navigationBar  setBackgroundImage:[UIImage imageNamed:@"navi_bg"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
