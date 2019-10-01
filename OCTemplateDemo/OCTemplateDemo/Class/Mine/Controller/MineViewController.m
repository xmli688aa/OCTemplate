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
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation MineViewController

- (NSArray *)dataArray{
    if (_dataArray == nil) {
         _dataArray = @[
                          @[@"关于本机",@"软件更新"],
                          @[@"隔空投送",@"接力",@"多程序与程序坞"],
                          @[@"辅助功能"],
                          @[@"关于本机",@"软件更新"],
                          @[@"关于本机",@"软件更新"],
                          @[@"隔空投送",@"接力",@"多程序与程序坞"],
                          @[@"多程序与程序坞多程序坞"],
                          ];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    //tableView高度自适应
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 60;
    [self.tableView registerNib:[UINib nibWithNibName:@"ETCornerCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"ETCornerCell"];
}
#pragma mark - 进入横屏
- (IBAction)gotoLandscapeVC:(id)sender {
    [self.navigationController pushViewController:[ETLandscapeVC new] animated:YES];
//    [self presentViewController:[ETLandscapeVC new] animated:YES completion:nil];

}
#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *sectionArray = self.dataArray[section];

    return sectionArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETCornerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ETCornerCell" ];
    NSArray *sectionArray = self.dataArray[indexPath.section];
    NSString *title = sectionArray[indexPath.row];
//    cell.backgroundColor = UIColor.blueColor;
    cell.titleLb.text = title;
    cell.titleLb.textColor = [UIColor redColor];
#warning todo
    //涉及到cell的复用时 会出现问题
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
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 70;
//}

@end
