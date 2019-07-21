//
//  ETSearchViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/21.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETSearchViewController.h"
#import "ETSearchTitleView.h"
@interface ETSearchViewController ()<ETSearchTitleViewDelegate>
@property (nonatomic, strong) ETSearchTitleView *titleView;

@end

@implementation ETSearchViewController
- (ETSearchTitleView *)titleView{
    if (_titleView == nil) {
        _titleView = [ETSearchTitleView loadViewWithFrame:CGRectMake(0, 0, kScreenWidth, kStatusBarHeight +50)];
        _titleView.deleagete = self;
        _titleView.funType = RightBtnType_Cancel;

    }
    return _titleView;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleView];
}
#pragma mark ETSearchTitleViewDelegate
- (void)didClickRightBtn:(RightBtnType)funType{
    if (funType == RightBtnType_Cancel) {
        [self.navigationController popViewControllerAnimated:NO];

    }

}
@end
