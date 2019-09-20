//
//  LockViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019    All rights reserved.
//

#import "LockViewController.h"
#import "ETTestBaseViewVC.h"
#import "ETNewsViewController.h"
#import "UIImage+ResszingImage.h"
#import "ETDragViewController.h"
#import "ETHomeViewController.h"
#import "ETRunTimeVC.h"
#import "HomeViewController.h"

@interface LockViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

//@property (nonatomic, strong) ETWordRollView *wordView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@end

@implementation LockViewController
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        [_dataArray addObject:@"ETTestBaseViewVC"];
        //popView自定义
        [_dataArray addObject:@"ETHomeViewController"];
        
        [_dataArray addObject:@"ETDragViewController"];
        [_dataArray addObject:@"ETNewsViewController"];
        [_dataArray addObject:@"ETLandscapeVC"];
        [_dataArray addObject:@"ETRunTimeVC"];
        [_dataArray addObject:@"HomeViewController"];

    }
    return _dataArray;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *vcName = self.dataArray[indexPath.row];
    Class class = NSClassFromString(vcName);
    UIViewController *vc = [[class alloc] init];
    if ([vc isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        NSLog(@"控制器不存在");
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

@end
