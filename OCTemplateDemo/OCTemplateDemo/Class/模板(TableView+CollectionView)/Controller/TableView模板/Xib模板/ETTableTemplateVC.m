//
//  ETTableTemplateVC.m
//  OCTemplateDemo
//
//  Created by Ethon on 2019/10/13.
//  Copyright © 2019 zhao. All rights reserved.
//

#import "ETTableTemplateVC.h"
#import "TableTemplateCell.h"

@interface ETTableTemplateVC ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation ETTableTemplateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 105;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableTemplateCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TableTemplateCell"];
    
}
#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableTemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableTemplateCell"];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    view.backgroundColor = UIColor.lightGrayColor;
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20;
}


@end
