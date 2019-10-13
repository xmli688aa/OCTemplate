//
//  GatewayViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "ETYouHuiVC.h"
#import "UIBarButtonItem+ETExtension.h"
#import "ETTableTemplateVC.h"
#import "ETCollectionTemplateVC.h"

@interface ETYouHuiVC ()
@property (nonatomic, strong) UIBarButtonItem *rightItem;
@end

@implementation ETYouHuiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviItem];

}
- (void)setNaviItem{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTitle:nil target:self action:@selector(clickLeft) image:@"tab_message_click"];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithTitle:@"编辑" target:self action:@selector(clickRight) image:nil];
        _rightItem = rightItem;
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)clickRight{
    NSLog(@"点击右上角");
    self.rightItem.insideBtn.selected = !self.rightItem.insideBtn.selected;
    if (self.rightItem.insideBtn.selected) {
        [self.rightItem.insideBtn setTitle:@"完成" forState:UIControlStateNormal];
    }else{
        [self.rightItem.insideBtn setTitle:@"编辑" forState:UIControlStateNormal];
    }
}
- (void)clickLeft{
    NSLog(@"点击左上角");
}

#pragma mark - 进入tableView模板控制器
- (IBAction)tableViewTemplate:(id)sender {
    [self.navigationController pushViewController:[ETTableTemplateVC new] animated:YES];
}
#pragma mark - 进入collection模板控制器

- (IBAction)collectionTemplate:(id)sender {
    
    [self.navigationController pushViewController:[ETCollectionTemplateVC new] animated:YES];
}

@end
