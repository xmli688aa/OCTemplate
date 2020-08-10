//
//  ETCodeTemplateVC.m
//  OCTemplateDemo
//
//  Created by zhaowz on 2020/8/10.
//  Copyright © 2020 zhao. All rights reserved.
//

#import "ETCodeTemplateVC.h"
#import "ETCodeTemplateCell.h"

@interface ETCodeTemplateVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ETCodeTemplateVC

- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, kScreenWidth, kScreenHeight-kNavBarHeight) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.view).mas_offset(kNavBarHeight);
//            make.left.right.bottom.equalTo(self.view).mas_offset(0);
//        }];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ETCodeTemplateCell *cell = [ETCodeTemplateCell cellWithTableView:tableView];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    KDSLog(@"点击了第%ld行",(long)indexPath.row);
}
@end
