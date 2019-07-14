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

/*常用的宏定义*/
#define KDSRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define UIColorFromHex(s) [UIColor colorWithRed:(((s & 0xFF0000) >> 16 )) / 255.0 green:((( s & 0xFF00 ) >> 8 )) / 255.0 blue:(( s & 0xFF )) / 255.0 alpha:1.0]
#define NaviBackGroundColour       KDSRGBColor(69, 133, 174)
#define ButtonBackGroundColour       KDSRGBColor(52, 115, 160)


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
