//
//  MineViewController.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/7/14.
//  Copyright © 2019  . All rights reserved.
//

#import "MineViewController.h"
#import "ETLandscapeVC.h"
#import "ETCornerCell.h"
@interface MineViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = @[
                   @[@"关于本机",@"软件更新"],
                   @[@"隔空投送",@"接力",@"多程序与程序坞"],
                   @[@"辅助功能"],
                   @[@"关于本机",@"软件更新"],
                   @[@"关于本机",@"软件更新"],
                   @[@"隔空投送",@"接力",@"多程序与程序坞"],
                   @[@"隔空投送",@"接力",@"多程序与程序坞"],
                   @[@"隔空投送",@"接力",@"多程序与程序坞"],
                   @[@"隔空投送",@"接力",@"多程序与程序坞"],

                   ];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}
- (IBAction)gotoLandscapeVC:(id)sender {
    [self.navigationController pushViewController:[ETLandscapeVC new] animated:YES];
//    [self presentViewController:[ETLandscapeVC new] animated:YES completion:nil];

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return _dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *sectionArray = self.dataArray[section];

    return sectionArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETCornerCell *cell = [ETCornerCell xibCellWithTableView:tableView ];
    NSArray *sectionArray = self.dataArray[indexPath.section];
    NSString *title = sectionArray[indexPath.row];
    cell.textLabel.text = title;
    if (sectionArray.count == 1 ){
        cell.postion = Solo;
    } else if (indexPath.row == 0) {
        cell.postion = First;
    } else if (indexPath.row == sectionArray.count - 1) {
        cell.postion = Last;
    } else {
        cell.postion = Middle;
    }
    
    return cell;
}

@end
