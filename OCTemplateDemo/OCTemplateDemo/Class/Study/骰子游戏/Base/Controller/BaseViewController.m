
//
//  BaseViewController.m
//  DrinkGame
//
//  Created by Ethon.Z on 2019/8/20.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "BaseViewController.h"
#import "NavigationView.h"
#import "Masonry.h"

@interface BaseViewController ()
@property (strong, nonatomic) NavigationView *navigationView;
@end

@implementation BaseViewController


- (NavigationView *)navigationView{
    if (_navigationView == nil) {
         CGRect naviF = CGRectMake(0, StatusBarHeight, kScreenWidth, 44);
        _navigationView = [NavigationView loadXibWithFrame:naviF];
        __weak __typeof(self)weakSelf = self;
        self.navigationView.clickBlock = ^(ClickType type) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            switch (type) {
                case Click_Back:
                    [strongSelf clickBack];
                    break;
                case Click_Set:
                    [strongSelf clickSet];
                    break;
                case Click_Mine:
                    break;
                default:
                    break;
            }
        };
       
    }
    return _navigationView;
}

- (void)clickBack{
      [self.navigationController popViewControllerAnimated:YES];
}
- (void)clickSet{
    NSLog(@"点击了设置");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    [self.view addSubview:self.navigationView];
    [self.navigationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@StatusBarHeight);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@44);
    }];

    NSLog(@"%@",self.navigationView);
}
- (void)setNavigationRightItemImage:(NSString *)imageName{
    [self.navigationView.rightItem setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)hideNaVigationViewRightItem{
    self.navigationView.rightItem.hidden = YES;
}
- (void)hideNavigationView{
    self.navigationView.hidden = YES;
}

- (void)showNaVigationView{
    self.navigationView.hidden = NO;

}

- (void)dealloc{
    NSLog(@"%@销毁了",self);
}


@end
