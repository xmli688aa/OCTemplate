//
//  GatewayViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "GatewayViewController.h"
#import "ETSearchContentView.h"
#import "ETSearchTitleView.h"
#import "ETSearchViewController.h"

@interface GatewayViewController ()<ETSearchTitleViewDelegate>
@property (nonatomic, strong) ETSearchTitleView *titleView;
@property (nonatomic, strong) ETSearchContentView *searchContentView;
@end

@implementation GatewayViewController

- (ETSearchContentView *)searchContentView{
    if (_searchContentView == nil) {
        _searchContentView = [ETSearchContentView loadXibWithFrame:CGRectMake(0, kStatusBarHeight+50, kScreenWidth, kScreenHeight - kStatusBarHeight -50)];
    }
    return _searchContentView;
}
- (ETSearchTitleView *)titleView{
    if (_titleView == nil) {
        _titleView = [ETSearchTitleView loadViewWithFrame:CGRectMake(0, 0, kScreenWidth, kStatusBarHeight +50)];
        _titleView.deleagete = self;
        _titleView.funType = RightBtnType_Publish;
    }
    return _titleView;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleView];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
#pragma ETSearchTitleViewDelegate
- (void)textFieldDidBeginEditing{
    NSLog(@"开始了");
//    [self.view addSubview:self.searchContentView];
    [self.navigationController pushViewController:[ETSearchViewController new] animated:NO];

}
- (void)textFieldInputString:(NSString *)inputString{
    NSLog(@"输出的字符串:%@",inputString);
    [self.searchContentView updateSearchContent:inputString];    
}

@end
