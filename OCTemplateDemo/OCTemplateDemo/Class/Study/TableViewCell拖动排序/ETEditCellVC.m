//
//  ETEditCellVC.m
//  DarkMode
//
//  Created by ET on 2020/12/4.
//  Copyright © 2020 https://github.com/wsl2ls   ----- . All rights reserved.
//

#import "ETEditCellVC.h"
#import "ETEditModel.h"
#import "ETEditTableViewCell.h"

@interface ETEditCellVC ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) BOOL beginEditing;
@property (nonatomic, strong) UIBarButtonItem *rightButtonItem;
@end


@implementation ETEditCellVC

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 50;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc] init];
        [_dataArray addObjectsFromArray:@[
            [[ETEditModel alloc] initWithTitle:@"编辑1"],
            [[ETEditModel alloc] initWithTitle:@"编辑2"],
            [[ETEditModel alloc] initWithTitle:@"编辑3"],
        ]];
    }
    return _dataArray;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    _beginEditing = NO;
    _rightButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"排序" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
    self.navigationItem.rightBarButtonItem = _rightButtonItem;
}

- (void)edit{
    self.beginEditing = !self.beginEditing;
    if (_beginEditing) {
        [self.tableView setEditing:YES animated:YES];
        //拖动的图片在自定义的cell中更换
        _rightButtonItem.title = @"完成";
    }else{
        _rightButtonItem.title = @"排序";
        [self.tableView setEditing:NO animated:YES];
    }
}

#pragma mark - UItableViewDataSource/UItableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETEditTableViewCell *cell = [ETEditTableViewCell cellWithTableView:tableView];
  
    ETEditModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}


-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return true;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
//    ETEditModel *mode = self.dataArray[sourceIndexPath.row];
//    [self.dataArray removeObject:mode];
//    [self.dataArray insertObject:mode atIndex:destinationIndexPath.row];
//    // 移动cell之后更换数据数组里的循序
    [self.dataArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    
}


@end
